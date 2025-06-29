-- =======================================================================
--  Script     : ddl_refined_blinkit_data.sql
--  Purpose    : Drop and recreate the table [refined.blinkit_data]
--  Author     : Al Ameen
--  Project    : Blinkit Grocery Sales Analysis using SQL

--  Description:
--    - Defines the refined layer table to store cleaned Blinkit sales data.
--    - Suitable for analytical queries and reporting.
--    - The 'Rating' column is cast as FLOAT assuming it's cleaned from raw.
-- =======================================================================

USE BlinkitDB;
GO

--------------------------
-- Drop table if it exists
--------------------------
IF OBJECT_ID('refined.blinkit_data', 'U') IS NOT NULL
BEGIN
    DROP TABLE refined.blinkit_data;
    PRINT 'Existing table refined.blinkit_data dropped.';
END
GO

-------------------------------------
-- Create new table in REFINED schema
-------------------------------------
CREATE TABLE refined.blinkit_data (
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
    Rating                     FLOAT  -- Now typed correctly for cleaned data
);
GO

PRINT 'Table refined.blinkit_data created successfully.';
