/**
 * Beacon E73 (EBYTE E73 series - nRF52840/nRF52833) cho hệ chỉ đường bệnh viện.
 * Board core: Adafruit nRF52 (Bluefruit).
 *
 * Hành vi:
 *  - Bình thường: PHÁT quảng bá connectable 5 lần/giây (interval 200ms).
 *    Radio tự mở cửa sổ nghe (~vài trăm µs) NGAY SAU MỖI GÓI PHÁT để nhận yêu cầu
 *    kết nối (SoftDevice lo, chuẩn BLE) -> điện thoại luôn kết nối được để nạp code/ghi ID.
 *  - Khi có kết nối BLE (nạp code DFU hoặc ghi config): SoftDevice tự NGƯNG PHÁT,
 *    beacon chỉ nhận dữ liệu. Ngắt kết nối / nạp xong -> tự về phát 5 lần/giây.
 *  - Không có vòng quét (Scanner) riêng: quét chỉ để nghe quảng bá của thiết bị khác,
 *    không phục vụ tính năng nào mà ngốn ~650µA -> đã bỏ để pin chạy được nhiều năm.
 *  - Nạp lần đầu qua SWD (J-Link OB ARM V8): SWDIO = chân 37, SWCLK = chân 39.
 *    Các lần sau nạp OTA qua BLE (service DFU của bootloader Adafruit).
 *
 * ID phân cấp (bệnh viện / tòa / khoa / tầng / stt) phát trong Manufacturer
 * Specific Data, company ID 0x0059 (Nordic), payload 13 byte:
 *   [0] magic 0xE7 | [1] version 0x01 | [2-5] hospitalCode u32 BE
 *   [6] buildingCode u8 | [7] deptCode u8 | [8] floorCode i8
 *   [9-10] idx u16 BE | [11] txPower i8 (@1m) | [12] battery u8 (0xFF = n/a)
 *
 * Gán/sửa ID qua BLE không cần cắm dây: ghi 13 byte payload vào characteristic
 * E7300002-... (dùng nRF Connect + tools/make-config-payload.mjs), lưu vào
 * InternalFS, áp dụng ngay khi ngắt kết nối. Đọc ID: xem quảng bá (mfg data),
 * tên thiết bị "E73-...", hoặc đọc characteristic config.
 * (Không dùng UART để tiết kiệm pin - UARTE bật sẽ giữ HFCLK, ngốn ~0.5-1mA.)
 */

#include <bluefruit.h>
#include <Adafruit_LittleFS.h>
#include <InternalFileSystem.h>

using namespace Adafruit_LittleFS_Namespace;

// ---------- Định dạng payload ----------
#define E73_MAGIC          0xE7
#define E73_VERSION        0x01
#define E73_PAYLOAD_LEN    13
#define E73_COMPANY_ID     0x0059  // Nordic Semiconductor

#define CONFIG_FILENAME    "/beacon.cfg"

// Chu kỳ phát: 5 lần/giây (sau mỗi gói phát radio tự nghe yêu cầu kết nối)
#define ADV_INTERVAL_UNITS 320     // 320 * 0.625ms = 200ms -> 5 quảng bá/giây

// Service cấu hình ID qua BLE
const uint8_t CONFIG_SERVICE_UUID[16] = {
  0x01, 0x00, 0xAC, 0xBE, 0x73, 0x6E, 0x6D, 0x9C,
  0x2A, 0x4E, 0xB0, 0x8C, 0x01, 0x00, 0x30, 0xE7
}; // E7300001-8CB0-4E2A-9C6D-6E73BEAC0001 (little-endian)
const uint8_t CONFIG_CHAR_UUID[16] = {
  0x01, 0x00, 0xAC, 0xBE, 0x73, 0x6E, 0x6D, 0x9C,
  0x2A, 0x4E, 0xB0, 0x8C, 0x02, 0x00, 0x30, 0xE7
}; // E7300002-8CB0-4E2A-9C6D-6E73BEAC0001

BLEDfu bledfu;   // OTA DFU qua BLE (bootloader Adafruit)
BLEDis bledis;   // Device Information
BLEService configService(CONFIG_SERVICE_UUID);
BLECharacteristic configChar(CONFIG_CHAR_UUID);

