-- ========================================================================================
-- Script     : clean_and_load_refined_data.sql
-- Purpose    : Stored procedure to clean data from [raw.blinkit_data] and insert into [refined.blinkit_data]
-- Author     : Al Ameen
-- Project    : Blinkit Grocery Sales Analysis using SQL
--
-- Description:
--   - Cleans data from the RAW layer, mainly converting 'Rating' to FLOAT.
--   - Inserts cleaned rows into the REFINED layer for analysis and reporting.
--   - Rows with invalid 'Rating' are skipped during conversion.
-- ========================================================================================

USE BlinkitDB;
GO

-------------------------------
-- Drop existing procedure if any
-------------------------------
IF OBJECT_ID('dbo.sp_clean_and_load_refined_data', 'P') IS NOT NULL
	BEGIN
		DROP PROCEDURE dbo.sp_clean_and_load_refined_data;
		PRINT 'Existing procedure [sp_clean_and_load_refined_data] dropped.';
	END
GO

------------------------------------------------------------
-- Create the stored procedure to clean and load refined data
------------------------------------------------------------
CREATE PROCEDURE dbo.sp_clean_and_load_refined_data
AS
BEGIN
    SET NOCOUNT ON;

    PRINT 'Starting data cleanup and load into [refined.blinkit_data]...';

	------------------------------------------------------
    -- Truncate refined table to reload clean data
	------------------------------------------------------
    TRUNCATE TABLE refined.blinkit_data;

	------------------------------------------
    -- Insert cleaned data from raw to refined
	------------------------------------------
    INSERT INTO refined.blinkit_data (
        Item_Fat_Content,
        Item_Identifier,
        Item_Type,
        Outlet_Establishment_Year,
        Outlet_Identifier,
        Outlet_Location_Type,
        Outlet_Size,
        Outlet_Type,
        Item_Visibility,
        Item_Weight,
        Sales,
        Rating
    )
    SELECT
        CASE UPPER(Item_Fat_Content)
            WHEN 'REG' THEN 'Regular'
            WHEN 'LF' THEN 'Low Fat'
            ELSE Item_Fat_Content
        END AS Item_Fat_Content,
        Item_Identifier,
        Item_Type,
        Outlet_Establishment_Year,
        Outlet_Identifier,
        Outlet_Location_Type,
        Outlet_Size,
        Outlet_Type,
        Item_Visibility,
        Item_Weight,
        Sales,
        TRY_CAST(Rating AS FLOAT) AS Rating  -- Safely convert to FLOAT, NULL if invalid
    FROM raw.blinkit_data
    WHERE ISNUMERIC(Rating) = 1;

    PRINT 'Data successfully cleaned and loaded into [refined.blinkit_data].';
END;
GO

-- Optional: Run this after creation
-- EXEC dbo.sp_clean_and_load_refined_data;
