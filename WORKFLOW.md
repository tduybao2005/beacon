# Flow làm việc — Hệ chỉ đường bệnh viện (Beacon E73)

> Tài liệu cho thành viên đội track tiến độ và hiểu luồng làm việc.
> Chi tiết kỹ thuật xem: `beacon-e73/FLASHING.md` (nạp beacon), `TESTING_GUIDE.md` (test).

---

## 1. Flow của Beacon

### Nạp lần ĐẦU (1 lần duy nhất cho mỗi beacon mới, làm tại xưởng/bàn làm việc)

```
Beacon mới (trắng)
   │  cắm 4 dây vào mạch nạp J-Link (VCC, GND, chân 37, chân 39)
   ▼
[1] Nạp bootloader ──► beacon có khả năng nhận code qua Bluetooth từ nay về sau
   ▼
[2] Nạp firmware beacon ──► beacon bắt đầu phát sóng với ID mặc định (chưa gán)
   ▼
[3] Rút dây — KHÔNG bao giờ cần cắm dây lại nữa
```

### Nạp lần SAU (cập nhật firmware / đổi ID — làm từ xa qua Bluetooth)

```
Beacon đang chạy tại bệnh viện
   │  đứng gần beacon với điện thoại (app nRF Connect)
   ▼
- Cập nhật firmware:  chọn DFU → gửi file → beacon tự ngưng phát, nhận code,
                      nạp xong tự khởi động lại và chạy bình thường
- Đổi/gán ID:         ghi 1 chuỗi cấu hình ngắn → beacon đổi ID ngay lập tức,
                      ID được lưu vĩnh viễn (mất điện không mất ID)
- Đọc ID hiện tại:    chỉ cần quét Bluetooth là thấy tên "E73-79048-B04-K00-F01-0001"
```

**Tóm lại:** cắm dây đúng 1 lần đầu đời; mọi bảo trì sau này (nạp lại code, đổi ID khi
chuyển beacon sang phòng/tầng khác) đều làm qua Bluetooth, không tháo beacon khỏi tường.

---

## 2. Hệ thống phần mềm: key USER, key ADMIN, backend

### Key USER — CHƯA LÀM (và hiện tại chưa cần)

App chính (bản đồ 3D, chỉ đường, định vị chấm đỏ) **không yêu cầu đăng nhập** — bệnh nhân/
người nhà mở app là dùng được ngay. Theo thiết kế hiện tại chỉ có 1 loại key là ADMIN.
Nếu sau này cần phân quyền thêm (vd: nhân viên bệnh viện xem thống kê) thì mới thêm key USER.

### Backend — ĐÃ CHẠY, ở local

| Câu hỏi | Trả lời |
|---|---|
| Đang chạy như nào? | Server nhỏ chạy trên máy dev, lệnh: `cd beacon-monitor && npm run dev` |
| Ở đâu? | `http://localhost:3001` (máy nào chạy thì các máy cùng WiFi truy cập qua IP máy đó) |
| Lưu dữ liệu ở đâu? | File `beacon-monitor/placements.db` (SQLite) — copy file là backup xong |
| Key admin | Mặc định `admin123`, đổi được khi khởi động server |

### Key ADMIN — ĐÃ LÀM, dùng như sau

1. Mở app → thêm `#/admin` vào địa chỉ (vd `http://localhost:5173/#/admin`)
2. Nhập key admin → vào **màn hình đặt beacon** (tách biệt hoàn toàn với app chỉ đường)
3. Chọn **Tòa nhà → Tầng → Mã khoa**
4. Đặt beacon lên bản vẽ (bản vẽ dựng theo kiến trúc thật nên khoảng cách chính xác):
   - **Từng cái**: click vào vị trí muốn đặt
   - **Hàng loạt**: click điểm bắt đầu → nhập chiều đặt, khoảng cách (mét), số lượng → hệ thống tự đặt cả dãy
5. Xóa: click vào marker beacon trên bản đồ

### Gửi gì về backend? — Đây là chỗ "khớp" hệ thống với beacon đời thật

