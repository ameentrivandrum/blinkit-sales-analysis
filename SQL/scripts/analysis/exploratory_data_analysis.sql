-- ========================================================================================
-- Script     : exploratory_data_analysis.sql
-- Purpose    : Perform business-focused exploratory data analysis on refined Blinkit dataset
-- Author     : Al Ameen
-- Project    : Blinkit Grocery Sales Analysis using SQL
-- 
-- Description:
--   - Generates insights from the cleaned [refined].[blinkit_data] table.
--   - Analyzes product categories, outlet performance, and sales distribution.
--   - Supports business decisions by identifying trends, patterns, and key metrics.
--
-- Notes:
--   - This analysis helps in understanding customer preferences, outlet strengths,
--     and item-level sales drivers.
--   - Results are used for reporting, visualization, and strategic planning.
-- ========================================================================================

-- ===================================================
-- ✅ KPI Dashboard Metrics
--     1. Total Sales       : Overall revenue (in million ₹)
--     2. Average Sales     : Mean sale value per transaction
--     3. Number of Items   : Total rows of item transactions
--     4. Average Rating    : Mean customer rating (post-cleaning)
-- ===================================================

SELECT 
    'Total Sales'       AS KPI_Item, FORMAT(ROUND(SUM(Sales) / 1000000.0, 2), 'N2') + ' Million Rupees' AS Value
FROM refined.blinkit_data
UNION ALL
SELECT 
    'Average Sales', FORMAT(ROUND(AVG(Sales), 2), 'N2') + ' Rupees'
FROM refined.blinkit_data
UNION ALL
SELECT 
    'Number of Items', CAST(COUNT(*) AS VARCHAR)
FROM refined.blinkit_data
UNION ALL
SELECT 
    'Average Rating', CAST(ROUND(AVG(Rating), 2) AS VARCHAR)
FROM refined.blinkit_data;

-- ===================================================
-- ✅ Granular Requirements
--     1. Total Sales by Fat Content:
--         - Objective: Analyse the impact of fat content on total sales.
--         - Additional KPI Metrics: Assess how other KPIs (Average Sales, 
--           Number of Items, Average Rating) vary with fat content.
--     2. Total Sales by Item Type:
--         - Objective: Identify the performance of different item types in terms of total sales.
--         - Additional KPI Metrics: Assess how other KPIs vary with fat content.
--     3. Fat Content By Outlet:
--         - Objective: Compare total sales across different outlets segmented by fat content.
--         - Additional KPI Metrics: Assess how other KPIs vary with fat content.
--     4. Total Sales by Outlet Establishment:
--         - Objective: Evaluate how the age of outlet establishment influences total sales.
-- ===================================================

-------------------------------------
--     1. Total Sales by Fat Content:
-------------------------------------
SELECT
    Item_Fat_Content,
    FORMAT(ROUND(SUM(Sales) / 1000000.0, 2), 'N2') + ' Million Rupees' AS Total_Sales,
    FORMAT(ROUND(AVG(Sales), 2), 'N2') + ' Rupees' AS Average_Sales,
    COUNT(*) AS Number_of_Items,
    ROUND(AVG(Rating), 2) AS Average_Rating
FROM refined.blinkit_data AS bd
GROUP BY Item_Fat_Content;

-----------------------------------
--     2. Total Sales by Item Type:
-----------------------------------
SELECT
    Item_Type, Item_Fat_Content,
    FORMAT(ROUND(SUM(Sales), 2), 'N2') + ' Thousand Rupees' AS Total_Sales,
    FORMAT(ROUND(AVG(Sales), 2), 'N2') + ' Rupees' AS Average_Sales,
    COUNT(*) AS Number_of_Items,
    ROUND(AVG(Rating), 2) AS Average_Rating
FROM refined.blinkit_data AS bd
GROUP BY Item_Type, Item_Fat_Content
ORDER BY Item_Type, Item_Fat_Content;

--------------------------------
--     3. Fat Content By Outlet:
--------------------------------
SELECT
    Outlet_Identifier, Item_Fat_Content,
    FORMAT(ROUND(SUM(Sales), 2), 'N2') + ' Thousand Rupees' AS Total_Sales,
    FORMAT(ROUND(AVG(Sales), 2), 'N2') + ' Rupees' AS Average_Sales,
    COUNT(*) AS Number_of_Items,
    ROUND(AVG(Rating), 2) AS Average_Rating
FROM refined.blinkit_data AS bd
GROUP BY Outlet_Identifier, Item_Fat_Content
ORDER BY Outlet_Identifier, Item_Fat_Content;

----------------------------------------------
--     4. Total Sales by Outlet Establishment:
----------------------------------------------
SELECT
    Outlet_Establishment_Year,
    FORMAT(ROUND(SUM(Sales), 2), 'N2') + ' Rupees' AS Total_Sales
FROM refined.blinkit_data AS bd
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year;

-- ===================================================
-- ✅ Charts Requirements
--     5. Percentage of Sales by Outlet Size:
--         - Objective: Analyse the correlation between outlet size and total sales
--     6. Sales by Outlet Location:
--         - Objective: Assess the geographical distribution of sales across different locations
--     7. All metrics by Outlet Types:
--         - Objective: Provide a comprehensive view of all key metrics (Total Sales, 
--           Average Sales, Number of Items, Average Rating) broken down by different outlet types.
-- ===================================================

---------------------------------------------
--     5. Percentage of Sales by Outlet Size:
---------------------------------------------
SELECT
    Outlet_Size,
    FORMAT(SUM(Sales), 'N2') + ' Rupees' AS Total_Sales,
    CAST(ROUND(SUM(Sales) * 100.0 / NULLIF(SUM(SUM(Sales)) OVER (), 0), 2) AS VARCHAR) + ' %' AS Percentage_Share
FROM refined.blinkit_data
GROUP BY Outlet_Size
ORDER BY SUM(Sales) DESC;

-----------------------------------
--     6. Sales by Outlet Location:
-----------------------------------
SELECT
    Outlet_Location_Type,
    FORMAT(ROUND(SUM(Sales) / 1000000.0, 2), 'N2') + ' Million Rupees' AS Total_Sales
FROM refined.blinkit_data AS bd
GROUP BY Outlet_Location_Type;

--------------------------------------
--     7. All metrics by Outlet Types:
--------------------------------------
SELECT
    Outlet_Type,
    FORMAT(ROUND(SUM(Sales) / 1000000.0, 2), 'N2') + ' Million Rupees' AS Total_Sales,
    FORMAT(ROUND(AVG(Sales), 2), 'N2') + ' Rupees' AS Average_Sales,
    COUNT(*) AS Number_of_Items,
    ROUND(AVG(Rating), 2) AS Average_Rating
FROM refined.blinkit_data AS bd
GROUP BY Outlet_Type;
