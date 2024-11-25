--1
SELECT ProductName,
       UnitPrice,
       (SELECT ROUND(AVG(UnitPrice), 2)
        FROM Products)                  AS AvgPrice,
       ABS(UnitPrice - (SELECT ROUND(AVG(UnitPrice), 2)
                        FROM Products)) AS Difference
FROM Products

--2
SELECT (SELECT CategoryName
        FROM Categories AS c
        WHERE p1.CategoryID = c.CategoryID)                   AS CategoryName,
       ProductName,
       UnitPrice,
       (SELECT ROUND(AVG(UnitPrice), 2)
        FROM Products AS p2
        WHERE p2.CategoryID = p1.CategoryID)                  AS AvgCategoryPrice,
       ABS(UnitPrice - (SELECT ROUND(AVG(UnitPrice), 2)
                        FROM Products AS p2
                        WHERE p2.CategoryID = p1.CategoryID)) AS Difference
FROM Products AS p1