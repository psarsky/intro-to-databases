--1
SELECT p.ProductName, p.UnitPrice, s.Address + ', ' + s.PostalCode + ' ' + s.City + ', ' + s.Country as Address
FROM Products AS p
         INNER JOIN Suppliers AS s
                    ON p.SupplierID = s.SupplierID
         INNER JOIN Categories AS c
                    ON p.CategoryID = c.CategoryID
WHERE p.UnitPrice BETWEEN 20 AND 30
  AND c.CategoryName = 'Meat/Poultry'

--2
SELECT p.ProductName, p.UnitPrice, s.CompanyName as Supplier
FROM Products AS p
         INNER JOIN Suppliers AS s
                    ON p.SupplierID = s.SupplierID
         INNER JOIN Categories AS c
                    ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Confections'

--3
SELECT DISTINCT c.CompanyName, c.Phone
FROM Customers AS c
         INNER JOIN Orders AS o
                    ON c.CustomerID = o.CustomerID
         INNER JOIN Shippers AS s
                    ON o.ShipVia = s.ShipperID
WHERE YEAR(o.ShippedDate) = 1997
  AND s.CompanyName = 'United Package'