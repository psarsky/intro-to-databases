--1
SELECT e.FirstName + ' ' + e.LastName AS employee_name, sub.FirstName + ' ' + sub.LastName AS subordinate_name
FROM Employees AS e
         JOIN Employees AS sub
              ON sub.ReportsTo = e.EmployeeID

--2
SELECT e.FirstName + ' ' + e.LastName AS employee_name
FROM Employees AS e
         LEFT JOIN Employees AS sub
                   ON sub.ReportsTo = e.EmployeeID
WHERE sub.EmployeeID IS NULL

--3
SELECT DISTINCT e.FirstName + ' ' + e.LastName AS employee_name
FROM Employees AS e
         JOIN Employees AS sub
              ON sub.ReportsTo = e.EmployeeID