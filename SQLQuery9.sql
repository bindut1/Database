USE HowKteam
GO

--bang ben phai nhap vao bang ben trai
--record nao bang phai ko co thi de null
--record nao bang trai ko co thi ko dien vao
SELECT * FROM BOMON LEFT JOIN GIAOVIEN
ON BOMON.MABM = GIAOVIEN.MABM	

--backupp du lieu, tao ra mot bang moi tu du lieu da co san
SELECT * INTO TableA
FROM GIAOVIEN

--copy du lieu ra mot bang da ton tai
SELECT * INTO CLONEGV
FROM GIAOVIEN
WHERE 1 = 0

INSERT INTO CLONEGV
SELECT * FROM GIAOVIEN

SELECT * FROM CLONEGV