CREATE TABLE Customer(
		CustomerID SERIAL,
			CONSTRAINT PK_Customers PRIMARY KEY (CustomerID),
		CustomerName VARCHAR(50) NOT NULL,
		CustomerSurname VARCHAR(50) NOT NULL,
		Mail VARCHAR(70) UNIQUE NOT NULL,
		City VARCHAR(50),
		RegistrationDate DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Category(
		CategoryID SERIAL,
				CONSTRAINT PK_Categories PRIMARY KEY (CategoryID),
		CategoryName VARCHAR(75) UNIQUE NOT NULL
);

CREATE TABLE Seller(
		SellerID SERIAL,
				CONSTRAINT PK_Sellers PRIMARY KEY (SellerID),
		SellerName VARCHAR(100) UNIQUE NOT NULL,
		SellerAdress VARCHAR(200) NOT NULL
);

CREATE TABLE Product(
		ProductID SERIAL,
				CONSTRAINT PK_Products PRIMARY KEY (ProductID),
		ProductName VARCHAR(100) NOT NULL,
		ProductPrice DECIMAL(10,2),
		Stock INT,
		CategoryID INT,
			CONSTRAINT FK_Products_CategoryID
			FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
		SellerID INT,
			CONSTRAINT FK_Products_SellerID 
			FOREIGN KEY (SellerID) REFERENCES Seller(SellerID)
);

CREATE TABLE Orders(
		OrderID SERIAL,
				CONSTRAINT PK_Orders PRIMARY KEY (OrderID),
		OrderDate DATE NOT NULL,
		TotalPrice DECIMAL(10,2),
		PaymentType VARCHAR(20) CHECK (PaymentType IN ('Cash', 'Credit Card', 'Credit Options', 'With IBAN')),
		CustomerID INT,
			CONSTRAINT FK_Orders_CustomerID 
			FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderDetail(
		OrderDetailID SERIAL,
				CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderDetailID),
		ProductNumber INTEGER,
		TotalPrice DECIMAL(10,2),
		OrderID INT,
			CONSTRAINT FK_OrderDetail_OrderID 
			FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
		ProductID INT,
			CONSTRAINT FK_OrderDetail_ProductID 
			FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);