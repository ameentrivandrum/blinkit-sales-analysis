-- ========================================================================================
-- Script     : data_quality_checks.sql
-- Purpose    : Run data validation and quality checks for Blinkit Grocery Sales Analysis
-- Author     : Al Ameen
-- Project    : Blinkit Grocery Sales Analysis using SQL
-- ========================================================================================

-- ------------------------------------------------------------
-- Execute the cleanup procedure (runs full ETL)
-- ------------------------------------------------------------
EXEC dbo.sp_clean_and_load_refined_data;
GO

-- ----------------------------------------------------------------------
-- Check number of rows in raw and refined tables
-- Inference: If counts match, no data was lost during transformation
-- ----------------------------------------------------------------------
SELECT COUNT(*) AS row_count FROM raw.blinkit_data;
SELECT COUNT(*) AS row_count FROM refined.blinkit_data;
GO

-- -------------------------------------------------------------------------------------
-- Review distinct values in [Item_Fat_Content] before and after cleaning
-- Inference:
--    - Raw data may contain abbreviations like 'LF', 'reg'
--    - These are cleaned to 'Low Fat' and 'Regular' in refined table using CASE
-- -------------------------------------------------------------------------------------
SELECT DISTINCT Item_Fat_Content AS fat_content_raw FROM raw.blinkit_data;
SELECT DISTINCT Item_Fat_Content AS fat_content_refined FROM refined.blinkit_data;
GO

-- ----------------------------------------------------------------------------------
-- Check count of rows per Item_Identifier in raw table
-- Inference:
--    - Multiple rows per item identifier are expected due to product re-entries
-- ----------------------------------------------------------------------------------
SELECT
    Item_Identifier,
    COUNT(*) AS item_count
FROM raw.blinkit_data
GROUP BY Item_Identifier
ORDER BY item_count DESC;
GO

-- ----------------------------------------------------------------------------------
-- Review full records to inspect potential duplicates
-- Inference:
--    - Useful to manually verify different rows having same Item_Identifier
--    - No deduplication is needed unless exact duplicates are confirmed
-- ----------------------------------------------------------------------------------
SELECT * FROM raw.blinkit_data
ORDER BY Item_Identifier;
GO

-- ----------------------------------------------------------------------------------
-- Review count of each Item_Type
-- Inference:
--    - Expecting distinct item types
--    - No cleaning required if category names are consistent
-- ----------------------------------------------------------------------------------
SELECT
    Item_Type,
    COUNT(*) AS type_count
FROM raw.blinkit_data
GROUP BY Item_Type
ORDER BY type_count DESC;
GO

-- ----------------------------------------------------------------------------------
-- Get all distinct Outlet Identifiers
-- Inference:
--    - Helps identify unique stores/outlets present in the data
-- ----------------------------------------------------------------------------------
SELECT DISTINCT Outlet_Identifier FROM raw.blinkit_data;

-- ----------------------------------------------------------------------------------
-- Get all distinct Outlet Location Types
-- Inference:
--    - Shows distribution of outlets across urban, rural, tiered locations
-- ----------------------------------------------------------------------------------
SELECT DISTINCT Outlet_Location_Type FROM raw.blinkit_data;

-- ----------------------------------------------------------------------------------
-- Get all distinct Outlet Sizes
-- Inference:
--    - Useful to identify missing or inconsistent size values like NULL or 'Unknown'
-- ----------------------------------------------------------------------------------
SELECT DISTINCT Outlet_Size FROM raw.blinkit_data;

-- ----------------------------------------------------------------------------------
-- Review distinct values in the Rating column in RAW data
-- Inference:
--    - Check for malformed values, text, or blanks before transformation
-- ----------------------------------------------------------------------------------
SELECT DISTINCT Rating FROM raw.blinkit_data;

-- ----------------------------------------------------------------------------------
-- Review distinct values in the Rating column in REFINED data
-- Inference:
--    - Post-cleaning, values should be numeric or NULL (from failed conversions)
-- ----------------------------------------------------------------------------------
SELECT DISTINCT Rating FROM refined.blinkit_data;

-- ----------------------------------------------------------------------------------
-- Count NULLs in Item_Visibility column
-- Inference:
--    - Use IS NULL (not = NULL) to correctly detect missing values
-- ----------------------------------------------------------------------------------
SELECT COUNT(*) AS null_count
FROM raw.blinkit_data
WHERE Item_Visibility IS NULL;

-- ----------------------------------------------------------------------------------
-- Count NULLs in Item_Weight column
-- Inference:
--    - A significant number of weights are missing; however, this is expected in the dataset
--    - No cleaning is applied at this stage since it doesn’t impact the current analysis
-- ----------------------------------------------------------------------------------
SELECT COUNT(*) AS null_count
FROM raw.blinkit_data
WHERE Item_Weight IS NULL;

-- ----------------------------------------------------------------------------------
-- Count NULLs in Sales column
-- Inference:
--    - Sales should ideally never be NULL; if present, it's a critical data issue
-- ----------------------------------------------------------------------------------
SELECT COUNT(*) AS null_count
FROM raw.blinkit_data
WHERE Sales IS NULL;

-- ----------------------------------------------------------------------------------
-- Count NULLs in Rating column in RAW data
-- Inference:
--    - Some Ratings might be missing or non-numeric in the raw table
-- ----------------------------------------------------------------------------------
SELECT COUNT(*) AS null_count
FROM raw.blinkit_data
WHERE Rating IS NULL;

-- ----------------------------------------------------------------------------------
-- Count NULLs in Rating column in REFINED data
-- Inference:
--    - Non-numeric ratings will be converted to NULL during cleaning
-- ----------------------------------------------------------------------------------
SELECT COUNT(*) AS null_count
FROM refined.blinkit_data
WHERE Rating IS NULL;
