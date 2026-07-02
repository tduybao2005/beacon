t có những câu hỏi sau muốn m hãy ghi câu trả lời ngay trong file này:
- nếu dùng thêm UART thì sau này beacon sau này sau khi nạp code xong chỉ đặt ở bệnh viện sử dụng(không còn dùng UART) thì có tốn pin phần UART không? hay lúc đó chỉ sử dụng BLE nên chỉ tốn pin phần BLE mà không tốn UART?
- và m có thể thiết kế cho t pin sử dụng cho beacon được không? t muốn pin của t chỉ khoảng 100k đổ lại mà có thể sử dụng được trong 2-3 năm thì có được không? phải đảm bảo nguồn không khiến cho beacon bị sụt áp và reset liên tục, ngoài ra những vấn đề phát sinh khác, hiện tại trên mạch beacon của t có 4 tụ, trong đó:
    C1 - Tụ Tantalum 100uF 10V 3528
    C2 - Tụ Gốm 100nF 104M 50V 0603 SMD
    C3 - Tụ 10uF 0805 25V 10% (20c)
    C4 - Tụ 104 0.1uF 100nF 0805 25V 10% (20c)

tụ C1 và C2 sẽ đặt gần VDH, còn C3 và C4 đặt gần VDD

---

# TRẢ LỜI

## Câu 1: UART có tốn pin khi không dùng không?

**Có tốn — nếu cứ để UART bật** (UARTE bật là giữ clock cao tần HFCLK chạy liên tục,
ngốn ~0.5–1 mA kể cả khi không truyền byte nào; cái tốn là ngoại vi + clock chứ không phải cái chân).

**→ ĐÃ XỬ LÝ: UART đã bị XÓA hẳn khỏi firmware** (commit `d39301a`, theo yêu cầu của t) vì mọi
chức năng đều làm được qua BLE:
- **Đọc ID**: xem quảng bá (mfg data `0x0059` + 13 byte), xem tên `E73-79048-B04-...` trong danh
  sách quét, hoặc kết nối đọc characteristic `E7300002-…`.
- **Ghi/đổi ID**: nRF Connect ghi characteristic (hex từ `make-config-payload.mjs`).
- **Nạp firmware**: OTA DFU qua BLE.

Vậy giờ beacon **chỉ tốn pin phần BLE**, khoản UART = 0.

## Câu 2: Thiết kế pin ≤100k dùng 2–3 năm

### Trả lời thẳng (cập nhật SAU KHI ĐÃ XÓA UART + XÓA VÒNG QUÉT): ĐẠT YÊU CẦU RỒI

Hai thủ phạm ngốn pin đã bị xóa khỏi firmware:

| Thành phần | Dòng trung bình |
|---|---|
| ~~UART~~ (đã xóa) | ~~0.5–1 mA~~ → **0** ✅ |
| ~~Vòng quét thu 100ms mỗi giây~~ (đã xóa) | ~~650 µA~~ → **0** ✅ |
| Quảng bá 5 lần/giây (+4dBm, chưa DC-DC) + nền | **~60–90 µA** |
| **Tổng hiện tại** | **~60–90 µA** → 2×AA đạt **~2.5–3 năm** ✅ |

Vụ xóa vòng quét không mất tính năng nào: quảng bá của mình là *connectable* — **sau MỖI gói
phát, radio tự mở cửa sổ nghe** (chuẩn BLE, SoftDevice lo) để nhận yêu cầu kết nối, nên nạp
OTA / ghi ID / đọc ID qua BLE vẫn nguyên vẹn. Vòng quét cũ chỉ để nghe lỏm quảng bá của beacon
khác — chưa dùng vào việc gì.

**2 tùy chọn thêm biên an toàn (chưa làm, làm được ngay khi t muốn):**
1. **Hạ TX từ +4dBm về 0 dBm** — 1 dòng code, tiết kiệm ~30% phần phát; tầm phủ trong nhà
   10–15m vẫn dư. Khuyến nghị làm.
2. **Bật DC-DC regulator** — giảm thêm ~40% dòng radio. LƯU Ý: core Adafruit KHÔNG tự bật
   (m đã kiểm tra source), và chỉ được bật nếu module E73 có sẵn cuộn cảm DC-DC bên trong —
   cần xác nhận với datasheet/đo thử trước, bật nhầm khi thiếu cuộn cảm là radio chết.

Làm cả 2 thì về **~30–50 µA** → 2×AA chạy 3–4 năm.

### Phương án pin khuyến nghị (tổng ≤100k)

