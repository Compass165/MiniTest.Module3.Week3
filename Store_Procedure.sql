USE minitest_module3_week3;

SELECT * FROM chitietdonhang;
-- SELECT * FROM chitietphieunhap;
-- SELECT * FROM chitietphieuxuat;
SELECT * FROM dondathang;
-- SELECT * FROM nhacungcap;
-- SELECT * FROM phieunhap;
-- SELECT * FROM phieuxuat;
-- SELECT * FROM tonkho;
SELECT * FROM vattu;

-- Tạo các stored procedure sau
-- Câu 1. Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào.
DELIMITER //
CREATE PROCEDURE findSumOfVatTu(
		IN 	VatTu_ID 	INT
	)
	BEGIN
		SELECT	Vattu_ID, (TonKho.TonKho_SoLuongDau + TonKho.TonKho_SoLuongNhap - TonKho_SoLuongXuat) AS 'Số lượng cuối cùng'
        FROM	Vattu
        JOIN	TonKho
        ON		Vattu.Vattu_ID = TonKho.Vattu_ID
        WHERE	Vattu.Vattu_ID = VatTu_ID;
	END //
DELIMITER ;

CALL	findSumOfVatTu(1);

DELIMITER //
CREATE PROCEDURE findSum(
		IN 		Vattu_ID		INT,
        OUT		sum				INT
	)
    BEGIN
		SELECT	(TonKho.TonKho_SoLuongDau + TonKho.TonKho_SoLuongNhap - TonKho_SoLuongXuat) INTO sum
        FROM	Vattu
        JOIN	TonKho
        ON		Vattu.Vattu_ID = TonKho.Vattu_ID
        WHERE	Vattu.Vattu_ID = VatTu_ID;
	END//
DELIMITER ;

CALL 	findsum(1, @sum);
SELECT	@sum;

-- DELIMITER //
-- CREATE PROCEDURE findSum2 (
--         IN		vattu_ID	INT,
--         INOUT	sum			INT
--         )
-- 	BEGIN
-- 		SET sum = TonKho.TonKho_SoLuongDau + TonKho.TonKho_SoLuongNhap - TonKho_SoLuongXuat;
-- 		SELECT	vattu.vattu_ID, sum
--         FROM	Vattu
--         JOIN	TonKho
--         ON		Vattu.Vattu_ID = TonKho.Vattu_ID
--         WHERE	Vattu.Vattu_ID = VatTu_ID;
-- 	END //
-- DELIMITER ;
-- SET		@sum = 0;
-- CALL	findSum2(1, @sum);

-- Câu 2. Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào.

DELIMITER //
CREATE PROCEDURE findSumOfTienXuat(
		IN			Vattu_ID	INT
	)
	BEGIN
			SELECT	Vattu.Vattu_iD, Vattu.Vattu_Ten, ChiTietPhieuXuat.ChitietPhieuXuat_SoLuong * ChiTietPhieuXuat.ChiTietPhieuXuat_Gia AS 'Tổng tiền Xuất VT'
            FROM	Vattu
            JOIN	ChiTietPhieuXuat
            ON		Vattu.Vattu_ID = ChiTietPhieuXuat.Vattu_ID
            WHERE	Vattu.Vattu_ID = Vattu_ID;
	END //
DELIMITER ;

CALL	findSumOfTienXuat (1);
    

-- Câu 3. Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào.
DELIMITER //
CREATE PROCEDURE sumOfDonHang (
		IN		DonDatHang_ID		INT
        )
	BEGIN
			SELECT	chitietdonhang.DonDatHang_ID, SUM(chitietdonhang.chitietdonhang_soluong)
            FROM	chitietdonhang
            GROUP BY chitietdonhang.DonDatHang_ID;
	END //
DELIMITER ;

CALL	sumOfDonHang(301);

-- Câu 4. Tạo SP dùng để thêm một đơn đặt hàng.
DELIMITER //
CREATE PROCEDURE addDonDatHang (
		IN		DonDatHang_ID	INT,
        IN		DonDatHang_Ma	VARCHAR(50),
        IN		DonDatHang_NgayDat DATETIME,
        IN		NhaCungCap_ID	INT
        )
	BEGIN
			INSERT INTO	dondathang (dondathang_ID,
									dondathang_ma,
                                    dondathang_ngaydat,
                                    nhacungcap_ID)
					VALUES
									(dondathang_ID,
									dondathang_ma,
                                    dondathang_ngaydat,
                                    nhacungcap_ID);
	END //
DELIMITER ;

CALL	addDonDatHang(304,'DDH04', '2022-11-24', 203); 


-- Câu 5. Tạo SP dùng để thêm một chi tiết đơn đặt hàng.

DELIMITER //
CREATE PROCEDURE addChiTietDonHang (
		IN		ChiTietDonHang_ID		INT,
        IN		DonDatHang_ID			INT,
        IN		Vattu_ID				INT,
        IN		Chitietdonhang_SoLuong	INT
        )
	BEGIN
			INSERT INTO	chitietdonhang		(chitietdonhang_ID,
											DonDatHang_ID,
                                            Vattu_ID,
                                            Chitietdonhang_soluong)
					VALUES					
											(chitietdonhang_ID,
											DonDatHang_ID,
                                            Vattu_ID,
                                            Chitietdonhang_soluong);
	END //
DELIMITER ;

CALL	addChitietdonhang (606, 304, 5, 25);
