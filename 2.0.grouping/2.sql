--1
SELECT OrderID, MAX(UnitPrice) AS MaxPrice
FROM [Order Details]
GROUP BY OrderID
ORDER BY MaxPrice DESC

--2
SELECT OrderID, MAX(UnitPrice) AS MaxPrice, MIN(UnitPrice)
FROM [Order Details]
GROUP BY OrderID

--3
SELECT ShipVia, COUNT(*) AS Count
FROM Orders
GROUP BY ShipVia

--4
SELECT TOP 1 ShipVia, COUNT(*) AS c
FROM Orders
WHERE YEAR(ShippedDate) = 1997
GROUP BY ShipVia
ORDER BY c DESC