CREATE DATABASE Primary_Foreign

GO

USE Primary_Foreign

GO

CREATE TABLE Bomon
(
	MaBM CHAR(10) PRIMARY KEY,
	Name NVARCHAR(100) DEFAULT N'Ten bo mon'
)
GO
CREATE TABLE Lop
(
	Malop CHAR(10) NOT NULL,
	Name NVARCHAR(100) DEFAULT N'Ten lop'
	PRIMARY KEY(Malop)
)
GO
-- Tao khoa ngoai ngay khi tao bang
CREATE TABLE Giaovien
(
	MaGV CHAR(10) NOT NULL,
	Name NVARCHAR(100) DEFAULT N'Ten giao vien',
	Diachi NVARCHAR(100) DEFAULT N'Dia chi giao vien',
	Ngaysinh DATE,
	Sex BIT,
	MaBM CHAR(10),
	FOREIGN KEY(MaBM) REFERENCES Bomon(MaBM)
)
GO

ALTER TABLE Giaovien ADD PRIMARY KEY (MaGV)

CREATE TABLE Hocsinh
(
	MaHS CHAR(10) PRIMARY KEY,
	Name NVARCHAR(100),
	Malop CHAR(10)
)
GO
-- Tao khoa ngoai sau khi tao bang
ALTER TABLE Hocsinh ADD CONSTRAINT FK_HS FOREIGN KEY(Malop) REFERENCES Lop(Malop)

--Huy khoa
ALTER TABLE Hocsinh DROP CONSTRAINT FK_HS

INSERT Bomon
VALUES
(
	'BM01',
	N'Bo mon 1'
)
GO
INSERT Bomon 
VALUES
(
	'BM02',
	N'Bo mon 2'
)
GO
INSERT Bomon 
VALUES
(
	'BM03',
	N'Bo mon 3'
)

INSERT Giaovien
VALUES
(
	'GV01',
	N'GV1',
	N'DC1',
	GETDATE(),
	1,
	'BM03'
)