# Sóng, công suất phát và bán kính phủ

Ghi lại phần đo đạc và tính toán về sóng BLE của beacon, cùng những thay đổi đã thực hiện.
Áp dụng cho module **E104-BT53A1** (EFR32BG22), nhưng cách tính dùng chung cho mọi beacon BLE.

---

## 1. Kết quả đo thực tế

| Mục | Giá trị |
|---|---|
| Thiết bị đo | Điện thoại Redmi Note 9S (app Wayfinding, admin mode) |
| Khoảng cách | ~1m, module đặt trên bàn |
| Công suất phát của module | +4 dBm (chip tối đa +6 dBm) |
| Số mẫu | **370 mẫu**, 2 phiên đo độc lập |
| **RSSI @1m** | **-69 dBm** (trung vị -69 và -70; trung bình -68,7 và -69,7) |
| Dải dao động quan sát được | -59 đến -98 dBm (beacon nằm yên!) |

Dải dao động ~30 dB dù beacon **đứng yên một chỗ** là điều bình thường của RSSI
(đa đường, người che, hướng ăng-ten). Đây là lý do mọi thuật toán định vị bằng RSSI
đều bắt buộc phải làm mượt, không dùng thẳng giá trị tức thời.

---

## 2. Lỗi hiệu chuẩn đã sửa (quan trọng nhất)

Payload beacon có byte `[11] txPower` = RSSI hiệu chuẩn ở khoảng cách 1m. App dùng nó để
quy đổi RSSI ra khoảng cách:

```
distance = 10 ^ ((txPower − rssi) / 20)
```

**Trước khi sửa:** byte này là `-59` — giá trị mặc định chung của iBeacon, **chưa từng đo**
trên phần cứng này. Chép sang từ bản E73 cũ.

**Hậu quả:** đứng đúng cách beacon 1m (RSSI thật -69), app tính ra:

```
10 ^ ((−59 − (−69)) / 20) = 10 ^ 0,5 = 3,16 m
```

→ **Sai hệ thống ~3,2 lần ở mọi khoảng cách.** Mọi logic chọn beacon / ước lượng vị trí
xây trên con số đó đều lệch theo.

**Đã sửa thành `-69`** ở cả 3 nơi gán cứng giá trị này:

| File | Vai trò |
|---|---|
| `Wayfinding-kiosk/hospital_wayfinding/src/utils/BeaconCode.ts` → `DEFAULT_TX_POWER` | **Quan trọng nhất** — app ghi giá trị này xuống mọi beacon khi gán ID |
| `beacon_bt53/app.c` → payload mặc định | Dùng khi beacon chưa được gán ID |
| `tools/make-config-payload.mjs` | Dùng khi sinh payload bằng tay |

Beacon đang chạy cũng đã được ghi lại payload (giữ nguyên ID, chỉ đổi byte hiệu chuẩn):

```
Truoc: E701000134C8020000000AC5FF   (C5 = -59)
Sau  : E701000134C8020000000ABBFF   (BB = -69)
```

> ⚠️ **Phải đo lại sau khi gắn beacon cố định lên tường.** Con số -69 đo khi module nằm
> trên bàn cạnh dây và mạch nạp. Vị trí lắp, độ cao và vật liệu xung quanh sẽ làm lệch vài dB.
> Lúc đó chỉ cần sửa 1 byte trong payload, **không phải nạp lại firmware**.

---

## 3. Công thức tính bán kính phủ

Mô hình suy hao theo khoảng cách:

```
RSSI(d) = RSSI@1m − 10 · n · log₁₀(d)

  =>  bán kính  d = 10 ^ ((RSSI@1m − ngưỡng) / (10 · n))
```

`n` là hệ số suy hao của môi trường:

| n | Môi trường |
|---|---|
| **2,0** | Hành lang thẳng, thoáng, tầm nhìn thông suốt (hành lang dài có thể xuống dưới 2 do hiệu ứng ống dẫn sóng) |
| **2,5** | Môi trường trong nhà thông thường |
| **3,0** | Có tường ngăn, đông người qua lại |

---

## 4. Bán kính phủ hiện tại (TX +4 dBm, RSSI@1m = -69)

| | Hành lang thoáng (n=2,0) | Thông thường (n=2,5) | Qua tường / đông người (n=3,0) |
|---|---|---|---|
| **Radio thực sự với tới** (điện thoại còn nghe, ~-95 dBm) | **~20 m** | **~11 m** | **~7,4 m** |
| **App thực sự dùng được** (ngưỡng `minRssi = -85`) | ~6,3 m | **~4,4 m** | ~3,4 m |

### Kết luận quan trọng

> **Mạch đã phủ đủ xa rồi.** Nút thắt nằm ở **app**: hằng số `minRssi = -85` trong
> `StableBeaconSelector` vứt bỏ mọi mẫu yếu hơn -85 dBm, cắt mất hơn nửa tầm phủ mà radio
> đã tạo ra. Muốn xa hơn thì **nới ngưỡng này**, không cần tăng công suất phát.

Tham khảo bán kính theo ngưỡng:

| `minRssi` | n=2,0 | n=2,5 | n=3,0 |
|---|---|---|---|
| -85 (hiện tại) | 6,3 m | 4,4 m | 3,4 m |
| -90 | 11,2 m | 6,9 m | 5,0 m |
| **-92** | **14,1 m** | **8,3 m** | **5,8 m** |
| -95 | 19,9 m | 11,0 m | 7,4 m |

---

## 5. Đặt 2 beacon cách nhau bao xa

Quy tắc: đặt cách nhau **D** thì bán kính phủ phải **≥ D/2**, nếu không giữa 2 beacon có
**vùng chết**. Tốt hơn nên phủ **≈ 0,7×D** để hai vùng chồng nhau, chuyển giao mới mượt.

