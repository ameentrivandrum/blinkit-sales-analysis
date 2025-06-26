# 🛒 Blinkit Sales Analysis using SQL Server

## 📌 Project Overview

This project demonstrates a complete **data analytics pipeline using SQL Server** on Blinkit grocery sales data. It showcases the full process — from database setup, raw data loading, schema design, data transformation, quality checks, to final business-focused analysis using **T-SQL** in SQL Server Management Studio (SSMS).

---

## 🧠 Objective

- Design a multi-schema database system in SQL Server.
- Ingest and transform raw sales data using T-SQL scripts and stored procedures.
- Conduct data quality checks and cleanse the data.
- Generate insights using exploratory SQL queries with a business focus.

---

## 🧰 Tools & Technologies

- **Database**: Microsoft SQL Server
- **IDE**: SQL Server Management Studio (SSMS)
- **Language**: T-SQL (Transact-SQL)
- **Source Files**: CSV & Excel
- **Version Control**: GitHub

---

## 🗂️ Project Structure

```bash
📦 Blinkit Project/
 ┣ 📂 dataset/
 ┃ ┣ 📄 BlinkIT Grocery Data.csv
 ┃ ┗ 📄 BlinkIT Grocery Data.xlsx
 ┣ 📂 SQL/
 ┃ ┗ 📂 scripts/
 ┃   ┣ 📂 analysis/
 ┃   ┃ ┣ 📄 data_quality_checks.sql
 ┃   ┃ ┗ 📄 exploratory_data_analysis.sql
 ┃   ┣ 📂 init/
 ┃   ┃ ┗ 📄 init_database_and_schemas.sql
 ┃   ┣ 📂 raw_schema/
 ┃   ┃ ┣ 📄 ddl_raw_blinkit_data.sql
 ┃   ┃ ┗ 📄 load_raw_blinkit_data.sql
 ┃   ┣ 📂 refined_schema/
 ┃   ┃ ┣ 📄 ddl_refined_blinkit_data.sql
 ┃   ┃ ┗ 📄 clean_and_load_refined_data.sql
 ┃   ┗ 📂 load_data/
 ┃     ┗ 📄 sp_load_Blinkit_data.sql