// Payload hiện hành (mặc định: chưa gán - hospital 0, tòa 0, khoa 0, tầng 0, stt 0)
uint8_t payload[E73_PAYLOAD_LEN] = {
  E73_MAGIC, E73_VERSION,
  0x00, 0x00, 0x00, 0x00,  // hospitalCode
  0x00,                    // buildingCode
  0x00,                    // deptCode
  0x00,                    // floorCode
  0x00, 0x00,              // idx
  (uint8_t)(-59),          // txPower @1m
  0xFF                     // battery không rõ
};

volatile bool connected = false;      // đang có kết nối (chế độ chỉ nhận dữ liệu)
volatile bool configDirty = false;    // config mới, áp dụng khi ngắt kết nối
char deviceName[48];

// ---------- TAM: cot moc debug doc qua SWD (se xoa sau khi xong) ----------
volatile uint32_t dbgTrace[6] = {0x11111111, 0, 0, 0, 0, 0};

// ---------- Lưu / đọc config từ internal flash ----------
void loadConfig() {
  File f(InternalFS);
  if (f.open(CONFIG_FILENAME, FILE_O_READ)) {
    uint8_t buf[E73_PAYLOAD_LEN];
    int n = f.read(buf, sizeof(buf));
    f.close();
    if (n == E73_PAYLOAD_LEN && buf[0] == E73_MAGIC && buf[1] == E73_VERSION) {
      memcpy(payload, buf, E73_PAYLOAD_LEN);
      Serial.println("[CFG] Da nap config tu InternalFS");
      return;
    }
  }
  Serial.println("[CFG] Chua co config - dung ID mac dinh (chua gan)");
}

void saveConfig(const uint8_t* buf) {
  InternalFS.remove(CONFIG_FILENAME);
  File f(InternalFS);
  if (f.open(CONFIG_FILENAME, FILE_O_WRITE)) {
    f.write(buf, E73_PAYLOAD_LEN);
    f.close();
    Serial.println("[CFG] Da luu config moi");
  } else {
    Serial.println("[CFG] LOI: khong mo duoc file config");
  }
}

void buildDeviceName() {
  uint32_t hosp = ((uint32_t)payload[2] << 24) | ((uint32_t)payload[3] << 16) |
                  ((uint32_t)payload[4] << 8) | payload[5];
  uint16_t idx = ((uint16_t)payload[9] << 8) | payload[10];
  snprintf(deviceName, sizeof(deviceName), "E73-%lu-B%02u-K%02u-F%02d-%04u",
           (unsigned long)hosp, payload[6], payload[7], (int8_t)payload[8], idx);
}

// ---------- Quảng bá ----------
void setupAdvertising() {
  Bluefruit.Advertising.stop();
  Bluefruit.Advertising.clearData();
  Bluefruit.ScanResponse.clearData();

  Bluefruit.Advertising.addFlags(BLE_GAP_ADV_FLAGS_LE_ONLY_GENERAL_DISC_MODE);

  // Manufacturer Specific Data = company ID (LE) + payload 13 byte
  uint8_t mfg[2 + E73_PAYLOAD_LEN];
  mfg[0] = E73_COMPANY_ID & 0xFF;
  mfg[1] = (E73_COMPANY_ID >> 8) & 0xFF;
  memcpy(&mfg[2], payload, E73_PAYLOAD_LEN);
  Bluefruit.Advertising.addData(BLE_GAP_AD_TYPE_MANUFACTURER_SPECIFIC_DATA, mfg, sizeof(mfg));

  buildDeviceName();
  Bluefruit.setName(deviceName);
  Bluefruit.ScanResponse.addName();

  Bluefruit.Advertising.restartOnDisconnect(false); // tự quản lý trong callback
  Bluefruit.Advertising.setInterval(ADV_INTERVAL_UNITS, ADV_INTERVAL_UNITS); // 200ms -> 5 lan/giay
  Bluefruit.Advertising.setFastTimeout(0);
  bool advOk = Bluefruit.Advertising.start(0); // 0 = khong timeout
  dbgTrace[2] = advOk ? 0x600D0002 : 0xBAD00002;
  dbgTrace[3] = Bluefruit.Advertising.isRunning() ? 0x600D0003 : 0xBAD00003;

  Serial.print("[ADV] Phat 5 lan/giay: ");
  Serial.println(deviceName);
}

