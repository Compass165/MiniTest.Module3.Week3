USE minitest_module3_week3;

-- SELECT * FROM chitietdonhang;
-- SELECT * FROM chitietphieunhap;
SELECT * FROM chitietphieuxuat;
-- SELECT * FROM dondathang;
-- SELECT * FROM nhacungcap;
-- SELECT * FROM phieunhap;
SELECT * FROM phieuxuat;
-- SELECT * FROM tonkho;
SELECT * FROM vattu;

-- Tạo các view sau
-- Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW 	vw_CTPhieuNhap AS
SELECT 	chitietphieunhap.ChiTietPhieuNhap_ID, chitietphieunhap.VatTu_ID, chitietphieunhap.ChiTietPhieuNhap_SoLuong, chitietphieunhap.ChiTietPhieuNhap_Gia, (ChiTietPhieuNhap_Gia * ChiTietPhieuNhap_SoLuong) AS 'Thành Tiền Nhập'
FROM 	ChiTietPhieuNhap;
SELECT 	*
FROM 	vw_CTPhieuNhap;

-- Câu 2. Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPhieuNhap_VT AS
SELECT 	chitietphieunhap.ChiTietPhieuNhap_ID, chitietphieunhap.VatTu_ID, vattu.Vattu_Ten, chitietphieunhap.ChiTietPhieuNhap_SoLuong, chitietphieunhap.ChiTietPhieuNhap_Gia, (ChiTietPhieuNhap.ChiTietPhieuNhap_Gia * ChiTietPhieuNhap.ChiTietPhieuNhap_SoLuong) AS 'Thành Tiền Nhập'
FROM 	chitietphieunhap
JOIN 	vattu
ON 		chitietphieunhap.VatTu_ID = VatTu.VatTu_ID;
SELECT 	*
FROM 	vw_CTPhieuNhap_VT;

-- Câu 3. Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPhieuNhap_VT_PN AS
SELECT 	chitietphieunhap.ChiTietPhieuNhap_ID, phieunhap.PhieuNhap_NgayNhap, phieunhap.DonDatHang_ID, chitietphieunhap.VatTu_ID, vattu.Vattu_Ten, chitietphieunhap.ChiTietPhieuNhap_SoLuong, chitietphieunhap.ChiTietPhieuNhap_Gia, (ChiTietPhieuNhap.ChiTietPhieuNhap_Gia * ChiTietPhieuNhap.ChiTietPhieuNhap_SoLuong) AS 'Thành Tiền Nhập'
FROM 	chitietphieunhap
JOIN 	vattu
ON 		chitietphieunhap.VatTu_ID = vattu.VatTu_ID
JOIN 	phieunhap
ON 		chitietphieunhap.PhieuNhap_ID = phieunhap.PhieuNhap_ID;
SELECT 	*
FROM 	vw_CTPhieuNhap_VT_PN;

-- Câu 4. Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPhieuNhap_VT_PN_DH AS
SELECT 	chitietphieunhap.ChiTietPhieuNhap_ID, phieunhap.PhieuNhap_NgayNhap, dondathang.DonDatHang_ID, dondathang.NhaCungCap_ID, chitietphieunhap.VatTu_ID, vattu.Vattu_Ten, chitietphieunhap.ChiTietPhieuNhap_SoLuong, chitietphieunhap.ChiTietPhieuNhap_Gia, (ChiTietPhieuNhap.ChiTietPhieuNhap_Gia * ChiTietPhieuNhap.ChiTietPhieuNhap_SoLuong) AS 'Thành Tiền Nhập'
FROM 	chitietphieunhap
JOIN 	phieunhap
ON		chitietphieunhap.PhieuNhap_ID = phieunhap.PhieuNhap_ID
JOIN	vattu
ON		chitietphieunhap.VatTu_ID = vattu.VatTu_ID
JOIN	dondathang
ON		phieunhap.DonDatHang_ID = dondathang.DonDatHang_ID;
SELECT	*
FROM	vw_CTPhieuNhap_VT_PN_DH;

