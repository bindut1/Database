CREATE DATABASE LABB
GO
USE LABB
GO
SET DATEFORMAT dmy

CREATE TABLE LOAIMATHANG 
(
	MaLoaiMatHang NVARCHAR(100),
	TenLoaiMatHang NVARCHAR(100),
	CONSTRAINT pk_lmh PRIMARY KEY(MaLoaiMatHang)
)

CREATE TABLE DICHVU
(
	MaDichVu CHAR(10),
	TenDichVu NVARCHAR(100),
	CONSTRAINT pk_dv PRIMARY KEY(MaDichVu)
)

CREATE TABLE KHOANGTHOIGIAN
(
	MaKhoangThoiGian CHAR(10),
	MoTa NVARCHAR(100),
	CONSTRAINT pk_ktg PRIMARY KEY(MaKhoangThoiGian)
)

CREATE TABLE KHUVUC
(
	MaKhuVuc CHAR(10),
	TenKhuVuc NVARCHAR(100),
	CONSTRAINT pk_kv PRIMARY KEY(MaKhuVuc)
)

CREATE TABLE KHACHHANG
(
	MaKhachHang CHAR(10),
	MaKhuVuc CHAR(10) FOREIGN KEY(MaKhuVuc) REFERENCES KHUVUC(MaKhuVuc),
	TenKhachHang NVARCHAR(100),
	TenCuaHang NVARCHAR(100),
	SoDTKhachHang CHAR(15), 
	DiaChiEmail NVARCHAR(100),
	DiaChiNhanHang NVARCHAR(100)
	CONSTRAINT pk_kh PRIMARY KEY(MaKhachHang)
)

CREATE TABLE THANHVIENGIAOHANG
(
	MaThanhVienGiaoHang CHAR(10),
	TenThanhVienGiaoHang NVARCHAR(100),
	NgaySinh DATE,
	GioiTinh BIT,
	SoDTThanhVien CHAR(15),
	DiaChiThanhVien NVARCHAR(100),
	CONSTRAINT pk_tvgh PRIMARY KEY(MaThanhVienGiaoHang)
)

CREATE TABLE DONHANG_GIAOHANG
(
	MaDonHangGiaoHang CHAR(10),
	MaKhachHang CHAR(10) FOREIGN KEY(MaKhachHang) REFERENCES KHACHHANG(MaKhachHang),
	MaThanhVienGiaoHang CHAR(10) FOREIGN KEY(MaThanhVienGiaoHang) REFERENCES THANHVIENGIAOHANG(MaThanhVienGiaoHang),
	MaDichVu CHAR(10) FOREIGN KEY(MaDichVu) REFERENCES DICHVU(MaDichVu),
	MaKhuVucGiaoHang CHAR(10) FOREIGN KEY(MaKhuVucGiaoHang) REFERENCES KHUVUC(MaKhuVuc),
	TenNguoiNhan NVARCHAR(100), 
	DiaChiGiaoHang NVARCHAR(100),
	SoDTNguoiNhan CHAR(15),
	MaKhoangThoiGianGiaoHang CHAR(10) FOREIGN KEY(MaKhoangThoiGianGiaoHang) REFERENCES KHOANGTHOIGIAN(MaKhoangThoiGian),
	NgayGiaoHang DATE,
	PhuongThucThanhToan NVARCHAR(100),
	TrangThaiPheDuyet NVARCHAR(100),
	TrangThaiGiaoHang NVARCHAR(100),
	CONSTRAINT pk_dhgh PRIMARY KEY(MaDonHangGiaoHang)
)

CREATE TABLE DANGKYGIAOHANG
(
	MaThanhVienGiaoHang CHAR(10),
	MaKhoangThoiGianDKGiaoHang CHAR(10) FOREIGN KEY(MaKhoangThoiGianDKGiaoHang) REFERENCES KHOANGTHOIGIAN(MaKhoangThoiGian)
)

CREATE TABLE CHITIET_DONHANG
(
	MaDonHangGiaoHang CHAR(10) FOREIGN KEY REFERENCES DONHANG_GIAOHANG(MaDonHangGiaoHang),
	TenSanPhamDuocGiao NVARCHAR(100),
	SoLuong INT,
	TrongLuong INT,
	MaLoaiMatHang NVARCHAR(100) FOREIGN KEY(MaLoaiMatHang) REFERENCES LOAIMATHANG(MaLoaiMatHang),
	TienThuHo CHAR(20),
	CONSTRAINT pk_ctdh PRIMARY KEY(MaDonHangGiaoHang, TenSanPhamDuocGiao)
)

ALTER TABLE CHITIET_DONHANG

INSERT LOAIMATHANG
VALUES
	('MH001', 'Quan ao'),
	('MH002', 'My pham'),
	('MH003', 'Do gia dung'),
	('MH004', 'Do dien tu')

SELECT * FROM LOAIMATHANG


INSERT KHUVUC
VALUES
	('KV001', 'Son Tra'),
	('KV002', 'Lien Chieu'),
	('KV003', 'Ngu Hanh Son'),
	('KV004', 'Hai Chau'),
	('KV005', 'Thanh Khe')

SELECT *FROM KHUVUC

INSERT KHOANGTHOIGIAN
VALUES
	('TG001', '7h - 9h AM'),
	('TG002', '9h - 11h AM'),
	('TG003', '1h - 3h PM'),
	('TG004', '3h - 5h PM'),
	('TG005', '7h - 9h30 PM')

