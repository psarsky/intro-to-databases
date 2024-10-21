SELECT 'The title is: ' + title + ', title number ' + CONVERT(varchar(10), title_no) AS title_and_number
FROM title

SELECT 'The title is: ' + title + ', title number ' + CAST(title_no AS varchar) AS title_and_number
FROM title

SELECT 'The title is: ' + title + ', title number ' + STR(title_no) AS title_and_number
FROM title

SELECT CONCAT('The title is: ', title, ', title number ', title_no) AS title_and_number
FROM title