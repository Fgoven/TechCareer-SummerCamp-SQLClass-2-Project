--Customer,Product and Seller Informations on Order
SELECT c.CustomerID,c.CustomerName,c.CustomerSurname,p.ProductID,p.ProductName,p.ProductPrice,s.SellerID,s.SellerName
FROM Orders o
LEFT JOIN Customer c ON o.CustomerID = c.CustomerID
LEFT JOIN OrderDetail od ON o.OrderID = od.OrderID
LEFT JOIN Product p ON od.ProductID = p.ProductID
LEFT JOIN Seller s ON p.sellerID = s.SellerID
ORDER BY CustomerID 

--Products do not sell 

SELECT p.ProductID,p.ProductName
FROM Product p
LEFT JOIN OrderDetail od ON p.ProductID = od.ProductID
WHERE od.ProductID IS NULL
ORDER BY ProductID 

--Customers do not have any order

SELECT c.CustomerID,c.CustomerName,c.CustomerSurname
FROM Customer c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL
ORDER BY CustomerID 