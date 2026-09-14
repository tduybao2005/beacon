# Beacon E104-BT53A1 — Hướng dẫn nạp code & gán ID

Firmware cho module **EBYTE E104-BT53A1** (chip **Silicon Labs EFR32BG22C112F352GM32**),
port từ bản E73 (Nordic nRF52840). Hành vi quảng bá và định dạng gói tin **giữ y nguyên**
nên app đọc beacon (`BeaconCode.ts`) không phải sửa gì.

> Bản E73 cũ xem `FLASHING.md`. Hai module dùng chip khác hãng nên toolchain khác hoàn toàn.

## 1. Thông số phần cứng

| Mục | Giá trị |
|---|---|
| Chip | EFR32BG22C112F352GM32 (Cortex-M33) |
| Flash | **352 KB** (`0x00000`–`0x58000`), trang 8 KB |
| RAM | 32 KB |
| Thạch anh | 38.4 MHz + **32.768 kHz có sẵn trên module** (khác E73 — không phải vá LFRC) |
| Điện áp | 1.9–3.6V (2×AA cấp thẳng, không cần ổn áp) |
| TX tối đa | 6 dBm (firmware đang đặt +4 dBm) |

### Chân nạp SWD

| J-Link | Module E104-BT53A1 | Ghi chú |
|---|---|---|
| VCC 3.3V | **Pin 14 hoặc 15 (VCC)** | KHÔNG dùng 5V |
| GND | **Pin 1/9/10/16/17 (GND)** | |
| SWCLK | **Pin 6 (PA01)** | |
| SWDIO | **Pin 7 (PA02)** | |
| RESET | **Pin 26 (RST)** | Nên nối — thiếu dây này thì khi firmware lỗi phải rút cắm nguồn bằng tay |

## 2. Bố cục flash

```
0x00000 ┌──────────────────────────────┐
        │ Gecko Bootloader + AppLoader │  ~72 KB  (cho OTA qua BLE)
0x12000 ├──────────────────────────────┤
        │ Application (firmware beacon)│  ~176 KB
        ├──────────────────────────────┤
        │ NVM3 (luu ID beacon)         │  cuối flash
0x58000 └──────────────────────────────┘
```

Dùng 256/352 KB → còn ~96 KB dự phòng.

## 3. Dựng toolchain (làm 1 lần)

Tất cả nằm trong `/home/ncd/silabs/`, tải được không cần tài khoản Silicon Labs:

```bash
mkdir -p ~/silabs && cd ~/silabs

# SDK (~2.8GB)
git clone --depth 1 --branch v2025.6.3 https://github.com/SiliconLabs/simplicity_sdk.git

# Bộ sinh project
curl -L -o slc_cli_linux.zip https://www.silabs.com/documents/login/software/slc_cli_linux.zip
unzip -q slc_cli_linux.zip

# Simplicity Commander (chỉ dùng cho bước post-build tạo .hex/.gbl)
curl -L -o SimplicityCommander-Linux.zip https://www.silabs.com/documents/login/software/SimplicityCommander-Linux.zip
unzip -q SimplicityCommander-Linux.zip
cd SimplicityCommander-Linux && tar -xjf Commander_linux_x86_64_*.tar.bz && cd ..

# Bộ biên dịch ARM (lấy từ GitHub, nhanh hơn trang ARM nhiều)
curl -L -o xpack-gcc.tar.gz https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v12.3.1-1.2/xpack-arm-none-eabi-gcc-12.3.1-1.2-linux-x64.tar.gz
tar -xzf xpack-gcc.tar.gz

# pyOCD + pack cho chip (dùng để nạp — xem mục 5 giải thích vì sao không dùng Commander)
python3 -m venv pyocd-venv
./pyocd-venv/bin/pip install pyocd pylink-square
./pyocd-venv/bin/pyocd pack install EFR32BG22C112F352GM32

# Khai báo SDK cho slc
cd slc_cli
./slc configuration --sdk ~/silabs/simplicity_sdk
./slc signature trust --sdk ~/silabs/simplicity_sdk
```

## 4. Build

### Bootloader (chỉ nạp 1 lần cho mỗi module)

```bash
cd ~/silabs/slc_cli
./slc generate ~/silabs/simplicity_sdk/platform/bootloader/sample-apps/bootloader-apploader/bootloader-apploader.slcp \
  -np -d ~/silabs/bootloader_bt53 -name=bootloader_bt53 --with EFR32BG22C112F352GM32

cd ~/silabs/bootloader_bt53
make -f bootloader_bt53.Makefile -j8 \
  ARM_GCC_DIR=~/silabs/xpack-arm-none-eabi-gcc-12.3.1-1.2 \
  POST_BUILD_EXE=~/silabs/SimplicityCommander-Linux/commander/commander
```

### Firmware beacon

```bash
cd ~/workspace/beacon/beacon_bt53
make -f beacon_bt53.Makefile -j8 \
  ARM_GCC_DIR=~/silabs/xpack-arm-none-eabi-gcc-12.3.1-1.2 \
  POST_BUILD_EXE=~/silabs/SimplicityCommander-Linux/commander/commander
```

Sản phẩm trong `build/debug/`: `.hex` (nạp qua SWD), `.gbl` (dùng cho OTA), `.out` (để tra lỗi).

