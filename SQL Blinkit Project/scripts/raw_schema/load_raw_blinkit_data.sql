-- =======================================================================
--  Script     : load_raw_blinkit_data.sql
--  Purpose    : Define a stored procedure to truncate and bulk load Blinkit raw data
--  Author     : Al Ameen
--  Project    : Blinkit Grocery Sales Analysis using SQL
--
--  Description:
--    - Truncates existing records from [raw].[blinkit_data].
--    - Loads fresh data from the source CSV using BULK INSERT.
--    - Uses TABLOCK for performance and logs row-level errors via ERRORFILE.
-- =======================================================================


USE BlinkitDB;
GO
---------------------------------------
-- Drop existing procedure if it exists
---------------------------------------
IF OBJECT_ID('dbo.sp_load_raw_blinkit_data', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_load_raw_blinkit_data;
GO

---------------------------------------------------------------------
-- Create stored procedure to truncate and bulk load Blinkit raw data
---------------------------------------------------------------------
CREATE PROCEDURE dbo.sp_load_raw_blinkit_data
AS
	BEGIN
		SET NOCOUNT ON;

		PRINT 'Truncating table [raw.blinkit_data]...';
		--------------------------------------------------------
		-- Truncates existing records from [raw].[blinkit_data].
		--------------------------------------------------------
		TRUNCATE TABLE raw.blinkit_data;

		PRINT 'Loading data from CSV...';
		----------------------------------------------------------
		-- Loads fresh data from the source CSV using BULK INSERT.
		----------------------------------------------------------
		BULK INSERT raw.blinkit_data
		FROM 'E:\project\Projects\Blinkit Project\dataset\BlinkIT Grocery Data.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			TABLOCK,
			ERRORFILE = 'E:\project\Projects\Blinkit Project\dataset\blinkit_error_log'
		);

		PRINT 'Data loaded successfully. Check error file if issues occurred.';
	END
GO
