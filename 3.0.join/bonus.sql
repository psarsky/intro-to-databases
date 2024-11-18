--1
SELECT c.CompanyName, COUNT(o.OrderID) AS OrderCount
FROM Customers AS c
         LEFT JOIN Orders AS o
                   ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName, c.CustomerID
ORDER BY OrderCount

--2
SELECT c.CompanyName, COUNT(o.OrderID) AS OrderCount
FROM Customers AS c
         LEFT JOIN Orders AS o
                   ON c.CustomerID = o.CustomerID
                       AND YEAR(o.OrderDate) = 1997
                       AND MONTH(o.OrderDate) = 3
GROUP BY c.CompanyName, c.CustomerID
ORDER BY OrderCount DESC

--3
SELECT TOP 1 s.CompanyName, COUNT(*) AS OrderCount
FROM Shippers AS s
         INNER JOIN Orders AS o
                    ON s.ShipperID = o.ShipVia
WHERE YEAR(o.ShippedDate) = 1997
GROUP BY s.CompanyName
ORDER BY OrderCount DESC

--4
SELECT o.OrderID,
       o.OrderDate,
       c.CompanyName                                        AS CustomerName,
       ROUND(SUM(Quantity * UnitPrice * (1 - Discount)), 2) AS OrderValue
FROM orders AS o
         INNER JOIN [Order Details] AS od
                    ON o.OrderID = od.OrderID
         INNER JOIN Customers AS c
                    ON o.CustomerID = c.CustomerID
GROUP BY o.OrderID, o.OrderDate, c.CompanyName
ORDER BY 4 DESC

--5
SELECT o.OrderID,
       o.OrderDate,
       c.CompanyName                                                             AS CustomerName,
       ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) + o.Freight, 2) AS OrderValue
FROM orders AS o
         INNER JOIN [Order Details] AS od
                    ON o.OrderID = od.OrderID
         INNER JOIN Customers AS c
                    ON o.CustomerID = c.CustomerID
GROUP BY o.OrderID, o.OrderDate, c.CompanyName, o.Freight
ORDER BY 4 DESC

SELECT Freight
FROM Orders
WHERE OrderID = 10865

--6
SELECT DISTINCT cu.CompanyName, cu.Phone
FROM Customers AS cu
         INNER JOIN Orders AS o
                    ON cu.CustomerID = o.CustomerID
         INNER JOIN [Order Details] AS od
                    ON o.OrderID = od.OrderID
         INNER JOIN Products AS p
                    ON od.ProductID = p.ProductID
         INNER JOIN Categories AS ca
                    ON p.CategoryID = ca.CategoryID
WHERE ca.CategoryName = 'Confections'

--7
SELECT cu.CompanyName, cu.Phone
FROM Customers AS cu
         LEFT JOIN Orders AS o
                   ON o.CustomerID = cu.CustomerID
         LEFT JOIN [Order Details] AS od
                   ON o.OrderID = od.OrderID
         LEFT JOIN Products AS p
                   ON od.ProductID = p.ProductID
         LEFT JOIN Categories AS ca
                   ON p.CategoryID = ca.CategoryID AND ca.CategoryName = 'Confections'
GROUP BY cu.CompanyName, cu.Phone, cu.CustomerID
HAVING COUNT(ca.CategoryID) = 0


--8
SELECT cu.CompanyName, cu.Phone
FROM Customers AS cu
         LEFT JOIN Orders AS o
                   ON o.CustomerID = cu.CustomerID AND YEAR(o.OrderDate) = 1997
         LEFT JOIN [Order Details] AS od
                   ON o.OrderID = od.OrderID
         LEFT JOIN Products AS p
                   ON od.ProductID = p.ProductID
         LEFT JOIN Categories AS ca
                   ON p.CategoryID = ca.CategoryID AND ca.CategoryName = 'Confections'
GROUP BY cu.CompanyName, cu.Phone, cu.CustomerID
HAVING COUNT(ca.CategoryID) = 0