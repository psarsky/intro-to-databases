--1
SELECT m.firstname + ' ' + m.lastname AS name, a.street + ', ' + a.zip + ' ' + a.city + ' ' + a.state AS address
FROM adult AS a
         INNER JOIN member AS m
                    ON a.member_no = m.member_no

--2
SELECT c.isbn, c.copy_no, c.on_loan, t.title, i.translation, i.cover
FROM copy AS c
         INNER JOIN title AS t
                    ON c.title_no = t.title_no
         INNER JOIN item AS i
                    ON c.isbn = i.isbn
WHERE c.isbn IN (1, 500, 1000)
ORDER BY c.isbn

--3
SELECT m.member_no, m.firstname + ' ' + m.lastname AS full_name, r.isbn, r.log_date
FROM member AS m
         LEFT JOIN reservation AS r
                   ON m.member_no = r.member_no
WHERE m.member_no IN (250, 342, 1675)

--4
SELECT m.firstname, m.lastname, COUNT(j.member_no) AS children
FROM adult AS a
         INNER JOIN member AS m
                    ON m.member_no = a.member_no
         INNER JOIN juvenile AS j
                    ON m.member_no = j.adult_member_no
WHERE a.state = 'AZ'
GROUP BY m.member_no, m.firstname, m.lastname
HAVING COUNT(j.member_no) > 2

--5
SELECT m.firstname, m.lastname, COUNT(j.member_no) AS children
FROM adult AS a
         INNER JOIN member AS m
                    ON m.member_no = a.member_no
         INNER JOIN juvenile AS j
                    ON m.member_no = j.adult_member_no
WHERE a.state = 'AZ'
GROUP BY m.member_no, m.firstname, m.lastname
HAVING COUNT(j.member_no) > 2
UNION
SELECT m.firstname, m.lastname, COUNT(j.member_no) AS children
FROM adult AS a
         INNER JOIN member AS m
                    ON m.member_no = a.member_no
         INNER JOIN juvenile AS j
                    ON m.member_no = j.adult_member_no
WHERE a.state = 'CA'
GROUP BY m.member_no, m.firstname, m.lastname
HAVING COUNT(j.member_no) > 3

SELECT m.firstname, m.lastname, COUNT(j.member_no) AS children
FROM adult AS a
         INNER JOIN member AS m
                    ON m.member_no = a.member_no
         INNER JOIN juvenile AS j
                    ON m.member_no = j.adult_member_no
GROUP BY m.member_no, m.firstname, m.lastname, a.state
HAVING (COUNT(j.member_no) > 2 AND a.state = 'AZ')
    OR (COUNT(j.member_no) > 3 AND a.state = 'CA')