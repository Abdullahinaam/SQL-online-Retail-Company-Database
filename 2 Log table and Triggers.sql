


USE OnlineRetailDB;
Go

-- Create a Log Table


CREATE TABLE ChangeLog (
	LogID INT PRIMARY KEY IDENTITY(1,1),
	TableName NVARCHAR(50),
	Operation NVARCHAR(10),
	RecordID INT,
	ChangeDate DATETIME DEFAULT GETDATE(),
	ChangedBy NVARCHAR(100)
);
GO

-- A. Triggers for Products Table

-- Trigger for INSERT on Products table
  
CREATE OR ALTER TRIGGER trg_Insert_Product
ON Products
AFTER INSERT
AS
BEGIN
	
	-- Insert a record into the ChangeLog Table

	INSERT INTO ChangeLog (TableName, Operation, RecordID, ChangedBy)
	SELECT 'Products', 'INSERT', inserted.ProductID, SYSTEM_USER
	FROM inserted;

	-- Display a message indicating that the trigger has fired.

	PRINT 'INSERT operation logged for Products table.';
END;
GO

-- Try to insert one record into the Products table

INSERT INTO Products(ProductName, CategoryID, Price, Stock)
VALUES ('Wireless Mouse', 1, 4.99, 20);

INSERT INTO Products(ProductName, CategoryID, Price, Stock)
VALUES ('Spiderman Multiverse Comic', 3, 2.50, 150);

-- Display products table

SELECT * FROM Products;

-- Display ChangeLog table

SELECT * FROM ChangeLog;

-- Trigger for UPDATE on Products table


CREATE OR ALTER TRIGGER trg_Update_Product
ON Products
AFTER UPDATE
AS
BEGIN	
	-- Insert a record into the ChangeLog Table

	INSERT INTO ChangeLog (TableName, Operation, RecordID, ChangedBy)
	SELECT 'Products', 'UPDATE', inserted.ProductID, SYSTEM_USER
	FROM inserted;


	-- Display a message indicating that the trigger has fired.


	PRINT 'UPDATE operation logged for Products table.';
END;
GO

-- Try to update any record from Products table


UPDATE Products SET Price = Price - 300 WHERE ProductID = 2;

-- Trigger for DELETE a record from Products table

CREATE OR ALTER TRIGGER trg_delete_Product
ON Products
AFTER DELETE
AS
BEGIN
	
	-- Insert a record into the ChangeLog Table

	INSERT INTO ChangeLog (TableName, Operation, RecordID, ChangedBy)
	SELECT 'Products', 'DELETE', deleted.ProductID, SYSTEM_USER
	FROM deleted;

	-- Display a message indicating that the trigger has fired.

	PRINT 'DELETE operation logged for Products table.';
END;
GO

-- Try to delete an existing record to see the effect of Trigger

DELETE FROM Products WHERE ProductID = 11;
select * from ChangeLog

-- B. Triggers for Customers Table
-- Trigger for INSERT on Customers table

CREATE OR ALTER TRIGGER trg_Insert_Customers
ON Customers
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	-- Insert a record into the ChangeLog Table

	INSERT INTO ChangeLog (TableName, Operation, RecordID, ChangedBy)
	SELECT 'Customers', 'INSERT', inserted.CustomerID, SYSTEM_USER
	FROM inserted;

	-- Display a message indicating that the trigger has fired.

	PRINT 'INSERT operation logged for Customers table.';
END;
GO

-- Trigger for UPDATE on Customers table

CREATE OR ALTER TRIGGER trg_Update_Customers
ON Customers
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	-- Insert a record into the ChangeLog Table

	INSERT INTO ChangeLog (TableName, Operation, RecordID, ChangedBy)
	SELECT 'Customers', 'UPDATE', inserted.CustomerID, SYSTEM_USER
	FROM inserted;

	-- Display a message indicating that the trigger has fired.

	PRINT 'UPDATE operation logged for Customers table.';
END;
GO

-- Trigger for DELETE on Customers table

CREATE OR ALTER TRIGGER trg_Delete_Customers
ON Customers
AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;

	-- Insert a record into the ChangeLog Table

	INSERT INTO ChangeLog (TableName, Operation, RecordID, ChangedBy)
	SELECT 'Customers', 'DELETE', deleted.CustomerID, SYSTEM_USER
	FROM deleted;

	-- Display a message indicating that the trigger has fired.

	PRINT 'DELETE operation logged for Customers table.';
END;
GO

-- Try to insert a new record to see the effect of Trigger

INSERT INTO Customers(FirstName, LastName, Email, Phone, Address, City, State, ZipCode, Country)
VALUES 
('Virat', 'Kohli', 'virat.kingkohli@example.com', '123-456-7890', 'South Delhi', 'Delhi', 
'Delhi', '5456665', 'INDIA');
GO
	
-- Try to update an existing record to see the effect of Trigger

UPDATE Customers SET State = 'Florida' WHERE State = 'IL';
GO
	
-- Try to delete an existing record to see the effect of Trigger

DELETE FROM Customers WHERE CustomerID = 5;
GO
select * from ChangeLog
