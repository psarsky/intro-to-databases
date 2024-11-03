--3
SELECT DISTINCT a.member_no, a.street + ', ' + a.zip + ' ' + a.city + ' ' + a.state as Address
FROM adult AS a
         INNER JOIN juvenile AS j
                    ON a.member_no = j.adult_member_no
WHERE YEAR(j.birth_date) < 1996

--4
SELECT DISTINCT a.member_no, a.street + ', ' + a.zip + ' ' + a.city + ' ' + a.state as Address
FROM adult AS a
         INNER JOIN juvenile AS j
                    ON a.member_no = j.adult_member_no
         LEFT JOIN loan AS l
                   ON a.member_no = l.member_no
WHERE YEAR(j.birth_date) < 1996
  AND l.isbn IS NULL