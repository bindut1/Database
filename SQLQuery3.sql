--CACH 1: Khi tao bang co primary key luon
CREATE TABLE TestPrimaryKey0
(	
	ID INT PRIMARY KEY,
	Name NVARCHAR(100) DEFAULT N'VuLam'
)

--CACH 2: Khi da tao bang. Muon sua cot primary key
CREATE TABLE TestPrimaryKey1
(	
	ID INT UNIQUE NOT NULL, -- UNIQUE NOT NULL = PRIMARY KEY
	Name NVARCHAR(100) DEFAULT N'VuLam'
)
GO
ALTER TABLE TestPrimaryKey1 ADD PRIMARY KEY (ID)

--CACH 3: Tao primary key trong bang nhung khong phai luc khai bao
CREATE TABLE TestPrimaryKey2
(	
	ID INT NOT NULL,
	Name NVARCHAR(100) DEFAULT N'VuLam',
	PRIMARY KEY (ID)
)

--CACH 4: Tao primary key ngay trong bang ma dat ten cho key do
CREATE TABLE TestPrimaryKey3
(	
	ID INT NOT NULL,
	Name NVARCHAR(100) DEFAULT N'VuLam',
	CONSTRAINT PK_Test3 -- sau nay xoa key cho no de
	PRIMARY KEY (ID)
)

--CACH 5: Tao primary key sau khi tao bang va dat ten cho key do
CREATE TABLE TestPrimaryKey4
(	
	ID INT NOT NULL, -- UNIQUE NOT NULL = PRIMARY KEY
	Name NVARCHAR(100) DEFAULT N'VuLam'
)
GO
ALTER TABLE TestPrimaryKey4 
ADD CONSTRAINT PK_Test4
PRIMARY KEY (ID)

-- Khoa chinh co 2 truong
CREATE TABLE TestPrimaryKey5
(	
	ID1 INT NOT NULL,
	ID2 INT NOT NULL,
	Name NVARCHAR(100) DEFAULT N'VuLam'
	PRIMARY KEY (ID1, ID2)
)


INSERT TestPrimaryKey1 (ID) VALUES (0)
INSERT TestPrimaryKey1 (ID) VALUES (1)
INSERT TestPrimaryKey1 (ID) VALUES (2)
