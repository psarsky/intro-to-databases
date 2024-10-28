--1
SELECT COUNT(*) AS COUNT
FROM Products
WHERE UnitPrice NOT BETWEEN 10 AND 20

--2
SELECT MAX(UnitPrice) AS PRICE
FROM Products
WHERE UnitPrice < 20

--3
SELECT MAX(UnitPrice) AS MAX, AVG(UnitPrice) AS AVG, MIN(UnitPrice) AS MIN
FROM Products
WHERE QuantityPerUnit LIKE '%bottle%'

--4
SELECT *
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice)
                   FROM Products)

--5
SELECT ROUND(SUM(Quantity * UnitPrice * (1 - Discount)), 2) AS OrderVal
FROM [Order Details]
WHERE OrderID = 10250