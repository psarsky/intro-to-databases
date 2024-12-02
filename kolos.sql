-- ZADANIE 1
USE library
SELECT t.title
FROM loan AS l
         INNER JOIN title AS t
                    ON l.title_no = t.title_no
WHERE l.member_no IN (SELECT DISTINCT j.adult_member_no
                      FROM juvenile AS j)
GROUP BY l.title_no, t.title
HAVING COUNT(*) > 1

-- ZADANIE 2
USE Northwind
SELECT o1.OrderID
FROM Orders AS o1
WHERE o1.Freight > (SELECT AVG(o2.Freight)
                    FROM Orders AS o2
                    WHERE YEAR(o1.OrderDate) = YEAR(o2.OrderDate))

-- ZADANIE 3
USE Northwind
SELECT cu.CompanyName,
       (SELECT TOP 1 cat.CategoryName
        FROM Orders AS o1
                 INNER JOIN [Order Details] AS od
                            ON o1.OrderID = od.OrderID
                 INNER JOIN Products AS p
                            ON od.ProductID = p.ProductID
                 INNER JOIN Categories AS cat
                            ON p.CategoryID = cat.CategoryID
        WHERE o1.CustomerID = cu.CustomerID
          AND YEAR(o1.OrderDate) = 1997
        GROUP BY cat.CategoryName
        ORDER BY COUNT(*) DESC) AS CategoryName,
       (SELECT TOP 1 COUNT(*)
        FROM Orders AS o1
                 INNER JOIN [Order Details] AS od
                            ON o1.OrderID = od.OrderID
                 INNER JOIN Products AS p
                            ON od.ProductID = p.ProductID
                 INNER JOIN Categories AS cat
                            ON p.CategoryID = cat.CategoryID
        WHERE o1.CustomerID = cu.CustomerID
          AND YEAR(o1.OrderDate) = 1997
        GROUP BY cat.CategoryName
        ORDER BY 1 DESC)        AS Count
FROM Customers AS cu
WHERE cu.CustomerID IN (SELECT DISTINCT o2.CustomerID
                        FROM Orders AS o2
                        WHERE YEAR(o2.OrderDate) = 1997)
