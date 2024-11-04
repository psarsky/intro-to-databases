--1
SELECT m.firstname, m.lastname, j.birth_date, a.street + ', ' + a.zip + ' ' + a.city + ' ' + a.state AS Address
FROM juvenile AS j
         INNER JOIN member AS m
                    ON j.member_no = m.member_no
         INNER JOIN adult AS a
                    ON j.adult_member_no = a.member_no

--2
SELECT m1.firstname + ' ' + m1.lastname as child_name, j.birth_date, a.street + ', ' + a.zip + ' ' + a.city + ' ' + a.state AS Address, m2.firstname + ' ' + m2.lastname as adult_name
FROM juvenile AS j
         INNER JOIN member AS m1
                    ON j.member_no = m1.member_no
         INNER JOIN adult AS a
                    ON j.adult_member_no = a.member_no
         INNER JOIN member AS m2
                    ON a.member_no = m2.member_no
