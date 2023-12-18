
USE SQLDBQuery

CREATE TABLE TEST1
(
	MaSo INT,
	Ten NVARCHAR(10),
	NgaySinh DATE,
	Gioitinh BIT,
	Diachi CHAR(20),
	Tienluong FLOAT
)
GO

set dateformat dmy


INSERT dbo.TEST1
VALUES 
(
	10,
	N'Trần',
	'2004-12-26T17:25:50',
	1,
	'DA NANG',
	10000
)
INSERT dbo.TEST1
VALUES 
(
	13,
	N'Trần',
	'2004-12-26T17:25:50',
	1,
	'DA NANG',
	10000
)
INSERT dbo.TEST1
VALUES 
(
	12,
	N'Trần',
	'2004-12-26T17:25:50',
	1,
	'DA NANG',
	10000
)
INSERT dbo.TEST1
VALUES 
(
	11,
	N'Trần',
	'2004-12-26T17:25:50',
	1,
	'DA NANG',
	10000
)

DELETE TEST1 WHERE MaSo < 13 AND Tienluong < 20000

UPDATE TEST1 SET Ten = 'HIHI', Diachi = 8