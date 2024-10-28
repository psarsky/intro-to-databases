--1
SELECT p.ProductName, p.UnitPrice, s.Address, s.PostalCode, s.City, s.Country
FROM Products AS p
         INNER JOIN dbo.Suppliers AS s
                    ON p.SupplierID = s.SupplierID
WHERE UnitPrice BETWEEN 20 AND 30

--2
SELECT p.ProductName, p.UnitsInStock
FROM Products AS p
         INNER JOIN Suppliers AS s
                    ON p.SupplierID = s.SupplierID
WHERE s.CompanyName = 'Tokyo Traders'

--3
SELECT c.Address, c.PostalCode, c.City, c.Country
FROM Customers AS c
         LEFT JOIN Orders AS o
                   ON o.CustomerID = c.CustomerID AND YEAR(OrderDate) = 1997
WHERE o.OrderID IS NULL

--4
SELECT s.CompanyName, s.Phone
FROM Products AS p
         INNER JOIN Suppliers AS s
                    ON p.SupplierID = s.SupplierID
WHERE UnitsInStock = 0