--1
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM [Order Details]
WHERE ProductID < 3
GROUP BY ProductID

--2
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM [Order Details]
GROUP BY ProductID

--3
SELECT OrderID, ROUND(SUM(quantity * UnitPrice * (1 - Discount)), 2) AS OrderValue
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Quantity) > 250