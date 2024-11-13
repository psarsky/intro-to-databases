--1
SELECT m.firstname + ' ' + m.lastname AS name, a.street + ', ' + a.zip + ' ' + a.city + ' ' + a.state AS address
FROM adult AS a
         INNER JOIN member AS m
                    ON a.member_no = m.member_no

--2
--zrob

--3
--zrob

--4
SELECT m.firstname, m.lastname, COUNT(j.member_no) AS children
FROM adult AS a
         INNER JOIN member AS m
                    ON m.member_no = a.member_no
         INNER JOIN juvenile AS j
                    ON m.member_no = j.adult_member_no
WHERE a.state = 'AZ'
GROUP BY m.member_no, m.firstname, m.lastname
HAVING count(j.member_no) > 2

--5
--zrob ostatnie z union i bez
