--1
SELECT o.OrderID,
       ROUND((SELECT SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))
              FROM [Order Details] AS od
              WHERE od.OrderID = 10250) + o.Freight, 2) AS OrderVal
FROM Orders AS o
WHERE o.OrderID = 10250

--2
SELECT od.OrderID,
       ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) +
             (SELECT Freight
              FROM Orders AS o
              WHERE od.OrderID = o.OrderID), 2) AS OrderVal
FROM [Order Details] AS od
GROUP BY od.OrderID

--3
SELECT c.CustomerID, c.Address + ', ' + c.PostalCode + ' ' + c.City + ', ' + c.Country AS Address
FROM Customers AS c
WHERE CustomerID NOT IN (SELECT o.CustomerID
                         FROM Orders AS o
                         WHERE YEAR(OrderDate) = 1997)

--4
SELECT p.ProductName,
       (SELECT COUNT(DISTINCT o.CustomerID)
        FROM Orders AS o
        WHERE o.OrderID IN (SELECT od.OrderID
                            FROM [Order Details] od
                            WHERE od.ProductID = p.ProductID)) AS BuyersAmount
FROM Products AS p
WHERE (SELECT COUNT(DISTINCT o.CustomerID)
       FROM Orders AS o
       WHERE o.OrderID IN (SELECT od.OrderID
                           FROM [Order Details] od
                           WHERE od.ProductID = p.ProductID)) > 1
ORDER BY BuyersAmount DESC

SELECT p.ProductName, COUNT(DISTINCT o.CustomerID) AS BuyersAmount
FROM Products AS p
         INNER JOIN [Order Details] AS od
                    ON p.ProductID = od.ProductID
         INNER JOIN Orders AS o
                    ON od.OrderID = o.OrderID
GROUP BY p.ProductName
HAVING COUNT(DISTINCT o.CustomerID) > 1
ORDER BY BuyersAmount DESC