--1
SELECT member_no, isbn, fine_assessed
FROM loanhist
WHERE fine_assessed IS NOT NULL

--2
SELECT member_no, isbn, fine_assessed, fine_assessed * 2
FROM loanhist
WHERE fine_assessed IS NOT NULL

--3
SELECT member_no, isbn, fine_assessed, fine_assessed * 2 as double_fine
FROM loanhist
WHERE fine_assessed IS NOT NULL