SELECT e.FirstName + ' ' + e.LastName                                AS EmployeeName,
       ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS Sum
FROM Employees as e
         INNER JOIN Employees as sub
             ON sub.ReportsTo = e.EmployeeID
         INNER JOIN Orders as o
             ON o.EmployeeID = e.EmployeeID
         INNER JOIN [Order Details] as od
             ON od.OrderID = o.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName

SELECT e.FirstName + ' ' + e.LastName                                AS EmployeeName,
       ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS Sum
FROM Employees as e
         LEFT JOIN Employees as sub
                   ON sub.ReportsTo = e.EmployeeID
         INNER JOIN Orders as o
                    ON o.EmployeeID = e.EmployeeID
         INNER JOIN [Order Details] as od
                    ON od.OrderID = o.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(sub.EmployeeID) = 0