-- ==============================================================================================
-- Filename : init_database_and_schemas.sql
-- Purpose  : Creates the BlinkitDB database and initializes the raw and refined schemas if they do not exist
-- Author   : Al Ameen
-- Project  : Blinkit Grocery Sales Analysis using SQL

-- Description:
--    - Implements a simplified Medallion Architecture using raw and refined schemas.
--    - The [raw] schema stores unprocessed data exactly as received from the source.
--    - The [refined] schema contains cleaned and transformed data ready for analysis.
-- ==============================================================================================

---------------------------------------------------------------
-- Switch to the master context to safely create a new database
---------------------------------------------------------------
USE master;
GO
-----------------------------------------------
-- Create BlinkitDB if it doesn't already exist
-----------------------------------------------
IF NOT EXISTS ( SELECT name FROM sys.databases WHERE name = N'BlinkitDB' )
	BEGIN
		CREATE DATABASE BlinkitDB;
		PRINT 'Database [BlinkitDB] created successfully.';
	END
ELSE
	BEGIN
		PRINT 'Database [BlinkitDB] already exists.';
	END
GO

-------------------------------------------
-- Switch context to the BlinkitDB database
-------------------------------------------
USE BlinkitDB;
GO
------------------------
-- Create the RAW schema
------------------------
IF NOT EXISTS ( SELECT * FROM sys.schemas WHERE name = 'raw' )
	BEGIN
		EXEC('CREATE SCHEMA raw');
		PRINT 'Schema [raw] created successfully.';
	END
ELSE
	BEGIN
		PRINT 'Schema [raw] already exists.';
	END
GO

----------------------------
-- Create the REFINED schema
----------------------------
IF NOT EXISTS ( SELECT * FROM sys.schemas WHERE name = 'refined' )
	BEGIN
		EXEC('CREATE SCHEMA refined');
		PRINT 'Schema [refined] created successfully.';
	END
ELSE
	BEGIN
		PRINT 'Schema [refined] already exists.';
	END
GO
