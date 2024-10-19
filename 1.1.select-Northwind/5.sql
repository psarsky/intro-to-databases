--1
SELECT CompanyName, Country
FROM Customers
ORDER BY Country, CompanyName

--2
SELECT CategoryID, ProductName, UnitPrice
FROM Products
ORDER BY CategoryID, UnitPrice DESC

--3
SELECT CompanyName, Country
FROM Customers
WHERE Country IN ('Japan', 'Italy')
ORDER BY Country, CompanyName