===================================
-- PART 1:
-- 1. CREATE DATABASE, USERS, AND LOGINS
-- 2. 4 TEAMS (DEVELOPER, HR, FINANCE, AUDIT) LOGIN WITH USER SETUP KARNE WALE HE
-- 3. TABLES CREATE / ALTER / INSERT / UPDATE
===================================

-- 1. CREATE DATABASE, LOGINS, USERS, AND TABLES
-- IF THE 'GoogleBD' DATABASE DOES NOT EXIST, THEN CREATE IT; OTHERWISE, DO NOTHING.
IF NOT EXISTS (SELECT * FROM sys.databases WHERE NAME = 'GoogleBD')
BEGIN
CREATE DATABASE  GoogleBD;
END;

-- After creating the GoogleBD database, create the logins: DevLogin, HRLogin, FinLogin, and AuditLogin
CREATE LOGIN DevLogin WITH PASSWORD = 'dev@123';
CREATE LOGIN HRLogin WITH PASSWORD = 'hr@123';
CREATE LOGIN FinLogin WITH PASSWORD = 'fin@123';
CREATE LOGIN AuditLogin WITH PASSWORD = 'audit@123';

-- CREATE THE CORRESPONDING USERS (DEVUSER, HRUSER, FINUSER, AND AUDITUSER) INSIDE THE GoogleBD DATABASE.
USE GoogleBD;
CREATE USER DevUser FOR LOGIN DevLogin;
CREATE USER HRUser FOR LOGIN HRLogin;
CREATE USER FinUser FOR LOGIN FinLogin;
CREATE USER AuditUser FOR LOGIN AuditLogin;

-- CREATE THE TABLES (Employees and Salaries) IN THE GoogleBD DATABASE.
CREATE TABLE Employees (
	empID INT PRIMARY KEY IDENTITY (1000,1),
	empName NVARCHAR (100),
	empRole NVARCHAR (50),
	empDept NVARCHAR (50)
);

CREATE TABLE Salaries (
	empID INT PRIMARY KEY,
	empSal DECIMAL(10,2)
	FOREIGN KEY (empID) REFERENCES Employees(empID)
);

-- AFTER CREATING THE Employees TABLE, USE THE ALTER STATEMENT TO MODIFY ITS STRUCTURE IF NEEDED.
ALTER TABLE [dbo].[Employees] ADD empMail NVARCHAR (100);

-- INSERT DATA INTO THE Employees and Salaries TABLES IN THE GoogleBD DATABASE.
INSERT INTO [dbo].[Employees] (empName, empRole, empDept, empMail)
VALUES ('David', 'Developer', 'IT', 'david@google.com'),
('warner', 'HR Manager', 'HR', 'warner@google.com'),
('cummins', 'Finance analyst', 'Finance', 'cummins@google.com');

SELECT * FROM [dbo].[Employees];

INSERT INTO Salaries (empID, empSal)
VALUES (1000, 80000.00),
(1001, 85000.00),
(1002, 55000.00);

SELECT * FROM [dbo].[Salaries];

-- UPDATE RECORDS IN THE Employees and Salaries TABLES IN THE GoogleBD DATABASE.
UPDATE [dbo].[Employees]
SET empRole = 'Senior Software Developer'
WHERE empID = 1000;

UPDATE [dbo].[Salaries]
SET empSal = 100000.00
WHERE empID = 1000;

==============================================
-- PART 2:
--4. GRANT, REVOKE, DENY with Table level permissions
--5. Assign Database level roles (db_owner, db_datareader, db_datawriter)
--6. Test Specific users access (ALTER / DROP Commands) 
==============================================
-- GRANT, REVOKE, DENY with Table level permissions
-- GRANT
USE GoogleBD;

-- DevUser ko Employees SELECT
GRANT SELECT ON [dbo].[Employees] TO DevUser;

-- HRUser ko Employees INSERT
grant select, INSERT ON [dbo].[Employees] TO HRUser;

-- FinUser ko Salaries UPDATE
GRANT UPDATE ON [dbo].[Salaries] TO FinUser;

-- REVOKE
REVOKE INSERT ON [dbo].[Employees] TO DevUser;

-- DENY
DENY DELETE ON [dbo].[Salaries] TO AuditUser;
==============================================
-- Assign Database level roles (db_owner, db_datareader, db_datawriter)
-- (db_owner, db_datareader, db_datawriter)
-- db_datawriter (INSERT, UPDATE, DELETE)
EXEC sp_addrolemember 'db_owner', 'DevUser';

CREATE TABLE student (
	id INT,
	name NVARCHAR(50)
);

grant select, insert on [dbo].[Salaries] to devuser;

EXEC sp_droprolemember 'db_datareader', 'DevUser';
==============================================
-- ALTER / DROP Commands
EXEC sp_addrolemember 'db_owner', 'FinUser';

DROP TABLE [dbo].[Salaries];
==============================================
			   -- THANK YOU --
==============================================