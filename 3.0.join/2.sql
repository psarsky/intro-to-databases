--1
SELECT m.firstname, m.lastname
FROM juvenile AS j
         INNER JOIN member AS m
                    ON j.member_no = m.member_no

--2
SELECT t.title
FROM loan AS l
         INNER JOIN title AS t
                    ON l.title_no = t.title_no

--3
SELECT l.in_date, l.fine_paid
FROM loanhist AS l
         INNER JOIN title AS t
                    ON l.title_no = t.title_no
WHERE t.title = 'Tao Teh King'
  AND l.fine_paid IS NOT NULL