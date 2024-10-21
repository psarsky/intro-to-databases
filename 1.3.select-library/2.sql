--1
SELECT *
FROM title
WHERE title LIKE '%adventure%'
   OR title LIKE '%Adventure%'

--2
SELECT member_no, fine_paid
FROM loanhist

--3
SELECT DISTINCT city, state
FROM adult

--4
SELECT title
FROM title
ORDER BY title