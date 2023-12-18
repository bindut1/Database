
USE PRACTICE1
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
	TienThuHo NVARCHAR(100),
	CONSTRAINT pk_ctdh PRIMARY KEY(MaDonHangGiaoHang, TenSanPhamDuocGiao)
)

ALTER TABLE CHITIET_DONHANG
ALTER COLUMN TrongLuong FLOAT

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
	('TV0001', 'Nguyen Van A', '1995-11-20T18:10:00', 1, '0905111111', '23 Ong Ich Khiem'),
	('TV0002', 'Nguyen Van B', '1992-12-26T18:10:00', 0, '0905111112', '234 Ton Duc Thang'),
	('TV0003', 'Nguyen Van C', '1990-11-30T18:10:00', 0, '0905111113', '45 Hoang Dieu'),
	('TV0004', 'Nguyen Van D', '1995-7-8T18:10:00', 1, '0905111114', '23/33 Ngu Hanh Son'),
	('TV0005', 'Nguyen Van E', '1991-2-4T18:10:00', 1, '090511115', '56 Dinh Thi Dieu')

TRUNCATE TABLE THANHVIENGIAOHANG
UPDATE THANHVIENGIAOHANG SET NgaySinh = '1995-11-20T18:10:00' WHERE MaThanhVienGiaoHang = 'TV0001'
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
	('DH0001', 'KH001', 'TV0001', 'DV001', 'KV001', 'Pham Van A', '30 Hoang Van Thu', '0905111111', 'TG004', '2016-10-10T18:10:00', 'Tien mat', 'Da phe duyet', 'Da giao hang'),
	('DH0002', 'KH001', 'TV0002', 'DV001', 'KV005', 'Pham Van B', '15 Le Dinh Ly', '0905111112', 'TG005', '2016-12-23T18:10:00', 'Tien mat', 'Da phe duyet', 'Chua giao hang'),
	('DH0003', 'KH002', 'TV0003', 'DV001', 'KV005', 'Pham Van C', '23 Le Dinh Duong', '0905111113', 'TG001', '2017-4-8T18:10:00', 'Tien mat', 'Da phe duyet', 'Da giao hang'),
	('DH0004', 'KH003', 'TV0001', 'DV003', 'KV002', 'Pham Van D', '45 Pham Phu Thai', '0905111114', 'TG002', '2015-10-11T18:10:00', 'Chuyen khoan', 'Da phe duyet', 'Da giao hang'),
	('DH0005', 'KH003', 'TV0005', 'DV003', 'KV003', 'Pham Van E', '78 Hoang Dieu', '0905111115', 'TG003', '2017-4-4T18:10:00', 'Chuyen khoan', 'Chua phe duyet', 'NULL')

SELECT *FROM DONHANG_GIAOHANG

INSERT CHITIET_DONHANG
VALUES
	--('DH0001', 'Ao len', 2, 0.5, 'MH001', '200,000'),
	--('DH0001', 'Quan au', 1, 0.25, 'MH002', '350,000'),
	('DH0002', 'Ao thun', 1, 0.25, 'MH001', '1,000,000'),
	('DH0002', 'Ao khoac', 3, 0.25, 'MH001', '2,000,000'),
	('DH0003', 'Sua duong the', 2, 0.25, 'MH002', '780,000'),
	('DH0003', 'Kem tay da chet', 3, 0.5, 'MH002', '150,000'),
	('DH0003', 'Kem duong ban dem', 4, 0.25, 'MH002', '900,000')
SELECT *FROM CHITIET_DONHANG
UPDATE CHITIET_DONHANG SET TrongLuong = '0.5' WHERE TenSanPhamDuocGiao = 'Ao len'
UPDATE CHITIET_DONHANG SET TrongLuong = '0.25' WHERE TenSanPhamDuocGiao = 'Quan au'
UPDATE CHITIET_DONHANG SET TrongLuong = '0.25' WHERE TenSanPhamDuocGiao = 'Ao thun'
UPDATE CHITIET_DONHANG SET TrongLuong = '0.25' WHERE TenSanPhamDuocGiao = 'Ao khoac'
UPDATE CHITIET_DONHANG SET TrongLuong = '0.25' WHERE TenSanPhamDuocGiao = 'Sua duong the'
UPDATE CHITIET_DONHANG SET TrongLuong = '0.5' WHERE TenSanPhamDuocGiao = 'Kem tay da chet'
UPDATE CHITIET_DONHANG SET TrongLuong = '0.25' WHERE TenSanPhamDuocGiao = 'Kem duong ban dem'

--Chinh sua Cascade

--Cau 1: Xoa nhung khach hang co ten la Le Thi A -> xoa rang buoc FOREIGN KEY giua KHACH_HANG voi DONHANG_GIAOHANG
SELECT * FROM KHACHHANG
SELECT * FROM DONHANG_GIAOHANG
UPDATE DONHANG_GIAOHANG SET MaKhachHang = NULL WHERE MaKhachHang = (SELECT MaKhachHang FROM KHACHHANG WHERE TenKhachHang = 'Le Thi A')
DELETE FROM KHACHHANG WHERE TenKhachHang = 'Le Thi A'

--Cau 2: Cập nhật những khách hàng đang thường trú ở khu vực "Son Tra" thành khu vực "Ngu Hanh Son".
SELECT * FROM KHUVUC
UPDATE KHACHHANG SET MaKhuVuc = (SELECT MaKhuVuc FROM KHUVUC WHERE TenKhuVuc = 'Ngu Hanh Son') WHERE MaKhuVuc = (SELECT MaKhuVuc FROM KHUVUC WHERE TenKhuVuc = 'Son Tra')

