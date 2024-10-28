--1
SELECT EmployeeID, COUNT(*) AS Orders
FROM Orders
GROUP BY EmployeeID
ORDER BY Orders DESC

--2
SELECT ShipVia, SUM(Freight) AS TotalFreight
FROM Orders
GROUP BY ShipVia

--3
SELECT ShipVia, SUM(Freight) AS TotalFreight
FROM Orders
WHERE YEAR(ShippedDate) BETWEEN 1996 AND 1997
GROUP BY ShipVia