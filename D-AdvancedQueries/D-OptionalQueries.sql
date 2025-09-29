-- 3 Highest Income Categories
SELECT ct.CategoryID,ct.CategoryName, SUM(od.TotalPrice) AS TotalIncomeForCategory
FROM Category ct
JOIN Product p ON ct.CategoryID = p.CategoryID
JOIN OrderDetail od ON p.ProductID = od.ProductID
GROUP BY ct.CategoryID,ct.CategoryName
ORDER BY TotalIncomeForCategory DESC
LIMIT 3;

-- Orders are higher than average order price
WITH AverageTotalPrice AS
(
	SELECT CAST(ROUND(AVG(o.TotalPrice), 2) AS DECIMAL(10,2)) AS AveragePrice FROM Orders o
)

SELECT o.OrderID, o.TotalPrice, a.AveragePrice
FROM Orders o
CROSS JOIN AverageTotalPrice a
WHERE o.TotalPrice > a.AveragePrice
ORDER BY o.TotalPrice ASC;

-- Customers who have buy an electronic product at least once.
SELECT c.CustomerID,c.CustomerName,c.CustomerSurname, ctg.CategoryName, p.ProductName
FROM Customer c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetail od ON o.OrderID = od.OrderID
JOIN Product p ON od.ProductID = p.ProductID
JOIN Category ctg ON p.CategoryID = ctg.CategoryID
WHERE (CategoryName LIKE('%ELECT%')) AND (od.ProductNumber > 1)