--Cau 3: Liệt kê những thành viên (shipper) có họ tên bắt đầu là ký tự 'Ng' và có độ dài ít nhất là 12 ký tự (kể cả ký tự trắng).
-- Neu khong tinh ki tu trang -> LEN(REPLACE(TenThanhVienGiaoHang, ' ', '')) >= 12
SELECT * FROM THANHVIENGIAOHANG WHERE TenThanhVienGiaoHang LIKE 'Ng%' AND LEN (TenThanhVienGiaoHang) >= 12
SELECT * FROM THANHVIENGIAOHANG WHERE TenThanhVienGiaoHang LIKE 'Ng%' AND LEN(REPLACE(TenThanhVienGiaoHang, ' ', '')) >= 12

--Cau 4:
-- Tạo bảng tạm
CREATE TABLE #TempTable
(
    X INT
);
-- Insert dữ liệu vào bảng tạm từ bảng DONHANG_GIAOHANG
INSERT INTO #TempTable (X)
SELECT YEAR(GETDATE()) - YEAR(NgayGiaoHang) AS X
FROM DONHANG_GIAOHANG;
-- Hiển thị nội dung của bảng tạm
SELECT * FROM #TempTable;
SELECT X FROM #TempTable WHERE X BETWEEN 5 AND 6
SELECT * FROM DONHANG_GIAOHANG WHERE (NgayGiaoHang = (SELECT X FROM #TempTable WHERE X BETWEEN 5 AND 6)) AND MaKhuVucGiaoHang = (SELECT MaKhuVuc FROM KHUVUC WHERE TenKhuVuc = 'Hai Chau') 

--SOLUTION
SELECT * FROM DONHANG_GIAOHANG INNER JOIN KHUVUC ON DONHANG_GIAOHANG.MaKhuVucGiaoHang = KHUVUC.MaKhuVuc WHERE YEAR(NgayGiaoHang) = 2017 AND TenKhuVuc = 'Thanh Khe'

--Cau 5:
SELECT MaDonHangGiaoHang, THANHVIENGIAOHANG.MaThanhVienGiaoHang, THANHVIENGIAOHANG.TenThanhVienGiaoHang, NgayGiaoHang, PhuongThucThanhToan  
FROM DONHANG_GIAOHANG INNER JOIN THANHVIENGIAOHANG 
ON DONHANG_GIAOHANG.MaThanhVienGiaoHang = THANHVIENGIAOHANG.MaThanhVienGiaoHang 
WHERE TrangThaiGiaoHang = 'Da giao hang'
ORDER BY NgayGiaoHang ASC, PhuongThucThanhToan DESC

--Cau 6:
SELECT * FROM THANHVIENGIAOHANG 
WHERE GioiTinh = 1 AND MaThanhVienGiaoHang NOT IN (SELECT MaThanhVienGiaoHang FROM DONHANG_GIAOHANG)

--Cau 7:
--Cach 1
SELECT DISTINCT(TenKhachHang) FROM KHACHHANG
--Cach 2:
SELECT TenKhachHang FROM KHACHHANG
GROUP BY TenKhachHang

--Cau 8:
SELECT KHACHHANG.MaKhachHang, TenKhachHang,DiaChiNhanHang, MaDonHangGiaoHang, PhuongThucThanhToan, TrangThaiGiaoHang
FROM KHACHHANG LEFT OUTER JOIN DONHANG_GIAOHANG
ON KHACHHANG.MaKhachHang = DONHANG_GIAOHANG.MaKhachHang

--Cau 9:
SELECT THANHVIENGIAOHANG.MaThanhVienGiaoHang FROM THANHVIENGIAOHANG INNER JOIN DONHANG_GIAOHANG 
ON THANHVIENGIAOHANG.MaThanhVienGiaoHang = DONHANG_GIAOHANG.MaThanhVienGiaoHang
INNER JOIN KHUVUC ON DONHANG_GIAOHANG.MaKhuVucGiaoHang = KHUVUC.MaKhuVuc 
WHERE GioiTinh = '1' AND TenKhuVuc = 'Lien Chieu'
GROUP BY THANHVIENGIAOHANG.MaThanhVienGiaoHang
HAVING COUNT(DISTINCT DONHANG_GIAOHANG.MaKhachHang) = 1	

--Cau 10:
SELECT KHACHHANG.*
FROM KHACHHANG INNER JOIN DONHANG_GIAOHANG
ON KHACHHANG.MaKhachHang = DONHANG_GIAOHANG.MaKhachHang
INNER JOIN KHUVUC ON DONHANG_GIAOHANG.MaKhuVucGiaoHang = KHUVUC.MaKhuVuc
WHERE TenKhuVuc='Lien Chieu'
EXCEPT
SELECT KHACHHANG.*
FROM KHACHHANG INNER JOIN DONHANG_GIAOHANG
ON KHACHHANG.MaKhachHang = DONHANG_GIAOHANG.MaKhachHang
INNER JOIN THANHVIENGIAOHANG ON
DONHANG_GIAOHANG.MaThanhVienGiaoHang=THANHVIENGIAOHANG.MaThanhVienGiaoHang
WHERE GioiTinh = '1'