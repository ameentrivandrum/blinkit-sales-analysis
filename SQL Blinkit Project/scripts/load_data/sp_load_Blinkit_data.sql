-- ========================================================================================
-- Script     : sp_load_Blinkit_data.sql
-- Purpose    : Executes the full ETL process in one stored procedure call
-- Author     : Al Ameen
-- Project    : Blinkit Grocery Sales Analysis using SQL
--
-- Description:
--   - This master procedure loads data from CSV into the RAW table.
--   - Then cleans the data and inserts it into the REFINED table.
--   - Both steps are executed in sequence with logging.
-- ========================================================================================

USE BlinkitDB;
GO

---------------------------------------
-- Drop existing procedure if it exists
---------------------------------------
IF OBJECT_ID('dbo.sp_load_Blinkit_data', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.sp_load_Blinkit_data;
    PRINT 'Existing procedure [sp_load_Blinkit_data] dropped.';
END
GO

----------------------------------
-- Create the master ETL procedure
----------------------------------
CREATE PROCEDURE dbo.sp_load_Blinkit_data
AS
BEGIN
    SET NOCOUNT ON;

    PRINT 'Starting full ETL process...';

	----------------
    -- Load raw data
	----------------
    EXEC dbo.sp_load_raw_blinkit_data;

	----------------------------
    -- Clean and move to refined
	----------------------------
    EXEC dbo.sp_clean_and_load_refined_data;

    PRINT 'Full ETL process completed successfully.';
END;
GO

-- Optional: Execute the procedure
-- EXEC dbo.sp_load_Blinkit_data;
