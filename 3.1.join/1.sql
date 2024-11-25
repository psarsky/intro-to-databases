--1
SELECT od.OrderID, c.CompanyName, SUM(od.Quantity) AS Sum
FROM [Order Details] AS od
         INNER JOIN Orders AS o
                    ON o.OrderID = od.OrderID
         INNER JOIN Customers AS c
                    ON c.CustomerID = o.CustomerID
GROUP BY od.OrderID, c.CompanyName
ORDER BY od.OrderID

--2
SELECT od.OrderID, c.CompanyName, SUM(od.Quantity) AS Sum
FROM [Order Details] od
         INNER JOIN Orders o
                    ON o.OrderID = od.OrderID
         INNER JOIN Customers c
                    ON c.CustomerID = o.CustomerID
GROUP BY od.OrderID, c.CompanyName
HAVING SUM(od.Quantity) > 250
ORDER BY od.OrderID

--3
SELECT od.OrderID, c.CompanyName, ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS Value
FROM [Order Details] AS od
         INNER JOIN Orders AS o
                    ON o.OrderID = od.OrderID
         INNER JOIN Customers AS c
                    ON c.CustomerID = o.CustomerID
GROUP BY od.OrderID, c.CompanyName
ORDER BY od.OrderID

--4
SELECT od.OrderID, c.CompanyName, ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS Value
FROM [Order Details] od
         INNER JOIN Orders o ON o.OrderID = od.OrderID
         INNER JOIN Customers c ON c.CustomerID = o.CustomerID
GROUP BY od.OrderID, c.CompanyName
HAVING SUM(od.Quantity) > 250
ORDER BY od.OrderID

--5
SELECT od.OrderID,
       c.CompanyName,
       ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS Value,
       e.FirstName + ' ' + e.LastName                       AS EmployeeName
FROM [Order Details] AS od
         INNER JOIN Orders AS o
                    ON o.OrderID = od.OrderID
         INNER JOIN Customers AS c
                    ON c.CustomerID = o.CustomerID
         INNER JOIN Employees AS e
                    ON e.EmployeeID = o.EmployeeID
GROUP BY od.OrderID, c.CompanyName, e.FirstName, e.LastName
HAVING SUM(od.Quantity) > 250
ORDER BY od.OrderID