SELECT *FROM KHOANGTHOIGIAN

INSERT DICHVU
VALUES
	('DV001', 'Giao hang nguoi nhan tra tien phi'),
	('DV002', 'Giao hang nguoi gui tra tien phi'),
	('DV003', 'Giao hang cong ich (khong tinh phi)')

SELECT *FROM DICHVU
--quy uoc nam: 1, nu: 0
--khoi tao CONSTRAINT name cho rang buoc khoa ngoai

INSERT THANHVIENGIAOHANG
VALUES
	('TV0001', 'Nguyen Van A', '11/20/1995', 1, '0905111111', '23 Ong Ich Khiem'),
	('TV0002', 'Nguyen Van B', '12/26/1992', 0, '0905111112', '234 Ton Duc Thang'),
	('TV0003', 'Nguyen Van C', '11/30/1990', 0, '0905111113', '45 Hoang Dieu'),
	('TV0004', 'Nguyen Van D', '7/8/1995', 1, '0905111114', '23/33 Ngu Hanh Son'),
	('TV0005', 'Nguyen Van E', '2/4/1991', 1, '090511115', '56 Dinh Thi Dieu')

TRUNCATE TABLE THANHVIENGIAOHANG
UPDATE THANHVIENGIAOHANG SET SoDTThanhVien = '0905111111' WHERE MaThanhVienGiaoHang = 'TV0001'
UPDATE THANHVIENGIAOHANG SET SoDTThanhVien = '0905111112' WHERE MaThanhVienGiaoHang = 'TV0002'
UPDATE THANHVIENGIAOHANG SET SoDTThanhVien = '0905111113' WHERE MaThanhVienGiaoHang = 'TV0003'
UPDATE THANHVIENGIAOHANG SET SoDTThanhVien = '0905111114' WHERE MaThanhVienGiaoHang = 'TV0004'
UPDATE THANHVIENGIAOHANG SET SoDTThanhVien = '0905111115' WHERE MaThanhVienGiaoHang = 'TV0005'
SELECT *FROM THANHVIENGIAOHANG

INSERT DANGKYGIAOHANG
VALUES
	('TV0001', 'TG004'),
	('TV0002', 'TG005'),
	('TV0003', 'TG001'),
	('TV0003', 'TG002'),
	('TV0003', 'TG003')

SELECT *FROM DANGKYGIAOHANG

INSERT KHACHHANG
VALUES
	('KH001', 'KV001', 'Le Thi A', 'Cua hang 1', '0905111111', 'alethi@gmail.com', '80 Pham Phu Thai'),
	('KH002', 'KV001', 'Nguyen Van B', 'Cua hang 2', '0905111112', 'bnguyenvan@gmail.com', '100 Phan Tu'),
	('KH003', 'KV002', 'Le Thi B', 'Cua hang 3', '0905111113', 'blethi@gmail.com', '23 An Thuong 18'),
	('KH004', 'KV002', 'Nguyen Van C', 'Cua hang 4', '0905111114', 'cnguyenvan@gmail.com', '67 Ngo The Hai'),
	('KH005', 'KV001', 'Le Thi D', 'Cua hang 5', '0905111115', 'dlethi@gmail.com', '100 Chau Thi Vinh Te')

SELECT *FROM KHACHHANG

INSERT DONHANG_GIAOHANG
VALUES
	('DH0001', 'KH001', 'TV001', 'DV001', 'KV001', 'Pham Van A', '30 Hoang Van Thu', '0905111111', 'TG004', '10/10/2016', 'Tien mat', 'Da phe duyet', 'Da giao hang'),
	('DH0002', 'KH001', 'TV002', 'DV001', 'KV005', 'Pham Van B', '15 Le Dinh Ly', '0905111112', 'TG005', '12/23/2016', 'Tien mat', 'Da phe duyet', 'Chua giao hang'),
	('DH0003', 'KH002', 'TV003', 'DV001', 'KV005', 'Pham Van C', '23 Le Dinh Duong', '0905111113', 'TG001', '4/8/2017', 'Tien mat', 'Da phe duyet', 'Da giao hang'),
	('DH0004', 'KH003', 'TV001', 'DV003', 'KV002', 'Pham Van D', '45 Pham Phu Thai', '0905111114', 'TG002', '10/11/2015', 'Chuyen khoan', 'Da phe duyet', 'Da giao hang'),
	('DH0005', 'KH003', 'TV005', 'DV003', 'KV003', 'Pham Van E', '78 Hoang Dieu', '0905111115', 'TG003', '4/4/2017', 'Chuyen khoan', 'Chua phe duyet', 'NULL')

INSERT CHITIET_DONHANG
VALUES
	('DH0001', 'Ao len', 2, 0.5, 'thong thuong', '200,000'),
	('DH0001', 'Quan au', 1, 0.25, 'thong thuong', '350,000'),
	('DH0002', 'Ao thun', 1, 0.25, 'thong thuong', '1,000,000'),
	('DH0002', 'Ao khoac', 3, 0.25, 'thong thuong', '2,000,000'),
	('DH0003', 'Sua duong the', 2, 0.25, 'thong thuong', '780,000'),
	('DH0003', 'Kem tay da chet', 3, 0.5, 'thong thuong', '150,000'),
	('DH0003', 'Kem duong ban dem', 4, 0.25, 'thong thuong', '900,000')