**✅ Phương án 1 — 2 viên AA nối tiếp (3V), cấp thẳng vào VDD, KHÔNG qua ổn áp (khuyến nghị):**

| Món | Giá tham khảo |
|---|---|
| 2× AA alkaline (Panasonic/Energizer) 2400–2800 mAh | ~20–30k |
| Đế pin 2×AA có dây | ~5–10k |
| **Tổng** | **~30–40k** ✅ |

- Thời lượng: 2500 mAh ÷ 0.045 mA ≈ 55.000 giờ ≈ **6+ năm lý thuyết**; trừ tự xả của pin alkaline
  (~2–3%/năm) và biên an toàn → **thực tế 3–4 năm, dư yêu cầu 2–3 năm**.
- nRF52840 chạy 1.7–3.6V nên 2×AA (3.0V lúc mới → 2.0V lúc cạn) dùng **trọn** dung lượng pin,
  không cần LDO/boost (mạch ổn áp chỉ tổ ngốn thêm µA).
- Nội trở pin AA thấp (~150–300 mΩ) trong khi đỉnh dòng radio chỉ ~10–16 mA → sụt áp đỉnh chỉ vài mV,
  **không thể gây reset** (đây là lợi thế lớn nhất của AA so với pin cúc).
- Muốn sang hơn: 2× **Energizer Ultimate Lithium AA** (~70–90k/đôi, vẫn ≤100k) — nội trở thấp hơn nữa,
  tự xả gần 0, chịu lạnh/nóng tốt, hạn dùng 20 năm. Đáng tiền nếu beacon đặt chỗ khó thay pin.

#### Đấu dây & tụ cụ thể cho Phương án 1 (trả lời: VDDH KHÔNG bỏ trống, tụ VDD VẪN CẦN)

nRF52840 có 2 chế độ cấp nguồn, và với 2×AA thì **bắt buộc dùng chế độ normal**:

| Chế độ | Cách cấp | Dải áp | Dùng cho 2×AA? |
|---|---|---|---|
| **Normal** (chọn cái này) | Nối **VDDH CHUNG với VDD**, cấp 1 nguồn | 1.7–3.6V | ✅ Pin xài từ 3.2V xuống tận 2.0V → vắt kiệt pin |
| High-voltage | Chỉ cấp VDDH, VDD thành ngõ RA của ổn áp trong chip | VDDH ≥ 2.5V | ❌ Pin tụt dưới 2.5V là chip tắt → bỏ phí ~40% dung lượng |

Sơ đồ đấu:

```
 2×AA (+) ──┬── VDDH ──(nối chung)── VDD
            │     │                   │
            │   C2 100nF (sát VDDH) C4 100nF (sát VDD)
            │   C1 100µF            C3 10µF
            │     │                   │
 2×AA (−) ──┴── GND ────────────────GND
```

Trả lời thẳng 2 câu của t:

1. **VDDH có bỏ trống không? → KHÔNG.** Datasheet Nordic yêu cầu ở chế độ normal phải nối
   VDDH chung với VDD. Bỏ trống VDDH là chân nổi (floating) → chip hoạt động chập chờn khó lường.
   (Chỉ khi nguồn >3.6V — vd pin Li-ion 3.7V — mới cấp riêng VDDH và để chip tự hạ áp ra VDD,
   nhưng mình không dùng nguồn đó.)
2. **Có cần 2 tụ ở VDD nữa không? → CÓ, giữ nguyên cả 4 con.** C4 (100nF) + C3 (10µF) là tụ
   decoupling đặt sát chân VDD cho chip — bỏ là nhiễu/sụt áp ngay tại chân, không phụ thuộc
   nguồn là pin hay gì. Sau khi nối VDDH = VDD thì cả 4 tụ nằm chung 1 đường ray: C1/C2 đóng
   vai tụ kho + lọc ở phía đầu vào pin, C3/C4 lọc sát chân VDD. Không thừa con nào.

**Phương án 2 — CR2477 (pin cúc 3V, 1000 mAh) nếu cần nhỏ gọn:** pin ~40–60k + đế ~10k.
1000 mAh ÷ 0.04 mA ≈ **2.5–3 năm** — vừa khít yêu cầu. Nhược: nội trở cao (10–40Ω), đỉnh 15 mA
gây sụt ~0.3–0.6V mỗi lần phát → **bắt buộc** có tụ bulk ≥100 µF sát pin (tụ C1 của t gánh vai này).
Được, nhưng ít biên an toàn hơn AA.

