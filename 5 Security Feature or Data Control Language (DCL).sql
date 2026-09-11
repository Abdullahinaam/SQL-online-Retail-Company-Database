/* 
  --Implementing Security / Role-Based Access Control (RBAC)

--To manage access control in SQL Server, you'll need to use a combination of SQL Server's security features, 
such as logins, users, roles, and permissions. 

Here's a step-by-step guide on how to do this:

1: Create Logins

			First, create logins at the SQL Server level. 
			Logins are used to authenticate users to the SQL Server instance.
*/

-- Create a login with SQL Server Authentication
CREATE LOGIN SalesUser WITH PASSWORD = 'strongpassword';

/*
  2: Create Users

			Next, create users in the `OnlineRetailDB` database for each login. 
			Users are associated with logins and are used to grant access to the database.
*/
USE OnlineRetailDB;
GO

-- Create a user in the database for the SQL Server Login

CREATE USER SalesUser FOR LOGIN SalesUser;


/*
   3: Create Roles 

			Define roles in the database that will be used to group users with similar permissions. 
			This helps simplify permission management.
*/

-- Create roles in the database
CREATE ROLE SalesRole;
CREATE ROLE MarketingRole;

/*
### Step 4: Assign Users to Roles
----------------------------------
			Add the users to the appropriate roles.
*/
-- Add users to roles
EXEC sp_addrolemember 'SalesRole', 'SalesUser';

/*
   5: Grant Permissions

			Grant the necessary permissions to the roles based on the access requirements
*/

-- GRANT SELECT permission on the Customers Table to the SalesRole

GRANT SELECT ON Customers TO SalesRole;

-- GRANT INSERT permission on the Orders Table to the SalesRole

GRANT INSERT ON Orders TO SalesRole;

-- GRANT UPDATE permission on the Orders Table to the SalesRole

GRANT UPDATE ON Orders TO SalesRole;

-- GRANT SELECT permission on the Products Table to the SalesRole

GRANT SELECT ON Products TO SalesRole;

SELECT * FROM Customers;
DELETE FROM Customers;

SELECT * FROM Orders;
DELETE FROM Orders;
INSERT INTO Orders(CustomerId, OrderDate, TotalAmount)
VALUES (1, GETDATE(), 600);

SELECT * FROM Products;
DELETE FROM Products;

/*
    6: Revoke Permissions (if needed)

			If you need to revoke permissions, you can use the `REVOKE` statement.
*/
-- REVOKE INSERT permission on the Orders to the SalesRole

REVOKE INSERT ON Orders FROM SalesRole;

/* 
    7: View Effective Permissions

			You can view the effective permissions for a user using the query
*/

SELECT * FROM fn_my_permissions(NULL,'DATABASE');





/*

Summary

	1. Create Logins: Authenticate users at the SQL Server level.
	2. Create Users: Create users in the database for the logins.
	3. Create Roles: Group users with similar permissions.
	4. Assign Users to Roles: Add users to appropriate roles.
	5. Grant Permissions: Grant necessary permissions to roles.
	6. Revoke Permissions: Revoke permissions if needed.
	7. View Effective Permissions: Check the effective permissions for users.

*/


--- Scenario 1: Read-Only Access to All Tables

CREATE ROLE ReadOnlyRole;
GRANT SELECT ON SCHEMA::dbo TO ReadOnlyRole;

--- Scenario 2: Data Entry Clerk (Insert Only on Orders and OrderItems)

CREATE ROLE DataEntryClerk;
GRANT INSERT ON Orders TO DataEntryClerk;
GRANT INSERT ON OrderItems TO DataEntryClerk;

--- Scenario 3: Product Manager (Full Access to Products and Categories)

CREATE ROLE ProductManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Products TO ProductManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Categories TO ProductManagerRole;

--- Scenario 4: Order Processor (Read and Update Orders)

