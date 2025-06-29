# 🛒 Blinkit Sales Analysis using SQL, Power BI & Python

## 📌 Project Overview
This project demonstrates a complete **data analytics pipeline** on Blinkit grocery sales data using **SQL Server**, **Power BI**, and **Python (Dash)**. It began as a SQL-based analysis inspired by a YouTube video but has since been **significantly extended** with **independent SQL logic**, a **two-layer schema**, **interactive dashboards in Power BI**, and **Python projects**, including a **web dashboard using Dash**.

---

## 🧠 Objective
- Design a multi-schema database system in SQL Server.
- Ingest and transform raw sales data using T-SQL scripts and stored procedures.
- Conduct data quality checks and cleanse the data.
- Perform business-driven analysis using SQL, Power BI, and Python.
- Create interactive visual dashboards with Power BI.
- Build a web-based dashboard using Dash in Python.

---

## 📊 KPI Requirements
1. **Total Sales**: Overall revenue (in million ₹)
2. **Average Sales**: Mean sale value per transaction
3. **Number of Items**: Total number of item transactions
4. **Average Rating**: Mean customer rating (post-cleaning)

---

## 🧩 Business Requirements
1. **Total Sales by Fat Content**
   - Analyze the impact of fat content on total sales.
   - Assess how other KPIs vary with fat content.

2. **Total Sales by Item Type**
   - Identify high-performing item types.
   - Assess how KPIs vary with fat content.

3. **Fat Content by Outlet**
   - Compare total sales across outlets segmented by fat content.

4. **Total Sales by Outlet Establishment**
   - Evaluate how outlet age influences sales.

5. **% Sales by Outlet Size**
   - Analyze correlation between outlet size and total sales.

6. **Sales by Outlet Location**
   - Assess geographical sales distribution.

7. **All Metrics by Outlet Types**
   - Provide a complete view of all key KPIs across outlet types.

---

## 🧰 Tools & Technologies
- **Database**: Microsoft SQL Server
- **BI Tool**: Power BI
- **Programming**: Python (Pandas, Seaborn, Matplotlib, Dash)
- **IDE**: SQL Server Management Studio (SSMS), VS Code, Jupyter Notebook
- **Source Files**: CSV & Excel
- **Version Control**: GitHub

---

## 🗂️ Project Structure
```bash
📦 Blinkit Project/
 ┣ 📂 dataset/
 ┃ ┣ 📄 BlinkIT Grocery Data.csv
 ┃ ┗ 📄 BlinkIT Grocery Data.xlsx
 ┣ 📂 PowerBI Blinkit Project/
 ┃ ┣ 📄 Blinkit Project.pbix
 ┃ ┣ 📄 Blinkit Project_v2.pbix
 ┃ ┣ 📂 Screenshots/
 ┃ ┃ ┣ 📄 Screenshot.PNG
 ┃ ┃ ┗ 📄 ScreenshotWithOneFilter.PNG
 ┃ ┗ 📂 Images for dashboard/
 ┃   ┣ 📄 Avg Sales.PNG
 ┃   ┣ 📄 Background kpi.PNG
 ┃   ┣ 📄 Items.PNG
 ┃   ┣ 📄 Rating.PNG
 ┃   ┗ 📄 Sales.PNG
 ┣ 📂 Python Blinkit Project/
 ┃ ┣ 📄 BlinkitProject.ipynb
 ┃ ┣ 📄 BlinkitProjectDashboard.ipynb
 ┃ ┗ 📄 app_dash_dashboard.py  # Dash app
 ┣ 📂 SQL Blinkit Project/
 ┃ ┗ 📂 scripts/
 ┃   ┣ 📂 analysis/
 ┃   ┃ ┣ 📄 data_quality_checks.sql
 ┃   ┃ ┗ 📄 exploratory_data_analysis.sql
 ┃   ┣ 📂 init/
 ┃   ┃ ┗ 📄 init_database_and_schemas.sql
 ┃   ┣ 📂 raw_schema/
 ┃   ┃ ┣ 📄 ddl_raw_blinkit_data.sql
 ┃   ┃ ┗ 📄 load_raw_blinkit_data.sql
 ┃   ┣ 📂 refined_schema/
 ┃   ┃ ┣ 📄 ddl_refined_blinkit_data.sql
 ┃   ┃ ┗ 📄 clean_and_load_refined_data.sql
 ┃   ┗ 📂 load_data/
 ┃     ┗ 📄 sp_load_Blinkit_data.sql
```

