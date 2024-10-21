--1
SELECT member_no, isbn, fine_assessed
FROM loanhist
WHERE fine_assessed IS NOT NULL
  AND fine_assessed <> 0

--2
SELECT member_no, isbn, fine_assessed, fine_assessed * 2
FROM loanhist
WHERE fine_assessed IS NOT NULL
  AND fine_assessed <> 0

--3
SELECT member_no, isbn, fine_assessed, fine_assessed * 2 AS double_fine
FROM loanhist
WHERE fine_assessed IS NOT NULL
  AND fine_assessed <> 0
ORDER BY double_fine