# Beacon E73 — Hướng dẫn nạp code & gán ID

Firmware cho module **EBYTE E73 series (nRF52840 / nRF52833)**, thay thế ESP32-C6.
Board core: **Adafruit nRF52** (Arduino).

## Hành vi firmware

| Trạng thái | Hành vi |
|---|---|
| Bình thường | **Phát 5 lần/giây** (interval 200ms, connectable). Sau MỖI gói phát, radio tự mở cửa sổ nghe (~vài trăm µs, chuẩn BLE) để nhận yêu cầu kết nối — nên điện thoại luôn kết nối được để nạp code/ghi ID |
| Có kết nối BLE (nạp code DFU / ghi config) | **Tự ngưng phát — chỉ nhận dữ liệu** |
| Nạp xong / ngắt kết nối | Tự về phát 5 lần/giây |

> Không có vòng quét (Scanner) định kỳ: quét chỉ để nghe quảng bá của thiết bị khác,
> không phục vụ tính năng nào mà ngốn ~650 µA — đã bỏ để pin chạy được nhiều năm.

## 1. Nạp lần đầu — J-Link OB ARM V8 (SWD)

Nối 4 dây giữa J-Link OB và module E73:

| J-Link OB V8 | Module E73 | Ghi chú |
|---|---|---|
| VCC (3.3V) | VCC | **KHÔNG dùng 5V** |
| GND | GND | |
| SWDIO | **Chân 37 (SWD)** | |
| SWCLK | **Chân 39 (SWC)** | |

### Bước 1: Nạp bootloader Adafruit nRF52840 (chỉ 1 lần duy nhất)

Bootloader này cung cấp luôn dịch vụ **OTA DFU qua BLE** cho các lần nạp sau.

```bash
# Tải bootloader (chọn bản *_bootloader-*.hex mới nhất, board pca10056 dùng được cho module nRF52840)
# https://github.com/adafruit/Adafruit_nRF52_Bootloader/releases

# Nạp bằng nrfjprog (bộ nRF Command Line Tools) qua J-Link:
nrfjprog --program pca10056_bootloader-0.9.2_s140_6.1.1.hex --chiperase -f nrf52 --reset

# HOẶC bằng OpenOCD nếu không có nrfjprog:
openocd -f interface/jlink.cfg -c "transport select swd" -f target/nrf52.cfg \
        -c "program pca10056_bootloader-0.9.2_s140_6.1.1.hex verify reset exit"
```

### Bước 2: Biên dịch & nạp sketch

```bash
# Cài core (1 lần):
arduino-cli config add board_manager.additional_urls \
  https://adafruit.github.io/arduino-board-index/package_adafruit_index.json
arduino-cli core update-index
arduino-cli core install adafruit:nrf52
pip install adafruit-nrfutil   # tool đóng gói DFU

# Biên dịch (đã kiểm chứng build sạch với core 1.7.0):
arduino-cli compile --fqbn adafruit:nrf52:pca10056 beacon-e73/beacon_e73

# Nạp lần đầu: qua cổng serial của bootloader (cắm USB nếu board có, hoặc qua SWD):
arduino-cli upload --fqbn adafruit:nrf52:pca10056 -p /dev/ttyACM0 beacon-e73/beacon_e73
```

> Module E73 trần không có USB: nạp file `.hex` sinh ra trong thư mục build
> qua J-Link (`nrfjprog --program beacon_e73.ino.hex --sectorerase -f nrf52 --reset`).
> **Không** dùng `--chiperase` ở bước này để không xóa mất bootloader.

> **⚠️ BẮT BUỘC trước khi build: vá `variant.h` sang USE_LFRC.** Board E73 custom
> KHÔNG có thạch anh 32.768kHz ngoài (LFXO) như board Adafruit gốc pca10056. Nếu build
> với cấu hình mặc định (`USE_LFXO`), firmware compile/nạp OK (verify pass) nhưng
> SoftDevice sẽ chờ mãi clock LF từ thạch anh không tồn tại → **radio BLE không bao giờ phát**.
> Phải vá trong core đã cài trước khi compile:
> ```bash
> V=<đường-dẫn-arduino-data>/packages/adafruit/hardware/nrf52/1.7.0/variants/pca10056/variant.h
> sed -i 's|^#define USE_LFXO.*|// #define USE_LFXO   // Board uses 32khz crystal for LF|' "$V"
> sed -i 's|^// define USE_LFRC.*|#define USE_LFRC      // Board E73 custom: khong co thach anh 32.768kHz ngoai|' "$V"
> ```
> Xem thêm ghi chú build trong repo app: `threejs/beacon/e73-firmware-hex/README.md`.

### Bước 3: Kích hoạt app qua bootloader settings page (BẮT BUỘC sau khi nạp qua SWD)

Bootloader Adafruit 0.9.2 chỉ nhảy vào app nếu settings page ở `0xFF000` có `bank_0=0x01`.
Nạp app qua SWD (bước 2) KHÔNG tự ghi cờ này — thiếu bước này thì **app không bao giờ chạy**
dù `verify` ở bước nạp báo thành công (triệu chứng: nạp xong nhưng quét BLE không thấy gì).

