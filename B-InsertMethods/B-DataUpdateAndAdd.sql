-- Sample Customer Insert

INSERT INTO Customer (CustomerName, CustomerSurname, Mail, City, RegistrationDate) 
VALUES ('Fatma', 'Göven', 'fatmagoven777@example.com', 'Aydın',null),
('Ümit','Göven','umitgoven7@example.com','Eskişehir','2025-08-01'),
('Meryem','Caran','meryemcaran00@example.com','İstanbul','2022-10-30');

-- Sample Product Insert
INSERT INTO Product (ProductName, ProductPrice, Stock, CategoryID, SellerID) 
VALUES ('RUSTIC WOODEN PICTURE FRAME81-', 87.39, 254, 1450, 1298),
('PASTA PRIMAVERA874-', 78.99, 674, 1438, 1047);

--Sample Order Insert
INSERT INTO Orders (OrderDate, TotalPrice, PaymentType, CustomerID) 
VALUES ('2025-09-27', 8764.95, 'Credit Card', 2001),
('2025-09-27', 64.97, 'Cash', 2002),
('2025-09-27', 1024.65, 'With IBAN', 2003);

--Update Customer 2001 PaymentType in Orders

UPDATE Orders
SET PaymentType = 'Credit Options'
WHERE CustomerID = 2001

SELECT CustomerID, PaymentType FROM Orders
WHERE CustomerID = 2001

--Delete Customer in Customer

DELETE FROM Orders
WHERE CustomerID = 2002;

DELETE FROM Customer
WHERE CustomerName = 'Ümit';

SELECT CustomerName FROM Customer

-- TRUNCATE TABLE

CREATE TABLE test(
	testID SERIAL PRIMARY KEY,
	testName VARCHAR(8)
)

INSERT INTO test (testName) 
VALUES ('test5463'),
('test8754')

SELECT * FROM test

TRUNCATE TABLE test