-- Câu 5. Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 50.
CREATE VIEW vw_CTPhieuNhap_loc AS
SELECT	chitietphieunhap.ChiTietPhieuNhap_ID, chitietphieunhap.VatTu_ID, chitietphieunhap.ChiTietPhieuNhap_SoLuong, chitietphieunhap.ChiTietPhieuNhap_Gia, (ChiTietPhieuNhap.ChiTietPhieuNhap_Gia * ChiTietPhieuNhap.ChiTietPhieuNhap_SoLuong) AS 'Thành Tiền Nhập'
FROM 	ChiTietPhieuNhap
WHERE 	chitietphieunhap.chitietphieunhap_soluong > 50;
SELECT	*
FROM	vw_CTPhieuNhap_loc;

-- Câu 6. Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Gam.
CREATE VIEW vw_CTPhieuNhap_VT_loc AS
SELECT	chitietphieunhap.ChiTietPhieuNhap_ID, chitietphieunhap.VatTu_ID, vattu.Vattu_Ten, chitietphieunhap.ChiTietPhieuNhap_SoLuong, chitietphieunhap.ChiTietPhieuNhap_Gia, (ChiTietPhieuNhap.ChiTietPhieuNhap_Gia * ChiTietPhieuNhap.ChiTietPhieuNhap_SoLuong) AS 'Thành Tiền Nhập'
FROM	chitietphieunhap
JOIN	vattu
ON		chitietphieunhap.VatTu_ID = vattu.VatTu_ID
WHERE	vattu_Dvt = 'Gam';
SELECT	*
FROM	vw_CTPhieuNhap_VT_loc;

-- Câu 7. Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.
CREATE VIEW vw_CTPhieuXuat AS
SELECT	chitietphieuxuat.ChiTietPhieuXuat_ID, chitietphieuxuat.VatTu_ID, chitietphieuxuat.ChiTietPhieuXuat_SoLuong, chitietphieuxuat.ChiTietPhieuXuat_Gia, (chitietphieuxuat.ChitietPhieuXuat_SoLuong * chitietphieuxuat.ChiTietPhieuXuat_Gia) AS 'Thành tiền Xuất'
FROM	chitietphieuxuat;
SELECT	*
FROM	vw_CTPhieuXuat;

-- Câu 8. Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW vw_CTPhieuXuat_VT AS
SELECT	chitietphieuxuat.ChiTietPhieuXuat_ID, chitietphieuxuat.VatTu_ID, vattu.Vattu_Ten, chitietphieuxuat.ChiTietPhieuXuat_SoLuong, chitietphieuxuat.ChiTietPhieuXuat_Gia, (chitietphieuxuat.ChitietPhieuXuat_SoLuong * chitietphieuxuat.ChiTietPhieuXuat_Gia) AS 'Thành tiền Xuất'
FROM	chitietphieuxuat
JOIN	vattu
ON		chitietphieuxuat.VatTu_ID = vattu.VatTu_ID;
SELECT	*
FROM	vw_CTPhieuXuat_VT;

-- Câu 9. Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW vw_CTPhieuXuat_VT_PX AS
SELECT	chitietphieuxuat.ChiTietPhieuXuat_ID, phieuxuat.phieuxuat_tenkhachhang, chitietphieuxuat.VatTu_ID, vattu.Vattu_Ten, chitietphieuxuat.ChiTietPhieuXuat_SoLuong, chitietphieuxuat.ChiTietPhieuXuat_Gia, (chitietphieuxuat.ChitietPhieuXuat_SoLuong * chitietphieuxuat.ChiTietPhieuXuat_Gia) AS 'Thành tiền Xuất'
FROM 	chitietphieuxuat
JOIN 	vattu
ON		chitietphieuxuat.VatTu_ID = vattu.VatTu_ID
JOIN	phieuxuat
ON		chitietphieuxuat.PhieuXuat_ID = phieuxuat.PhieuXuat_ID;
SELECT	*
FROM	vw_CTPhieuXuat_VT_PX;