// ---------- Áp dụng config mới (từ BLE) ----------
void applyConfig(const uint8_t* buf) {
  memcpy(payload, buf, E73_PAYLOAD_LEN);
  saveConfig(payload);
  configChar.write(payload, E73_PAYLOAD_LEN);
  if (connected) {
    configDirty = true; // đang có kết nối BLE -> áp dụng khi ngắt
  } else {
    setupAdvertising(); // áp dụng ngay vào quảng bá
  }
}

// ---------- Kết nối: chế độ chỉ nhận dữ liệu khi nạp code / ghi config ----------
void onConnect(uint16_t connHandle) {
  connected = true;
  // SoftDevice tự ngừng quảng bá khi có kết nối -> chỉ còn nhận dữ liệu
  Serial.println("[BLE] Co ket noi (DFU/config) -> NGUNG PHAT, chi nhan du lieu");
  (void)connHandle;
}

void onDisconnect(uint16_t connHandle, uint8_t reason) {
  connected = false;
  Serial.print("[BLE] Ngat ket noi (reason=");
  Serial.print(reason);
  Serial.println(") -> khoi phuc phat 5 lan/giay");
  if (configDirty) {
    configDirty = false;
    Serial.println("[CFG] Ap dung config moi vao quang ba");
  }
  setupAdvertising(); // rebuild voi payload hien hanh
  (void)connHandle;
}

// ---------- Ghi config qua BLE ----------
void onConfigWrite(uint16_t connHandle, BLECharacteristic* chr, uint8_t* data, uint16_t len) {
  if (len != E73_PAYLOAD_LEN || data[0] != E73_MAGIC || data[1] != E73_VERSION) {
    Serial.println("[CFG] Payload khong hop le (can 13 byte, magic 0xE7, version 0x01)");
    return;
  }
  applyConfig(data); // đang kết nối nên sẽ áp dụng khi ngắt
  (void)connHandle;
  (void)chr;
}

void setupConfigService() {
  configService.begin();

  configChar.setProperties(CHR_PROPS_READ | CHR_PROPS_WRITE);
  configChar.setPermission(SECMODE_OPEN, SECMODE_OPEN);
  configChar.setFixedLen(E73_PAYLOAD_LEN);
  configChar.setWriteCallback(onConfigWrite);
  configChar.begin();
  configChar.write(payload, E73_PAYLOAD_LEN);
}

void setup() {
  dbgTrace[0] = 0xCAFEBABE; // da vao setup()
  Serial.begin(115200);
  delay(500);
  Serial.println("=== Beacon E73 (nRF52840) - Hospital Wayfinding ===");

  InternalFS.begin();
  loadConfig();

  bool sdOk = Bluefruit.begin(1, 0); // 1 ket noi peripheral (DFU/config), 0 central
  dbgTrace[1] = sdOk ? 0x600D0001 : 0xBAD00001;
  Bluefruit.setTxPower(4);
  Bluefruit.Periph.setConnectCallback(onConnect);
  Bluefruit.Periph.setDisconnectCallback(onDisconnect);

  bledfu.begin();  // PHAI begin truoc cac service khac de OTA DFU hoat dong
  bledis.setManufacturer("EBYTE E73 / Hospital Wayfinding");
  buildDeviceName();
  bledis.setModel(deviceName);
  bledis.begin();

  setupConfigService();
  setupAdvertising();

  Serial.println("[OK] Phat 5 lan/giay (connectable - san sang nhan ket noi nap code/ghi ID)");

  dbgTrace[4] = 0xDEADBEEF; // da chay het setup()

  // Mọi việc đều chạy bằng callback của SoftDevice -> tạm dừng task loop
  // để CPU ngủ sâu tối đa, tiết kiệm pin.
  suspendLoop();
}

void loop() {
  // không dùng - đã suspendLoop(), toàn bộ xử lý nằm trong callback BLE
}
