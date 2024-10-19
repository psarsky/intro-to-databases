--1
SELECT ProductID, Quantity * UnitPrice AS Total
FROM [Order Details]
WHERE OrderID = 10250

--1 (2)
SELECT ISNULL(Phone, '') + ', ' + ISNULL(Fax, '') AS phone_fax
FROM Suppliers