--1
SELECT EmployeeID, YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, COUNT(OrderID) AS Count
FROM Orders
GROUP BY EmployeeID, YEAR(OrderDate), MONTH(OrderDate)

--2
SELECT CategoryID, MAX(UnitPrice) AS Max, MIN(UnitPrice) AS Min
FROM Products
GROUP BY CategoryID