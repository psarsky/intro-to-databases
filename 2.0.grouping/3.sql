--1
SELECT OrderID, COUNT(ProductID) AS NumberOfItems
FROM [Order Details]
GROUP BY OrderID
HAVING COUNT(ProductID) >= 5

--2
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Orders
WHERE YEAR(ShippedDate) = 1998
GROUP BY CustomerID
HAVING COUNT(*) > 8
ORDER BY SUM(Freight) DESC