```bash
printf '\x01\x00\x00\x00' > /tmp/settings_patch.bin
openocd -f interface/jlink.cfg -c "transport select swd" -f target/nrf52.cfg -c "adapter speed 1000" \
  -c "init" -c "halt" \
  -c "flash write_image /tmp/settings_patch.bin 0xff000 bin" -c "reset run" -c "exit"
```

Sau khi nạp xong cả 3 bước (bootloader → app → settings page): **rút nguồn cắm lại thật sự**
(power-cycle), không chỉ dựa vào `reset` của OpenOCD — một số bo mạch nạp không reset sạch
toàn bộ peripheral. Quét bằng nRF Connect phải thấy tên `E73-0-B00-K00-F00-0000` (module trắng).

Firmware hiện hành còn giữ mảng debug `dbgTrace` tại địa chỉ RAM cố định `0x20006004` — đọc trực
tiếp qua SWD (không cần kết nối BLE) để chẩn đoán trạng thái nội bộ khi nghi ngờ app treo hoặc
không vào được vòng lặp chính.

## 2. Các lần sau — Nạp OTA qua Bluetooth

Sau lần nạp đầu, mọi cập nhật firmware đều qua BLE, không cần cắm dây:

**Cách A — điện thoại (khuyến nghị khi bảo trì tại chỗ):**
1. Đóng gói DFU: `adafruit-nrfutil dfu genpkg --dev-type 0x0052 --application beacon_e73.ino.hex dfu-package.zip`
2. Mở **nRF Connect** (hoặc **nRF Device Manager**) trên điện thoại, kết nối tới `E73-...`
3. Chọn DFU, trỏ tới `dfu-package.zip`. Khi DFU chạy, beacon tự ngưng phát (chỉ lắng nghe); xong tự reset về chu kỳ 5/1.

**Cách B — dùng một mạch E73 khác làm "mạch nạp chuyên dụng":**
1. Nạp **connectivity firmware** (Nordic `connectivity_x.x.x_usb_with_s140_x.x.hex`) vào E73 thứ hai qua J-Link → nó thành dongle BLE nối máy tính.
2. Từ máy tính: `adafruit-nrfutil dfu ble -pkg dfu-package.zip -p /dev/ttyUSB0 -n "E73-79048-B04-K00-F01-0001"` — E73 dongle sẽ phát gói firmware tới beacon đang lắng nghe.

## 3. Gán / cập nhật ID phân cấp qua BLE

ID beacon: **Bệnh viện – Tòa – Khoa – Tầng – STT**, ví dụ `79048-B04-K00-F01-0001`.

1. Lấy code từ backend (admin đã đặt vị trí trên app):
   `curl http://localhost:3001/api/placements` → cột `code`.
2. Sinh payload 13 byte:
   ```bash
   node beacon-e73/tools/make-config-payload.mjs 79048-B04-K00-F01-0001
   # → Payload: E7010001 34C8 04 00 01 0001 C5 FF (26 ký tự hex)
   ```
3. Mở nRF Connect → kết nối beacon → service `E7300001-…` → characteristic
   `E7300002-…` → **Write** chuỗi hex đó.
4. Beacon lưu vào flash nội (InternalFS) và phát ID mới ngay khi ngắt kết nối.
   ID giữ nguyên qua các lần mất điện; cập nhật lại bất kỳ lúc nào theo cùng cách
   (bảo trì/sửa chữa không cần cắm dây).

## 4. Đọc ID beacon (không cần UART)

Firmware **không dùng UART** (UARTE bật sẽ giữ clock cao tần, ngốn ~0.5–1 mA — giết pin).
Đọc ID qua BLE có 3 cách:

1. **Xem quảng bá** (không cần kết nối): mở nRF Connect → Scan → xem Manufacturer Data
   (`0x0059` + `E7 01 ...` 13 byte).
2. **Xem tên thiết bị**: `E73-79048-B04-K00-F01-0001` hiện ngay trong danh sách quét.
3. **Đọc characteristic**: kết nối → service `E7300001-…` → đọc characteristic `E7300002-…`
   (trả về 13 byte payload hiện hành).

## Định dạng quảng bá (khớp `src/utils/BeaconCode.ts` của app)

Manufacturer Specific Data — Company ID `0x0059` (Nordic) + 13 byte:

| Byte | Trường | Kiểu |
|---|---|---|
| 0 | magic `0xE7` | u8 |
| 1 | version `0x01` | u8 |
| 2–5 | hospitalCode | u32 BE |
| 6 | buildingCode | u8 |
| 7 | deptCode (khoa) | u8 |
| 8 | floorCode (`L1`→1) | i8 |
| 9–10 | idx | u16 BE |
| 11 | txPower @1m (dBm) | i8 |
| 12 | battery % (0xFF = n/a) | u8 |
