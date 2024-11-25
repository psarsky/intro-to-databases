--1
SELECT DISTINCT s.CompanyName
FROM Shippers AS s
         INNER JOIN Orders AS o
                    ON s.ShipperID = o.ShipVia
                        AND YEAR(o.ShippedDate) = 1998
                        AND MONTH(o.ShippedDate) = 3
         INNER JOIN [Order Details] AS od
                    ON o.OrderID = od.OrderID
         INNER JOIN Products AS p
                    ON od.ProductID = p.ProductID
         INNER JOIN Categories AS c
                    ON p.CategoryID = c.CategoryID AND CategoryName = 'Meat/Poultry'

SELECT s.CompanyName
FROM Shippers AS s
WHERE s.ShipperID IN (SELECT DISTINCT o.ShipVia
                      FROM Orders AS o
                      WHERE o.OrderID IN (SELECT DISTINCT od.OrderID
                                          FROM [Order Details] AS od
                                          WHERE od.ProductID IN (SELECT p.ProductID
                                                                 FROM Products AS p
                                                                 WHERE p.CategoryID = (SELECT c.CategoryID
                                                                                       FROM Categories AS c
                                                                                       WHERE c.CategoryName = 'Meat/Poultry')))
                        AND YEAR(o.ShippedDate) = 1998
                        AND MONTH(o.ShippedDate) = 3)

--2
SELECT DISTINCT s.CompanyName
FROM Shippers AS s
EXCEPT
SELECT DISTINCT s.CompanyName
FROM Shippers AS s
         INNER JOIN Orders AS o
                    ON s.ShipperID = o.ShipVia
                        AND YEAR(o.ShippedDate) = 1997
                        AND MONTH(o.ShippedDate) = 3
         INNER JOIN [Order Details] AS od
                    ON o.OrderID = od.OrderID
         INNER JOIN Products AS p
                    ON od.ProductID = p.ProductID
         INNER JOIN Categories AS c
                    ON p.CategoryID = c.CategoryID AND CategoryName = 'Meat/Poultry'

SELECT s.CompanyName
FROM Shippers AS s
WHERE s.ShipperID NOT IN (SELECT DISTINCT o.ShipVia
                          FROM Orders AS o
                          WHERE o.OrderID IN (SELECT DISTINCT od.OrderID
                                              FROM [Order Details] AS od
                                              WHERE od.ProductID IN (SELECT p.ProductID
                                                                     FROM Products AS p
                                                                     WHERE p.CategoryID = (SELECT c.CategoryID
                                                                                           FROM Categories AS c
                                                                                           WHERE c.CategoryName = 'Meat/Poultry')))
                            AND YEAR(o.ShippedDate) = 1997
                            AND MONTH(o.ShippedDate) = 3)

--3
SELECT s.CompanyName, ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS Value
FROM Shippers AS s
         INNER JOIN Orders AS o
                    ON s.ShipperID = o.ShipVia
                        AND YEAR(o.ShippedDate) = 1997
                        AND MONTH(o.ShippedDate) = 3
         INNER JOIN [Order Details] AS od
                    ON o.OrderID = od.OrderID
         INNER JOIN Products AS p
                    ON od.ProductID = p.ProductID
         INNER JOIN Categories AS c
                    ON p.CategoryID = c.CategoryID AND CategoryName = 'Meat/Poultry'
GROUP BY s.CompanyName

SELECT s.CompanyName,
       (SELECT ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2)
        FROM [Order Details] AS od
        WHERE od.ProductID IN (SELECT p.ProductID
                               FROM Products AS p
                               WHERE p.CategoryID = (SELECT c.CategoryID
                                                     FROM Categories AS c
                                                     WHERE c.CategoryName = 'Meat/Poultry'))
          AND od.OrderID IN (SELECT o.orderID
                             FROM Orders AS o
                             WHERE o.ShipVia = s.ShipperID
                               AND YEAR(o.ShippedDate) = 1997
                               AND MONTH(o.ShippedDate) = 3))
FROM Shippers AS s
WHERE s.ShipperID IN (SELECT DISTINCT o.ShipVia
                      FROM Orders AS o
                      WHERE o.OrderID IN (SELECT DISTINCT od.OrderID
                                          FROM [Order Details] AS od
                                          WHERE od.ProductID IN (SELECT p.ProductID
                                                                 FROM Products AS p
                                                                 WHERE p.CategoryID = (SELECT c.CategoryID
                                                                                       FROM Categories AS c
                                                                                       WHERE c.CategoryName = 'Meat/Poultry')))
                        AND YEAR(o.ShippedDate) = 1997
                        AND MONTH(o.ShippedDate) = 3)