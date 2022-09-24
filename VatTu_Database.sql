CREATE DATABASE minitest_module3_week3;

USE minitest_module3_week3;

CREATE	TABLE	VatTu
	(
		VatTu_ID				INT				PRIMARY KEY NOT NULL,
		VatTu_Ma				VARCHAR(50)		NOT NULL,
        VatTu_Ten				VARCHAR(50)		NOT NULL,
        VatTu_Dvt				VARCHAR(50),
        VatTu_Gia				INT
	);
    
CREATE TABLE	TonKho
	(
		TonKho_ID				INT				PRIMARY	KEY NOT NULL,
        VatTu_ID				INT				NOT NULL,
        TonKho_SoLuongDau		INT,
        TonKho_SoLuongNhap		INT,
        TonKho_SoLuongXuat		INT,
        FOREIGN KEY		(VatTu_ID)			REFERENCES		VatTu (VatTu_ID)
	);
    
CREATE TABLE	NhaCungCap
	(
		NhaCungCap_ID			INT				PRIMARY KEY	NOT NULL,
        NhaCungCap_Ma			VARCHAR(50)		NOT NULL,
        NhaCungCap_Ten			VARCHAR(50)		NOT NULL,
        NhaCungCap_DiaChi		VARCHAR(255),
        NhaCungCap_SDT			INT
	);
    
CREATE TABLE	DonDatHang
	(
		DonDatHang_ID			INT				PRIMARY	KEY NOT NULL,
        DonDatHang_Ma			VARCHAR(50)		NOT NULL,
        DonDatHang_NgayDat		DATETIME,
        NhaCungCap_ID			INT,
        FOREIGN KEY		(NhaCungCap_ID)		REFERENCES		NhaCungCap (NhaCungCap_ID)
	);
    
CREATE TABLE	PhieuNhap
	(
		PhieuNhap_ID			INT				PRIMARY KEY NOT NULL,
        PhieuNhap_Ma			VARCHAR(50)		NOT NULL,
        PhieuNhap_NgayNhap		DATETIME,
        DonDatHang_ID			INT,
        FOREIGN KEY		(DonDatHang_ID)		REFERENCES		DonDatHang (DonDatHang_ID)
	);
    
CREATE TABLE	PhieuXuat
	(
		PhieuXuat_ID			INT				PRIMARY KEY NOT NULL,
        PhieuXuat_Ma			VARCHAR(50),
        PhieuXuat_NgayXuat		DATETIME,
        PhieuXuat_TenKhachHang	VARCHAR(50)
	);
    
CREATE TABLE	ChiTietDonHang
	(
		ChiTietDonHang_ID		INT				PRIMARY KEY NOT NULL,
        DonDatHang_ID			INT,
        VatTu_ID				INT,
        ChiTietDonHang_SoLuong	INT,
        FOREIGN KEY		(DonDatHang_ID)		REFERENCES		DonDatHang (DonDatHang_ID),	
        FOREIGN KEY		(VatTu_ID)			REFERENCES		VatTu (VatTu_ID)
	);
    
CREATE TABLE	ChiTietPhieuNhap
	(
		ChiTietPhieuNhap_ID		INT				PRIMARY KEY NOT NULL,
        PhieuNhap_ID			INT,
        VatTu_ID				INT,
        ChiTietPhieuNhap_SoLuong INT,
        ChiTietPhieuNhap_Gia	INT,
        ChiTietPhieuNhap_Status	VARCHAR(255),
        FOREIGN KEY		(VatTu_ID)			REFERENCES		VatTu (VatTu_ID),
        FOREIGN KEY		(PhieuNhap_ID)		REFERENCES		PhieuNhap (PhieuNhap_ID)
	);
    
CREATE TABLE	ChiTietPhieuXuat
	(
		ChiTietPhieuXuat_ID		INT 			PRIMARY KEY NOT NULL,
        PhieuXuat_ID			INT,
        VatTu_ID				INT,
        ChiTietPhieuXuat_SoLuong INT,
        ChiTietPhieuXuat_Gia	INT,
        ChiTietPhieuXuat_Status	VARCHAR(255),
        FOREIGN KEY		(VatTu_ID)			REFERENCES		VatTu (VatTu_ID),
        FOREIGN KEY		(PhieuXuat_ID)		REFERENCES		PhieuXuat (PhieuXuat_ID)
	);
        