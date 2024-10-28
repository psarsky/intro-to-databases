--1
SELECT OrderID, ROUND(SUM(Quantity * UnitPrice * (1 - Discount)), 2) AS OrderValue
FROM [Order Details]
GROUP BY OrderID
ORDER BY OrderValue DESC

--2
SELECT TOP 10 OrderID, ROUND(SUM(Quantity * UnitPrice * (1 - Discount)), 2) AS OrderValue
FROM [Order Details]
GROUP BY OrderID
ORDER BY OrderValue DESC