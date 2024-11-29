--1
SELECT TOP 1 p.productName
FROM Products AS p
         INNER JOIN [Order Details] AS od
                    ON p.ProductID = od.ProductID
         INNER JOIN Orders AS o
                    ON od.OrderID = o.OrderID
                        AND YEAR(o.OrderDate) = 1996
GROUP BY p.ProductID, p.ProductName
ORDER BY SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))

--2
USE library;
WITH T1 AS
         (SELECT title, member_no
          FROM loan
                   INNER JOIN title ON loan.title_no = title.title_no),
     T2 AS (SELECT member_no
            FROM T1
            WHERE member_no IN (SELECT adult_member_no FROM juvenile))

SELECT lastname, firstname, title
FROM T1
         INNER JOIN T2 ON T1.member_no = T2.member_no
         INNER JOIN member ON member.member_no = T1.member_no
GROUP BY lastname, firstname, title
HAVING COUNT(T1.member_no) > 1
ORDER BY title

--3
USE Northwind
SELECT o1.OrderID
FROM Orders AS o1
WHERE o1.Freight > (SELECT AVG(o2.Freight)
                    FROM Orders AS o2
                    Where YEAR(o1.OrderDate) = YEAR(o2.OrderDate))