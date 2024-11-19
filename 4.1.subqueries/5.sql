--1
SELECT FirstName + ' ' + LastName                    AS Name,
       ROUND((SELECT SUM(Quantity * UnitPrice * (1 - Discount))
              FROM [Order Details] AS od
              WHERE od.OrderID IN (SELECT o.OrderID
                                   FROM Orders AS o
                                   WHERE o.EmployeeID = e.EmployeeID)) +
             (SELECT SUM(o.Freight)
              FROM Orders AS o
              WHERE o.EmployeeID = e.EmployeeID), 2) AS TotalValue
FROM Employees AS e

--2
SELECT TOP 1 e.FirstName + ' ' + e.LastName                AS Name,
             ROUND((SELECT SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))
                    FROM [Order Details] AS od
                    WHERE od.OrderID IN (SELECT o.OrderID
                                         FROM Orders AS o
                                         WHERE o.EmployeeID = e.EmployeeID
                                           AND YEAR(o.ShippedDate) = 1997)) +
                   (SELECT SUM(o.Freight)
                    FROM Orders AS o
                    WHERE o.EmployeeID = e.EmployeeID), 2) AS TotalValue
FROM Employees AS e
ORDER BY 2 DESC

--3
SELECT FirstName + ' ' + LastName                    AS Name,
       ROUND((SELECT SUM(Quantity * UnitPrice * (1 - Discount))
              FROM [Order Details] AS od
              WHERE od.OrderID IN (SELECT o.OrderID
                                   FROM Orders AS o
                                   WHERE o.EmployeeID = e.EmployeeID)) +
             (SELECT SUM(o.Freight)
              FROM Orders AS o
              WHERE o.EmployeeID = e.EmployeeID), 2) AS TotalValue
FROM Employees AS e
WHERE e.EmployeeID IN (SELECT e.EmployeeID
                       FROM Employees AS sub
                       WHERE sub.ReportsTo = e.EmployeeID)

SELECT FirstName + ' ' + LastName                    AS Name,
       ROUND((SELECT SUM(Quantity * UnitPrice * (1 - Discount))
              FROM [Order Details] AS od
              WHERE od.OrderID IN (SELECT o.OrderID
                                   FROM Orders AS o
                                   WHERE o.EmployeeID = e.EmployeeID)) +
             (SELECT SUM(o.Freight)
              FROM Orders AS o
              WHERE o.EmployeeID = e.EmployeeID), 2) AS TotalValue
FROM Employees AS e
WHERE e.EmployeeID NOT IN (SELECT e.EmployeeID
                           FROM Employees AS sub
                           WHERE sub.ReportsTo = e.EmployeeID)

--4
SELECT FirstName + ' ' + LastName                    AS Name,
       ROUND((SELECT SUM(Quantity * UnitPrice * (1 - Discount))
              FROM [Order Details] AS od
              WHERE od.OrderID IN (SELECT o.OrderID
                                   FROM Orders AS o
                                   WHERE o.EmployeeID = e.EmployeeID)) +
             (SELECT SUM(o.Freight)
              FROM Orders AS o
              WHERE o.EmployeeID = e.EmployeeID), 2) AS TotalValue,
       (SELECT TOP 1 o1.ShippedDate
        FROM Orders AS o1
        WHERE o1.EmployeeID = e.EmployeeID
        ORDER BY o1.ShippedDate DESC)                AS LastOrder
FROM Employees AS e
WHERE e.EmployeeID IN (SELECT e.EmployeeID
                       FROM Employees AS sub
                       WHERE sub.ReportsTo = e.EmployeeID)

SELECT FirstName + ' ' + LastName                    AS Name,
       ROUND((SELECT SUM(Quantity * UnitPrice * (1 - Discount))
              FROM [Order Details] AS od
              WHERE od.OrderID IN (SELECT o.OrderID
                                   FROM Orders AS o
                                   WHERE o.EmployeeID = e.EmployeeID)) +
             (SELECT SUM(o.Freight)
              FROM Orders AS o
              WHERE o.EmployeeID = e.EmployeeID), 2) AS TotalValue,
       (SELECT TOP 1 o1.ShippedDate
        FROM Orders AS o1
        WHERE o1.EmployeeID = e.EmployeeID
        ORDER BY o1.ShippedDate DESC)                AS LastOrder
FROM Employees AS e
WHERE e.EmployeeID NOT IN (SELECT e.EmployeeID
                           FROM Employees AS sub
                           WHERE sub.ReportsTo = e.EmployeeID)
