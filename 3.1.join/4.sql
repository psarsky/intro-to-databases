SELECT DISTINCT e.FirstName + ' ' + e.LastName                                AS EmployeeName,
                ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS Sum
FROM Employees AS e
         INNER JOIN Employees AS sub
                    ON sub.ReportsTo = e.EmployeeID
         INNER JOIN Orders AS o
                    ON o.EmployeeID = e.EmployeeID
         INNER JOIN [Order Details] AS od
                    ON od.OrderID = o.OrderID
GROUP BY e.EmployeeID, sub.EmployeeID, e.FirstName, e.LastName

SELECT e.FirstName + ' ' + e.LastName                                AS EmployeeName,
       ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS Sum
FROM Employees AS e
         LEFT JOIN Employees AS sub
                   ON sub.ReportsTo = e.EmployeeID
         INNER JOIN Orders AS o
                    ON o.EmployeeID = e.EmployeeID
         INNER JOIN [Order Details] AS od
                    ON od.OrderID = o.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(sub.EmployeeID) = 0