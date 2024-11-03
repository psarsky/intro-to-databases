--1
SELECT m.firstname + ' ' + m.lastname as name, a.street + ', ' + a.zip + ' ' + a.city + ' ' + a.state as address
FROM adult AS a
         INNER JOIN member AS m
                    ON a.member_no = m.member_no
