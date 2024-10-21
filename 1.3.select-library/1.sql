--1
SELECT title_no, title
FROM title

--2
SELECT title
FROM title
WHERE title_no = 10

--3
SELECT title_no, author
FROM title
WHERE author IN ('Charles Dickens', 'Jane Austen')