**❌ Không khuyến nghị: ER14505 (LiSOCl2 3.6V):** điện áp hở mạch 3.65–3.67V **vượt mức tối đa
3.6V của nRF52840**, cộng thêm hiện tượng passivation gây sụt áp mạnh ở xung đầu — đúng cái lỗi
"sụt áp reset liên tục" mà t đang muốn tránh.

### Về 4 con tụ trên mạch của t — bố trí ĐÚNG rồi, giữ nguyên

| Tụ | Vị trí | Đánh giá |
|---|---|---|
| C1 — Tantalum 100 µF 10V 3528 | gần VDDH | ✅ Tụ bulk chống sụt áp khi radio phát xung — chính là thứ giữ cho beacon không reset. Giữ. |
| C2 — Gốm 100 nF 0603 | gần VDDH | ✅ Lọc nhiễu cao tần, đặt càng sát chân càng tốt (<2mm). |
| C3 — 10 µF 0805 | gần VDD | ✅ Đúng theo reference design Nordic (4.7–10 µF ở VDD). |
| C4 — 100 nF 0805 | gần VDD | ✅ Chuẩn. |

3 lưu ý nhỏ:
1. **Tụ tantalum C1 có dòng rò** ~1–3 µA ở 3V. Bình thường không sao, nhưng trong ngân sách 40 µA
   thì nó chiếm ~5%. Nếu muốn tối ưu nữa thì thay bằng **tụ gốm 100 µF 6.3V X5R 1210** (~3–5k/con,
   rò gần 0). Không bắt buộc.
2. Cấp nguồn pin 3V thì nối **VDD = VDDH chung với nhau** (normal voltage mode) — chế độ high-voltage
   (chỉ cấp VDDH) chỉ cần khi nguồn >3.6V, mà mình không dùng nguồn đó.
3. Thêm **1 điện trở 0Ω hoặc jumper nối tiếp pin** để đo dòng thực tế bằng đồng hồ khi nghiệm thu —
   cách duy nhất biết chắc beacon có đạt ~40 µA hay không trước khi dán lên tường bệnh viện.

### Thứ tự đặt tụ: con NHỎ nhất đặt SÁT chân nhất

Quy tắc chung của tụ decoupling: **tụ điện dung nhỏ lọc nhiễu tần số cao → phải nằm sát chân IC
nhất** (đường mạch càng ngắn thì điện cảm ký sinh càng thấp, lọc cao tần mới hiệu quả);
tụ to là kho chứa điện (bulk) phản ứng chậm hơn → đặt xa hơn một chút cũng không sao.

**Cụm VDDH (C1 + C2):**

```
[chân VDDH] ── C2 (100nF gốm) ── C1 (100µF tantalum) ── [dây về pin]
   sát nhất, <2mm         cách 5–10mm cũng được
```

→ **C2 gần VDDH nhất**, C1 đứng sau C2 (về phía nguồn/pin).

**Cụm VDD (C3 + C4):**

```
[chân VDD] ── C4 (100nF gốm) ── C3 (10µF) ── [nguồn]
   sát nhất, <2mm        cách 5–10mm cũng được
```

→ **C4 gần VDD nhất**, C3 đứng sau C4.

Lưu ý layout thêm:
- GND của mỗi con tụ phải via xuống mặt phẳng GND ngay tại chỗ nó đứng, đừng kéo dây GND dài.
- Nếu module có nhiều chân VDD, ưu tiên đặt cặp 100nF ở chân gần antenna/radio nhất.
- Chiều dòng điện đi: pin → tụ to (bulk) → tụ nhỏ → chân IC, đúng như sơ đồ trên.

### Tóm tắt

| | Trước (UART + quét) | **Hiện tại (đã xóa cả 2)** | Tùy chọn thêm (0dBm, DC-DC) |
|---|---|---|---|
| Dòng trung bình | ~1.2–1.7 mA | **~60–90 µA** | ~30–50 µA |
| 2×AA alkaline (~35k) | 2–3 tháng ❌ | **~2.5–3 năm** ✅ | 3–4 năm ✅ |
| CR2477 (~60k) | ~1 tháng ❌ | ~1.5–2 năm ⚠️ | 2.5–3 năm ✅ |

→ **Chốt: 2×AA + đế pin (~35k), firmware hiện tại đã đạt yêu cầu 2–3 năm.**
Nạp OTA, gán ID, đọc ID qua BLE hoạt động y nguyên. Muốn thêm biên thì hạ TX 0dBm (làm ngay
được) và cân nhắc DC-DC (cần xác nhận cuộn cảm trong module trước).
