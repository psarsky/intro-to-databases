--1
SELECT c.CategoryName, SUM(od.Quantity) AS Sum
FROM Categories AS c
         INNER JOIN Products AS p
                    ON p.CategoryID = c.CategoryID
         INNER JOIN [Order Details] AS od
                    ON od.ProductID = p.ProductID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY Sum DESC

--2
SELECT c.CategoryName, ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS Value
FROM Categories AS c
         INNER JOIN Products AS p
                    ON p.CategoryID = c.CategoryID
         INNER JOIN [Order Details] AS od
                    ON od.ProductID = p.ProductID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY Value DESC

--3
SELECT c.CategoryName, ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS Value
FROM Categories AS c
         INNER JOIN Products AS p
                    ON p.CategoryID = c.CategoryID
         INNER JOIN [Order Details] AS od
                    ON od.ProductID = p.ProductID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY Value DESC

SELECT c.CategoryName, ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS Value
FROM Categories AS c
         INNER JOIN Products AS p
                    ON p.CategoryID = c.CategoryID
         INNER JOIN [Order Details] AS od
                    ON od.ProductID = p.ProductID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY SUM(od.Quantity)

--4
SELECT od.OrderID, ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) + o.Freight, 2) AS Value
FROM [Order Details] AS od
         INNER JOIN Orders AS o
                    ON o.OrderID = od.OrderID
GROUP BY od.OrderID, o.Freight
ORDER BY Value DESC