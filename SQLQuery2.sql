CREATE DATABASE SQLDBQuery
GO
USE SQLDBQuery
GO
CREATE TABLE GiaoVien
(
	MaGV NVARCHAR(10),
	Ten NVARCHAR(100) 
)
GO
CREATE TABLE HocSinh
(
	MaHS NVARCHAR(10),
	Ten NVARCHAR(100)
)
GO
ALTER TABLE HocSinh ADD NgaySinh Date -- Sua bang 
-- DROP TABLE HocSinh
TRUNCATE TABLE HocSinh -- Xoa du lieu trong bang
DROP TABLE HocSinh -- Xoa toan bo bang
GO


