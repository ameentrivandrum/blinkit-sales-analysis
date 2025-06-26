-- =======================================================================
--  Script     : ddl_raw_blinkit_data.sql
--  Purpose    : Drop and recreate the table [raw.blinkit_data]
--  Author     : Al Ameen
--  Project    : Blinkit Grocery Sales Analysis using SQL

--  Description:
--    - Defines the raw layer table to store unprocessed Blinkit sales data.
--    - Schema structure directly matches the source CSV file.
--    - The 'Rating' column is typed as VARCHAR to support data cleaning later.
-- =======================================================================

USE BlinkitDB;
GO

--------------------------
-- Drop table if it exists
--------------------------
IF OBJECT_ID('raw.blinkit_data', 'U') IS NOT NULL
	BEGIN
		DROP TABLE raw.blinkit_data;
		PRINT 'Existing table raw.blinkit_data dropped.';
	END
GO

---------------------------------
-- Create new table in RAW schema
---------------------------------
CREATE TABLE raw.blinkit_data (
    Item_Fat_Content           VARCHAR(50),
    Item_Identifier            VARCHAR(50),
    Item_Type                  VARCHAR(100),
    Outlet_Establishment_Year  INT,
    Outlet_Identifier          VARCHAR(50),
    Outlet_Location_Type       VARCHAR(50),
    Outlet_Size                VARCHAR(50),
    Outlet_Type                VARCHAR(50),
    Item_Visibility            FLOAT,
    Item_Weight                FLOAT,
    Sales                      FLOAT,
    Rating                     VARCHAR(10)  -- Stored as text to avoid import failures from non-numeric values
);
GO

PRINT 'Table raw.blinkit_data created successfully.';
