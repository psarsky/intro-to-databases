--1
SELECT p.ProductName,
       (SELECT MAX(Quantity)
        FROM [Order Details] AS od
        WHERE od.ProductID = p.ProductID)
           AS MaxOrderedQuantity
FROM Products AS p

--2
SELECT ProductName
FROM Products
WHERE UnitPrice < (SELECT AVG(UnitPrice)
                   FROM Products)

--3
SELECT ProductName
FROM Products AS p1
WHERE UnitPrice < (SELECT AVG(UnitPrice)
                   FROM Products AS p2
                   WHERE p2.CategoryID = p1.CategoryID)

