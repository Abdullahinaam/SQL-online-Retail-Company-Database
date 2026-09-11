
/*

A. Indexes on Categories Table
	1. Clustered Index on CategoryID: Usually created with the primary key.
*/

USE OnlineRetailDB;
GO
-- Clustered Index on Categories Table (CategoryID)


CREATE CLUSTERED INDEX IDX_Categories_CategoryID
ON Categories(CategoryID);
GO

/*
B. Indexes on Products Table
	1. Clustered Index on ProductID: This is usually created automatically when 
	   the primary key is defined.

	2. Non-Clustered Index on CategoryID: To speed up queries filtering by CategoryID.


	3. Non-Clustered Index on Price: To speed up queries filtering or sorting by Price.
*/

-- Drop Foreign Key Constraint from OrderItems Table - ProductID

ALTER TABLE OrderItems DROP CONSTRAINT FK__OrderItem__Produ__440B1D61;


-- Clustered Index on Products Table (ProductID)

CREATE CLUSTERED INDEX IDX_Products_ProductID 
ON Products(ProductID);
GO

-- Non-Clustered Index on CategoryID: To speed up queries filtering by CategoryID.

CREATE NONCLUSTERED INDEX IDX_Products_CategoryID
ON Products(CategoryID);
GO

-- Non-Clustered Index on Price: To speed up queries filtering or sorting by Price.

CREATE NONCLUSTERED INDEX IDX_Products_Price
ON Products(Price);
GO

-- Recreate Foreign Key Constraint on OrderItems (ProductID Column)

ALTER TABLE OrderItems ADD CONSTRAINT FK_OrderItems_Products
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);
GO

/*
C. Indexes on Orders Table
	1. Clustered Index on OrderID: Usually created with the primary key.

	2. Non-Clustered Index on CustomerID: To speed up queries filtering by CustomerID.

	3. Non-Clustered Index on OrderDate: To speed up queries filtering or sorting by OrderDate.
*/

-- Drop Foreign Key Constraint from OrderItems Table - OrderID

ALTER TABLE OrderItems DROP CONSTRAINT FK__OrderItem__Order__44FF419A;

-- Clustered Index on OrderID

CREATE CLUSTERED INDEX IDX_Orders_OrderID
ON Orders(OrderID);
GO

-- Non-Clustered Index on CustomerID: To speed up queries filtering by CustomerID.

CREATE NONCLUSTERED INDEX IDX_Orders_CustomerID
ON Orders(CustomerID);
GO

--  Non-Clustered Index on OrderDate: To speed up queries filtering or sorting by OrderDate.

CREATE NONCLUSTERED INDEX IDX_Orders_OrderDate
ON Orders(OrderDate);
GO

-- Recreate Foreign Key Constraint on OrderItems (OrderID Column)

ALTER TABLE OrderItems ADD CONSTRAINT FK_OrderItems_OrderID
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);
GO

/*
D. Indexes on OrderItems Table
	1. Clustered Index on OrderItemID: Usually created with the primary key.

	2. Non-Clustered Index on OrderID: To speed up queries filtering by OrderID.

	3. Non-Clustered Index on ProductID: To speed up queries filtering by ProductID.
*/

-- Clustered Index on OrderItemID

CREATE CLUSTERED INDEX IDX_OrderItems_OrderItemID
ON OrderItems(OrderItemID);
GO

-- Non-Clustered Index on OrderID: To speed up queries filtering by OrderID.

CREATE NONCLUSTERED INDEX IDX_OrderItems_OrderID
ON OrderItems(OrderID);
GO

--  Non-Clustered Index on ProductID: To speed up queries filtering by ProductID.
CREATE NONCLUSTERED INDEX IDX_OrderItems_ProductID
ON OrderItems(ProductID);
GO


/*

E. Indexes on Customers Table
	1. Clustered Index on CustomerID: Usually created with the primary key.

	2. Non-Clustered Index on Email: To speed up queries filtering by Email.

	3. Non-Clustered Index on Country: To speed up queries filtering by Country.
*/

-- Drop Foreign Key Constraint from Orders Table - CustomerID

ALTER TABLE Orders DROP CONSTRAINT FK__Orders__Customer__403A8C7D;

-- Clustered Index on CustomerID

CREATE CLUSTERED INDEX IDX_Customers_CustomerID
ON Customers(CustomerID);
GO

-- Non-Clustered Index on Email: To speed up queries filtering by Email.

CREATE NONCLUSTERED INDEX IDX_Customers_Email
ON Customers(Email);
GO

--  Non-Clustered Index on Country: To speed up queries filtering by Country.
CREATE NONCLUSTERED INDEX IDX_Customers_Country
ON Customers(Country);
GO


-- Recreate Foreign Key Constraint on Orders (CustomerID Column)

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_CustomerID
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
GO