```
ADMIN đặt beacon trên bản đồ
   │  gửi về backend: tòa, khoa, tầng, tọa độ (x,z)
   ▼
BACKEND tự cấp ID phân cấp duy nhất, vd: 79048-B04-K00-F01-0001
   │         (bệnh viện - tòa - khoa - tầng - số thứ tự)
   ├──────────────────────────────┐
   ▼                              ▼
KỸ THUẬT VIÊN                  APP CHỈ ĐƯỜNG
xem danh sách ID trên backend  tự tải danh sách beacon từ backend khi mở app
→ ghi ID đó vào beacon thật    → biết beacon ID nào nằm ở tọa độ nào, tầng nào
  (qua Bluetooth)
   ▼
BEACON THẬT phát đúng ID đó ──► điện thoại nghe được ──► app tra ID trong danh sách
                                                          ──► hiện chấm đỏ đúng vị trí
```

Nguồn sự thật duy nhất là **backend**: bản đồ trên app và beacon ngoài đời cùng đọc/ghi
theo một bảng ID, nên không bao giờ lệch nhau.

---

## 3. Khả năng bảo trì & mở rộng

### Bảo trì

| Tình huống | Cách xử lý | Cần tháo beacon? |
|---|---|---|
| Cập nhật firmware toàn bộ beacon | OTA qua Bluetooth, đứng gần từng beacon | ❌ |
| Beacon chuyển sang phòng/tầng khác | Sửa vị trí trên trang admin → ghi ID mới qua Bluetooth | ❌ |
| Beacon hỏng, thay con mới | Nạp lần đầu cho con mới → ghi ID của con cũ vào | Thay con hỏng |
| Kiểm tra beacon nào đang sống | Quét Bluetooth bằng điện thoại (thấy tên = sống) | ❌ |
| Hết pin (~3–4 năm với 2×AA sau khi tối ưu firmware) | Thay pin, ID vẫn giữ nguyên | Mở nắp thay pin |
| Backup dữ liệu vị trí | Copy 1 file `placements.db` | — |

### Mở rộng

- **Thêm tầng/tòa/khoa**: vẽ thêm vào file bản đồ + admin đặt beacon như thường —
  không phải sửa code. ID đã thiết kế phân cấp sẵn (bệnh viện/tòa/khoa/tầng) nên không đụng độ.
- **Thêm bệnh viện mới**: mỗi bệnh viện có mã riêng (vd 79048 = Chợ Rẫy) nằm ngay trong ID beacon
  → nhiều bệnh viện dùng chung hệ thống mà beacon không lẫn nhau.
- **Số lượng beacon**: mỗi tầng đánh số được tới 65.000 beacon — thực tế không bao giờ chạm trần.
- **Backend lên cloud**: hiện chạy local để thử nghiệm; khi triển khai thật chỉ cần đưa server
  lên VPS/cloud và đổi 1 địa chỉ trong app — app đã thiết kế sẵn kiểu "có backend thì dùng backend,
  không có thì dùng dữ liệu đóng gói", nên chuyển đổi không gây gián đoạn.
- **App**: phần admin tách biệt hoàn toàn app chỉ đường, nên nâng cấp bên nào không ảnh hưởng bên kia.

---

## 4. Trạng thái hiện tại (07/2026)

| Hạng mục | Trạng thái |
|---|---|
| Firmware beacon E73 (phát 5 lần/giây, OTA, gán ID qua BLE) | ✅ Xong, đã compile |
| App giải mã beacon + định vị chấm đỏ (chống nhảy giữa 2 beacon) | ✅ Xong, 41 test |
| Trang admin (key + đặt beacon click/hàng loạt) | ✅ Xong |
| Backend cấp ID + lưu vị trí | ✅ Xong, 10 test |
| Key USER | ⬜ Chưa làm (chưa cần) |
| Tối ưu pin firmware (xóa UART + xóa vòng quét → 2×AA chạy 2.5–3 năm) | ✅ Xong |
| Tối ưu pin thêm (TX 0dBm, DC-DC) — tùy chọn, thêm biên an toàn | ⬜ Cân nhắc |
| Build APK mới để test trên điện thoại | ⬜ Chưa build |
| Test với beacon thật tại hiện trường | ⬜ Chờ phần cứng |
