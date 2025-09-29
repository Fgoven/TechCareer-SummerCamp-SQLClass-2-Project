--Customer Number according to City
SELECT c.City, COUNT(c.CustomerID) AS TotalNumberCityCustomer FROM Customer c
GROUP BY c.City
HAVING City IS NOT NULL
ORDER BY TotalNumberCityCustomer DESC

--Total Selling Product Number according to Category

SELECT cg.CategoryID, cg.CategoryName, SUM(od.ProductNumber) as TotalSellingProductForCatg
FROM Category cg
JOIN Product p ON cg.CategoryID = p.CategoryID
JOIN OrderDetail od ON p.ProductID = od.ProductID
GROUP BY cg.CategoryID, cg.CategoryName
ORDER BY TotalSellingProductForCatg DESC

--Order Number according to Months
SELECT EXTRACT(MONTH FROM o.OrderDate) AS Months, COUNT(o.OrderID) AS OrderNumberForMonths
FROM Orders o
GROUP BY Months
ORDER BY Months 
