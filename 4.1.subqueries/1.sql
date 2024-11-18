--1
--w domu

--2
SELECT DISTINCT CompanyName, Phone
FROM Customers
WHERE CustomerID IN
      (SELECT CustomerID
       FROM Orders AS o
                JOIN [Order Details] AS od
                     ON o.OrderID = od.OrderID
                JOIN Products AS p
                     ON od.ProductID = p.ProductID
                JOIN Categories AS c
                     ON p.CategoryID = C.CategoryID
                         AND c.CategoryName = 'Confections')

--3
SELECT DISTINCT CompanyName, Phone
FROM Customers
WHERE CustomerID NOT IN
      (SELECT CustomerID
       FROM Orders AS o
                JOIN [Order Details] AS od
                     ON o.OrderID = od.OrderID
                JOIN Products AS p
                     ON od.ProductID = p.ProductID
                JOIN Categories AS c
                     ON p.CategoryID = C.CategoryID
                         AND c.CategoryName = 'Confections')