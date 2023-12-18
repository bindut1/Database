CREATE DATABASE PRACTICE2
USE PRACTICE2
GO

CREATE TABLE DON_VI_UNG_HO
(
	MaDVUH NVARCHAR(100),
	HoTenNguoiDaiDien NVARCHAR(100),
	DiaChiNguoiDaiDien NVARCHAR(100),
	SoDienThoaiLienLac CHAR(15),
	SoCMNDNguoiDaiDien CHAR(15),
	SoTaiKhoanNganHang CHAR(15),
	TenNganHang NVARCHAR(100),
	ChiNhanhNganHang NVARCHAR(100),
	TenChuTKNganHang NVARCHAR(100),
	CONSTRAINT pk_dvuh PRIMARY KEY(MaDVUH)
)

CREATE TABLE DOT_UNG_HO
(
	MaDotUngHo NVARCHAR(100),
	MaDVUH NVARCHAR(100) FOREIGN KEY(MaDVUH) REFERENCES DON_VI_UNG_HO(MaDVUH),
	NgayUngHo DATE,
	CONSTRAINT pk_duh PRIMARY KEY(MaDotUngHo)
)

CREATE TABLE HINH_THUC_UH
(
	MaHinhThucUH NVARCHAR(100),
	TenHinhThucUngHo NVARCHAR(100),
	CONSTRAINT pk_htuh PRIMARY KEY(MaHinhThucUH)
)

CREATE TABLE CHI_TIET_UNG_HO
(
	MaDotUngHo NVARCHAR(100) FOREIGN KEY(MaDotUngHo) REFERENCES DOT_UNG_HO(MaDotUngHo),
	MaHinhThucUH NVARCHAR(100) FOREIGN KEY(MaHinhThucUH) REFERENCES HINH_THUC_UH(MaHinhThucUH),
	SoluongUngHo CHAR(15),
	DonViTinh NVARCHAR(100),
	CONSTRAINT pk_ctuh PRIMARY KEY(MaDotUngHo, MaHinhThucUH)
)
DROP TABLE CHI_TIET_UNG_HO

CREATE TABLE HO_DAN
(
	MaHoDan NVARCHAR(100),
	HoTenChuHo NVARCHAR(100),
	ToDanPho INT,
	KhoiHoacThon INT,
	SoDienThoai CHAR(15),
	DiaChiNha NVARCHAR(100),
	SoNhanKhau INT,
	DienGiaDinh NVARCHAR(100),
	LaHoNgheo CHAR(15),
	CONSTRAINT pk_hd PRIMARY KEY(MaHoDan)
)

CREATE TABLE DOT_NHAN_UNG_HO
(
	MaDotNhanUngHo NVARCHAR(100),
	MaHoDan NVARCHAR(100) FOREIGN KEY(MaHoDan) REFERENCES HO_DAN(MaHoDan),
	NgayNhanUngHo DATE,
	CONSTRAINT pk_dnuh PRIMARY KEY(MaDotNhanUngHo)
)

CREATE TABLE CHI_TIET_NHAN_UNG_HO
(
	MaDotNhanUngHo NVARCHAR(100) FOREIGN KEY(MaDotNhanUngHo) REFERENCES DOT_NHAN_UNG_HO(MaDotNhanUngHo),
	MaHinhThucUH NVARCHAR(100) FOREIGN KEY(MaHinhThucUH) REFERENCES HINH_THUC_UH(MaHinhThucUH),
	SoLuongNhanUngHo CHAR(15),
	DonViTinh NVARCHAR(100),
	CONSTRAINT pk_ctnuh PRIMARY KEY(MaDotNhanUngHo, MaHinhThucUH)
)

--coi lai cho rang buoc giua DON_VI_UNG_HO va DOT_UNG_HO

INSERT DON_VI_UNG_HO
VALUES
	('CN001', 'Nguyen Van A1', 'Nui Thanh, Quang Nam', '0905121121', '124898000', '65874000', 'TienPhongBank', 'Da Nang', 'Nguyen Van A1'),
	('CN002', 'Nguyen Van A2', 'Phong Die, Thua Thien Hue', '0905121122', '124898001', '65874001', 'Vietcom', 'Quang Nam', 'Nguyen Van A2'),
	('CTY01', 'Nguyen Van A3', 'Tam Dao, Vinh Phuc', '0905121123', '124898002', '65874002', 'DongA', 'Thua Thien Hue', 'Nguyen Van A3'),
	('CTY02', 'Nguyen Van A4', 'Ba To, Quang Ngai', '0905121124', '124898003', '65874003', 'Mbank', 'Gia Lai', 'Nguyen Van A4')
SELECT * FROM DON_VI_UNG_HO

INSERT DOT_UNG_HO
VALUES 
	('UH001', 'CN002', '2016-11-18T18:10:00'),
	('UH002', 'CTY01', '2015-11-19T18:10:00'),
	('UH003', 'CTY02', '2015-08-10T18:10:00'),
	('UH004', 'CTY02', '2015-10-20T18:10:00'),
	('UH005', 'CTY02', '2016-11-11T18:10:00')
SELECT * FROM DOT_UNG_HO

INSERT HINH_THUC_UH
VALUES
	('HT01', 'Tien mat'),
	('HT02', 'Mi tom'),
	('HT03', 'Quan ao')
SELECT * FROM HINH_THUC_UH

--ERROR??????????????????
INSERT CHI_TIET_UNG_HO
VALUES
	('UH001', 'HT01', '6,000', 'USD'),
	('UH002', 'HT02', '50', 'Thung'),
	('UH003', 'HT03', '200', 'Bo'),
	('UH003', 'HT01', '100,000', 'JPY'),
	('UH004', 'HT01', '100,000', 'USD'),
	('UH005', 'HT03', '100', 'Bo')
SELECT * FROM CHI_TIET_UNG_HO

INSERT HO_DAN
VALUES
	('HD001', 'Tran Van B1', 10, 5, '0915222000', '12 Tran Van On', 5, 'Cong Nhan Vien Chuc', 'Dung'),
	('HD002', 'Tran Van B2', 11, 6, '0915222001', '13 Nguyen Huu Tho', 2, 'Cong Nhan Vien Chuc', 'Sai'),
	('HD003', 'Tran Van B3', 12, 7, '0915222002', '14 Phan Chu Trinh', 6, 'Thuong Binh', 'Dung'),
	('HD004', 'Tran Van B4', 13, 7, '0915222003', '15 Phan Chu Trinh', 1, 'Me VNAH', 'Dung')
SELECT * FROM HO_DAN

INSERT DOT_NHAN_UNG_HO
VALUES
	('NhanUH001', 'HD003', '2016-11-11T18:10:00'),
	('NhanUH002', 'HD001', '2016-11-18T18:10:00'),
	('NhanUH003', 'HD003', '2016-11-20T18:10:00')
SELECT * FROM DOT_NHAN_UNG_HO

INSERT CHI_TIET_NHAN_UNG_HO
VALUES
	('NhanUH001', 'HT01', '5,000', 'USD'),
	('NhanUH001', 'HT02', '50', 'Thung'),
	('NhanUH002', 'HT03', '100', 'Bo'),
	('NhanUH003', 'HT01', '10,000,000', 'VND'),
	('NhanUH003', 'HT02', '25', 'Thung'),
	('NhanUH003', 'HT03', '70', 'Bo')
SELECT * FROM CHI_TIET_NHAN_UNG_HO