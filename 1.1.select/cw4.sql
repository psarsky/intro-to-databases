--1
SELECT *
FROM Products
WHERE UnitPrice NOT BETWEEN 10 AND 20

--2
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 20 AND 30

--3
SELECT CompanyName, Country
FROM Customers
WHERE Country IN ('Japan', 'Italy')

--4
SELECT OrderID, OrderDate, CustomerID
FROM Orders
WHERE (ShippedDate IS NULL OR ShippedDate > GETDATE())
  AND ShipCountry = 'Argentina'