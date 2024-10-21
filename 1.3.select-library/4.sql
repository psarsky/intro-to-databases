--1
SELECT firstname + ' ' + middleinitial + ' ' + lastname
FROM member
WHERE lastname = 'Anderson'

--2
SELECT firstname + ' ' + middleinitial + ' ' + lastname AS email_name
FROM member
WHERE lastname = 'Anderson'

--3
SELECT LOWER(firstname + middleinitial + SUBSTRING(lastname, 0, 3)) AS email_name
FROM member
WHERE lastname = 'Anderson'