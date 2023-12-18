USE HowKteam
GO

--truy van long

SELECT * FROM GIAOVIEN
WHERE MAGV = '001'
AND MAGV IN -- HOAC NOT IN
(
	SELECT GVQLCM FROM GIAOVIEN
)

--truy van long trong from
SELECT * FROM GIAOVIEN,
(SELECT * FROM DETAI) AS DT 

--xuat ra danh sach giao vien tham gia nhieu hon mot de tai, hoac nhung giao vien co tham gia de tai
SELECT * FROM GIAOVIEN AS GV
WHERE 0 < 
(
	SELECT COUNT(*) FROM THAMGIADT WHERE MAGV = GV.MAGV
)

--xuat ra thong tin giao vien ma co hon 1 nguoi than
SELECT * FROM NGUOITHAN
SELECT * FROM GIAOVIEN

SELECT * FROM GIAOVIEN AS GV
WHERE 1 <
(
	SELECT COUNT(*) FROM NGUOITHAN WHERE MAGV = GV.MAGV
)

--xuat ra thong tin cua khoa ma co nhieu hon 2 giao vien

SELECT * FROM KHOA AS K
WHERE 3 <
(
	SELECT COUNT(*) FROM BOMON AS BM, GIAOVIEN AS GV WHERE BM.MAKHOA = K.MAKHOA AND BM.MABM = GV.MABM
)

--sap xep giam dan(DESC), tang dan(ASC)
SELECT MAGV FROM GIAOVIEN ORDER BY MAGV DESC 

--group by
USE HowKteam
GO
SELECT TENBM, COUNT(*) FROM BOMON, GIAOVIEN
WHERE BOMON.MABM = GIAOVIEN.MABM
GROUP BY TENBM

--agreegate function
/* 
AVG: trung binh
COUNT
FIRST
LAST
MAX
MIN
ROUND
SUM
*/

--lay ra danh sach giao vien co luong trung binh lon hon luong trung binh cua giao vien
SELECT * FROM GIAOVIEN
WHERE LUONG > 
(SELECT SUM(LUONG) FROM GIAOVIEN) / (SELECT COUNT(*) FROM GIAOVIEN)

--xuat ra ten giao vien va so luong de tai ma ma giao vien do da tham gia
SELECT GV.HOTEN, COUNT(*) FROM GIAOVIEN AS GV, THAMGIADT AS TGDT
WHERE GV.MAGV = TGDT.MAGV
GROUP BY GV.MAGV, GV.HOTEN

--xuat ra ten giao vien va so luong nguoi than cua giao vien do
SELECT * FROM NGUOITHAN
SELECT * FROM GIAOVIEN
SELECT GV.HOTEN, COUNT(*) FROM GIAOVIEN AS GV, NGUOITHAN AS NT
WHERE GV.MAGV = NT.MAGV
GROUP BY GV.MAGV, GV.HOTEN

--xuat ra ten giao vien va so luong de tai da hoan thanh ma nguoi do tham gia
SELECT * FROM THAMGIADT
SELECT * FROM GIAOVIEN 
SELECT GV.HOTEN, COUNT(*) AS 'SO LUONG' FROM GIAOVIEN AS GV, THAMGIADT AS TGDT
WHERE GV.MAGV = TGDT.MAGV AND TGDT.KETQUA = N'Đạt'	
GROUP BY GV.MAGV, GV.HOTEN

--GROUP BY - HAVING
SELECT BOMON.MABM, COUNT(*) FROM GIAOVIEN, BOMON
WHERE BOMON.MABM = GIAOVIEN.MABM 
GROUP BY BOMON.MABM
HAVING COUNT(*) > 2

--auto increament
CREATE TABLE auto
(
	ID INT PRIMARY KEY IDENTITY(2, 5),
	Name NVARCHAR(100)
)

INSERT auto (Name) VALUES (N'hi')
INSERT auto (Name) VALUES (N'hi')
INSERT auto (Name) VALUES (N'hi')
INSERT auto (Name) VALUES (N'hi')
INSERT auto (Name) VALUES (N'hi')

SELECT * FROM auto