CREATE ROLE OrderProcessorRole;
GRANT SELECT, UPDATE ON Orders TO OrderProcessorRole;

--- Scenario 5: Customer Support (Read Access to Customers and Orders)

CREATE ROLE CustomerSupportRole;
GRANT SELECT ON Customers TO CustomerSupportRole;
GRANT SELECT ON Orders TO CustomerSupportRole;

--- Scenario 6: Marketing Analyst (Read Access to All Tables, No DML)

CREATE ROLE MarketingAnalystRole;
GRANT SELECT ON SCHEMA::dbo TO MarketingAnalystRole;

--- Scenario 7: Sales Analyst (Read Access to Orders and OrderItems)

CREATE ROLE SalesAnalystRole;
GRANT SELECT ON Orders TO SalesAnalystRole;
GRANT SELECT ON OrderItems TO SalesAnalystRole;

--- Scenario 8: Inventory Manager (Full Access to Products)

CREATE ROLE InventoryManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Products TO InventoryManagerRole;

--- Scenario 9: Finance Manager (Read and Update Orders)

CREATE ROLE FinanceManagerRole;
GRANT SELECT, UPDATE ON Orders TO FinanceManagerRole;

--- Scenario 10: Database Backup Operator (Backup Database)

CREATE ROLE BackupOperatorRole;
GRANT BACKUP DATABASE TO BackupOperatorRole;

--- Scenario 11: Database Developer (Full Access to Schema Objects)

CREATE ROLE DatabaseDeveloperRole;
GRANT CREATE TABLE, ALTER, DROP ON SCHEMA::dbo TO DatabaseDeveloperRole;

--- Scenario 12: Restricted Read Access (Read Only Specific Columns)

CREATE ROLE RestrictedReadRole;
GRANT SELECT (FirstName, LastName, Email) ON Customers TO RestrictedReadRole;

--- Scenario 13: Reporting User (Read Access to Views Only)

CREATE ROLE ReportingRole;
GRANT SELECT ON SalesReportView TO ReportingRole;
GRANT SELECT ON InventoryReportView TO ReportingRole;

--- Scenario 14: Temporary Access (Time-Bound Access)

-- Grant access

CREATE ROLE TempAccessRole;
GRANT SELECT ON SCHEMA::dbo TO TempAccessRole;

-- Revoke access after the specified period

REVOKE SELECT ON SCHEMA::dbo FROM TempAccessRole;

--- Scenario 15: External Auditor (Read Access with No Data Changes)


CREATE ROLE AuditorRole;
GRANT SELECT ON SCHEMA::dbo TO AuditorRole;
DENY INSERT, UPDATE, DELETE ON SCHEMA::dbo TO AuditorRole;

--- Scenario 16: Application Role (Access Based on Application)

CREATE APPLICATION ROLE AppRole WITH PASSWORD = 'StrongPassword1';
GRANT SELECT, INSERT, UPDATE ON Orders TO AppRole;

--- Scenario 17: Role-Based Access Control (RBAC) for Multiple Roles 
-- Combine roles

CREATE ROLE CombinedRole;
EXEC sp_addrolemember 'SalesRole', 'CombinedRole';
EXEC sp_addrolemember 'MarketingRole', 'CombinedRole';

--- Scenario 18: Sensitive Data Access (Column-Level Permissions)

CREATE ROLE SensitiveDataRole;
GRANT SELECT (Email, Phone) ON Customers TO SensitiveDataRole;

--- Scenario 19: Developer Role (Full Access to Development Database)

CREATE ROLE DevRole;
GRANT CONTROL ON DATABASE::OnlineRetailDB TO DevRole;

--- Scenario 20: Security Administrator (Manage Security Privileges)

CREATE ROLE SecurityAdminRole;
GRANT ALTER ANY LOGIN TO SecurityAdminRole;
GRANT ALTER ANY USER TO SecurityAdminRole;
GRANT ALTER ANY ROLE TO SecurityAdminRole;
