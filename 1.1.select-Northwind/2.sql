--1
SELECT CompanyName, Address
FROM Customers
WHERE City = 'London'

--2
SELECT CompanyName, Address
FROM Customers
WHERE Country = 'France'
   OR Country = 'Spain'

--3
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice >= 20
  AND UnitPrice <= 30

--4.1
SELECT *
FROM Categories
--4.2
SELECT ProductName, UnitPrice
FROM Products
WHERE CategoryID = 6

--5.1
SELECT SupplierID
FROM Suppliers
WHERE CompanyName = 'Tokyo Traders'
--5.2
SELECT ProductName, UnitsInStock
FROM Products
WHERE SupplierID = 4

--6
SELECT ProductName
FROM Products
WHERE UnitsInStock = 0