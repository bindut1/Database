USE HowKteam
GO

SELECT * FROM BOMON --Lay tat ca du lieu trong bang ra
SELECT * FROM GIAOVIEN

--Lay ma de tai voi ten de tai trong bang bo mon
SELECT MABM, TENBM FROM BOMON

--Doi ten cot hien thi
SELECT MABM AS 'LV TRAN', TENBM AS N'Giáo dục' FROM BOMON

-- Truy van 2 bang cung 1 luc
SELECT GV.MAGV, GV.HOTEN, BM.TENBM FROM GIAOVIEN AS GV, BOMON AS BM

SELECT * FROM THAMGIADT
SELECT * FROM KHOA