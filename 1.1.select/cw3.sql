--1
SELECT *
FROM Products
WHERE QuantityPerUnit LIKE '%bottle%'

--2
SELECT Title
FROM Employees
WHERE LastName LIKE '[B-L]%'

--3
SELECT Title
FROM Employees
WHERE LastName LIKE '[BL]%'

--4
SELECT CategoryName
FROM Categories
WHERE Description LIKE '%,%'

--5
SELECT *
FROM Customers
WHERE CompanyName LIKE '%Store%'