> **Sau khi sửa `gatt_configuration.btconf` hoặc `.slcp` phải sinh lại project trước khi build:**
> ```bash
> cd ~/silabs/slc_cli && ./slc generate ~/workspace/beacon/beacon_bt53/beacon_bt53.slcp -d ~/workspace/beacon/beacon_bt53
> ```
> Dùng đúng dạng lệnh này (không có `-np`) để **không ghi đè `app.c`**.

## 5. Nạp — dùng pyOCD, KHÔNG dùng Simplicity Commander

**Mạch nạp J-Link OB clone (firmware 2012) không nạp được bằng Simplicity Commander.**
Commander báo `JLinkError: Specific core setup failed` vì firmware đời đó ra trước chip BG22
(2020) nên không biết cách khởi tạo lõi Cortex-M33.

pyOCD thì được, vì nó nạp bằng thuật toán flash lấy từ CMSIS-Pack và **chạy thuật toán đó trong
RAM của chip** — mạch nạp chỉ cần đọc/ghi bộ nhớ kiểu chung.

```bash
cd ~/silabs
export LD_LIBRARY_PATH=~/silabs/SimplicityCommander-Linux/commander:$LD_LIBRARY_PATH

# Lần đầu: nạp bootloader
./pyocd-venv/bin/pyocd flash -t efr32bg22c112f352gm32 --erase sector \
  ~/silabs/bootloader_bt53/build/debug/bootloader_bt53.hex

# Nạp firmware (xem cảnh báo MPU bên dưới)
./pyocd-venv/bin/pyocd cmd -t efr32bg22c112f352gm32 \
  -c "halt" -c "write32 0xE000ED94 0x00000000" \
  -c "load ~/workspace/beacon/beacon_bt53/build/debug/beacon_bt53.hex"

# Khởi động lại
./pyocd-venv/bin/pyocd cmd -t efr32bg22c112f352gm32 -c "halt" -c "write32 0xE000ED0C 0x05FA0004"
```

### ⚠️ BẮT BUỘC tắt MPU trước khi nạp

Triệu chứng nếu quên: `flash init failure (result code 0x110d)` — nạp lại bao nhiêu lần cũng lỗi,
power-cycle cũng không hết.

Nguyên nhân: firmware dùng component `mpu` của SDK, nó bật MPU để **cấm thực thi code trong RAM**
(biện pháp bảo mật). Mà thuật toán nạp flash của pyOCD lại bắt buộc phải chạy trong RAM → bị chặn.

Cách xử lý: ghi `0` vào thanh ghi `MPU_CTRL` (`0xE000ED94`) **trong cùng một phiên pyOCD** ngay
trước khi nạp, như lệnh ở trên. Tách thành 2 lệnh riêng sẽ không ăn thua vì mỗi phiên pyOCD kết
nối lại từ đầu.

## 6. Sao lưu / khôi phục firmware gốc của Ebyte

Module xuất xưởng có sẵn firmware AT của Ebyte. Bản sao lưu đã lưu tại
`backup/e104-bt53a1-factory-firmware.bin` (352 KB, đọc từ `0x0`).

Khôi phục:
```bash
./pyocd-venv/bin/pyocd cmd -t efr32bg22c112f352gm32 \
  -c "halt" -c "write32 0xE000ED94 0" \
  -c "load ~/workspace/beacon/backup/e104-bt53a1-factory-firmware.bin 0x0"
```

## 7. Gán / cập nhật ID qua BLE

Giống hệt bản E73 — service `E7300001-8CB0-4E2A-9C6D-6E73BEAC0001`,
characteristic `E7300002-...`, ghi 13 byte payload, không cần pair/bond.

```bash
node tools/make-config-payload.mjs 79048-B04-K00-F01-0001
# -> E701000134C80400010001C5FF
```

Ghi bằng nRF Connect / Simplicity Connect, hoặc từ app admin (`beaconWriter.ts`).
Firmware lưu vào NVM3 và áp ID mới vào quảng bá **ngay khi ngắt kết nối**; ID giữ qua mất điện.

## 8. Tình trạng đã kiểm chứng trên phần cứng thật

| Hạng mục | Kết quả |
|---|---|
| Quảng bá connectable, interval 200ms (5 lần/giây) | ✅ |
| Manufacturer data `0x0059` + 13 byte đúng định dạng E73 | ✅ `E701000134C80400010001C5FF` |
| Tên thiết bị trong scan response | ✅ `E73-79048-B04-K00-F01-0001` |
| Đọc/ghi characteristic config qua BLE | ✅ |
| ID giữ qua mất điện (NVM3) | ✅ đã test reset |
| MAC cố định qua các lần khởi động | ✅ `90:35:EA:FE:2B:5D`, 3/3 lần |
| OTA DFU qua BLE | ⏳ bootloader + AppLoader đã nạp sẵn, **chưa test thực tế** |

## 9. Khác biệt so với bản E73

| | E73 (nRF52840) | E104-BT53A1 (EFR32BG22) |
|---|---|---|
| Ngôn ngữ | Arduino `.ino` | C thuần + BGAPI |
| Lưu ID | InternalFS / LittleFS | NVM3 |
| Khai báo GATT | trong code | `config/btconf/gatt_configuration.btconf` (XML) |
| Bootloader | Adafruit nRF52 | Gecko Bootloader + AppLoader |
| Nạp | nrfjprog / OpenOCD | pyOCD (bắt buộc tắt MPU) |
| Thạch anh 32.768kHz | không có → phải vá `USE_LFRC` | **có sẵn**, không phải vá |
| Bẫy hay gặp | quên ghi settings page `0xFF000` | quên tắt MPU trước khi nạp |
