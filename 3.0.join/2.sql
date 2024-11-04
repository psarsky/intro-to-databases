--1
SELECT m.firstname, m.lastname, j.birth_date
FROM juvenile AS j
         INNER JOIN member AS m
                    ON j.member_no = m.member_no

--2
SELECT DISTINCT t.title
FROM loan AS l
         INNER JOIN title AS t
                    ON l.title_no = t.title_no

--3
SELECT l.due_date, l.in_date, DATEDIFF(DAY, l.due_date, l.in_date) AS Delay,l.fine_assessed, l.fine_paid
FROM loanhist AS l
         INNER JOIN title AS t
                    ON l.title_no = t.title_no
WHERE t.title = 'Tao Teh King'
  AND DATEDIFF(DAY, l.due_date, l.in_date) > 0
ORDER BY Delay

--4
SELECT r.isbn
FROM reservation AS r
         INNER JOIN member AS m
                    ON r.member_no = m.member_no
WHERE m.firstname = 'Stephen'
  AND m.lastname = 'Graff'