Điểm yếu nhất là **chính giữa hai beacon**. RSSI tại điểm đó:

| Khoảng cách đặt | Điểm giữa | n=2,0 | n=2,5 | n=3,0 |
|---|---|---|---|---|
| **10 m** | 5 m | -83 dBm | -86,5 dBm | -90 dBm |
| **15 m** | 7,5 m | -86,5 dBm | -90,9 dBm | -95,3 dBm |
| 20 m | 10 m | -89 dBm | -94 dBm | -99 dBm |

Đối chiếu với ngưỡng `-85` hiện tại: **chỉ ô -83 (đặt 10m, hành lang thoáng) là đạt**.
Mọi trường hợp còn lại đều rơi dưới ngưỡng → có vùng chết giữa hai beacon.

### Khuyến nghị

| Muốn đặt cách | Cần `minRssi` | Ghi chú |
|---|---|---|
| 10 m | **-92** | Đủ an toàn cho mọi môi trường |
| 15 m | **-95** | Đạt ở hành lang thoáng; **khó đạt nếu có tường ngăn** giữa hai beacon |

**Đừng rải đều máy móc.** Hành lang thẳng dài thì đặt thưa (15m vẫn tốt); chỗ nhiều tường,
ngã rẽ, phòng kín thì phải đặt dày hơn (8–10m).

---

## 6. Các cần gạt điều chỉnh được

### Phía firmware

| Cần gạt | Hiện tại | Tác dụng | Đánh đổi |
|---|---|---|---|
| **Công suất phát** | +4 dBm | Đổi bán kính phủ. Lên +6 dBm chỉ được thêm ~20% khoảng cách | Tốn thêm chút pin |
| **Chu kỳ quảng bá** | 200 ms (5 lần/giây) | Số mẫu RSSI/giây → làm mượt mạnh hơn mà không thêm độ trễ | 100ms thì pin từ ~4–6 năm còn ~2–3 năm |
| **Byte hiệu chuẩn `txPower`** | **-69** (đã sửa) | Độ chính xác khoảng cách | Không, chỉ cần đo đúng |

### Phía app (`StableBeaconSelector`)

| Tham số | Hiện tại | Tác dụng |
|---|---|---|
| `minRssi` | **-85** | **Nút thắt bán kính phủ** (mục 4) |
| `emaAlpha` | 0,35 | Độ mượt. Nhỏ hơn = mượt hơn nhưng phản ứng chậm hơn |
| `hysteresisDb` | 8 | Chống nhảy qua lại giữa 2 beacon gần bằng nhau |
| `initialConfirmMs` | 800 | Thời gian xác nhận beacon đầu tiên |
| `switchConfirmMs` | 1400 | Thời gian xác nhận khi đổi sang beacon khác |

---

## 7. Phân định trách nhiệm — sửa đúng chỗ

Hai vấn đề hay bị lẫn lộn:

| Triệu chứng | Thuộc về | Vì sao |
|---|---|---|
| **Khoảng cách tính ra sai** | **Firmware** (byte hiệu chuẩn) | App tin vào con số beacon gửi lên; con số sai thì app không cứu được |
| **Nhảy qua lại giữa các beacon, không mượt** | **App** (làm mượt + hysteresis) | RSSI nhiễu ±30 dB là vật lý, **không thiết lập firmware nào xóa được** |
| **Vùng chết giữa 2 beacon** | **App** (`minRssi`) + cách lắp | Radio đã với tới, app tự cắt bỏ |

Tăng công suất phát **không** làm hết nhiễu — nó đẩy toàn bộ mức tín hiệu lên đều nhau,
độ nhiễu tương đối giữ nguyên.

---

## 8. Cách đo lại (sau khi lắp thật)

1. Nạp app admin, vào bản đồ Admin, mở bảng gán beacon để app bắt đầu quét.
2. Đứng cách beacon **đúng 1 m**, đứng yên **ít nhất 15 giây** (cần ≥100 mẫu).
3. Lấy log và tính trung vị:

```bash
adb logcat -d -v time | grep -oE "Device: E73-[0-9A-Za-z-]+ \| RSSI: -[0-9]+" \
  | grep -oE "\-[0-9]+$" | sort -n \
  | awk '{a[NR]=$1; s+=$1} END {printf "so mau=%d  trung vi=%d  trung binh=%.1f\n", NR, a[int((NR+1)/2)], s/NR}'
```

4. **Dùng trung vị, không dùng trung bình** — RSSI có đuôi nhiễu lệch, trung bình bị kéo méo.
5. Ghi con số đó vào `DEFAULT_TX_POWER` (`BeaconCode.ts`) rồi gán lại ID cho beacon từ app.

Muốn đo luôn hệ số `n` của môi trường: lặp lại ở 5 m và 10 m, rồi

```
n = (RSSI@1m − RSSI@d) / (10 · log₁₀(d))
```

---

## 9. Còn tồn đọng

- **Ngưỡng `minRssi = -85` chưa đổi** — đang chờ quyết định, vì nó thuộc phía app. Muốn đặt
  beacon cách 10–15m thì phải nới xuống -92 ÷ -95.
- **Chưa đo hệ số `n` thật** của môi trường bệnh viện — mọi bán kính trong tài liệu này là
  tính theo 3 kịch bản giả định, chưa phải số đo.
- **Chưa đo chính xác tần suất phát** (cần máy sniffer hoặc quyền root); mới chắc ở mức
  code đặt đúng 200 ms.
- **Mới hiệu chuẩn trên 1 module và 1 điện thoại.** Các đời điện thoại khác nhau có độ nhạy
  lệch nhau vài dB.
