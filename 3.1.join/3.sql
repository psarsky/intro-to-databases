--1
SELECT s.CompanyName, COUNT(o.OrderID) AS OrderAmount
FROM Shippers AS s
         INNER JOIN Orders AS o
                    ON o.ShipVia = s.ShipperID AND YEAR(o.ShippedDate) = 1997
GROUP BY s.ShipperID, s.CompanyName

--2
SELECT TOP 1 s.CompanyName, COUNT(o.OrderID) AS OrderAmount
FROM Shippers AS s
         INNER JOIN Orders AS o
                    ON o.ShipVia = s.ShipperID AND YEAR(o.ShippedDate) = 1997
GROUP BY s.ShipperID, s.CompanyName
ORDER BY 2 DESC

--3
SELECT e.FirstName + ' ' + e.LastName                                AS EmployeeName,
       ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS Sum
FROM Employees AS e
         INNER JOIN Orders AS o
                    ON o.EmployeeID = e.EmployeeID
         INNER JOIN [Order Details] AS od
                    ON od.OrderID = o.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName

--4
SELECT TOP 1 e.FirstName + ' ' + e.LastName AS EmployeeName
FROM Employees AS e
         INNER JOIN Orders AS o
                    ON o.EmployeeID = e.EmployeeID AND YEAR(o.ShippedDate) = 1997
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY COUNT(o.OrderID) DESC

--5
SELECT TOP 1 e.FirstName + ' ' + e.LastName                                AS EmployeeName,
             ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS Sum
FROM Employees AS e
         INNER JOIN Orders AS o
                    ON o.EmployeeID = e.EmployeeID AND YEAR(o.ShippedDate) = 1997
         INNER JOIN [Order Details] AS od
                    ON od.OrderID = o.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY 2 DESC