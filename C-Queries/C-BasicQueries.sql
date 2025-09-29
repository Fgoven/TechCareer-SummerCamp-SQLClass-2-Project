--Most ordered 5 customer 
SELECT c.CustomerName,c.CustomerSurname, COUNT(o.OrderID) as TotalOrders
FROM Customer c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName,c.CustomerSurname,c.CustomerID
ORDER BY TotalOrders DESC
LIMIT 5;

--Most selling products
SELECT p.ProductID, p.ProductName, SUM(od.ProductNumber) as TotalQuantitySold
FROM Product p
JOIN OrderDetail od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantitySold DESC

--Highest Income sellers
SELECT s.SellerID, s.SellerName, SUM(od.TotalPrice) as TotalIncomeForSeller
FROM Seller s
JOIN Product p ON s.SellerID = p.SellerID
JOIN OrderDetail od ON p.ProductID = od.ProductID
GROUP BY s.SellerID, s.SellerName
ORDER BY TotalIncomeForSeller DESC


