# 🛒 Blinkit Sales Analysis

## 📌 Project Overview

This project performs **exploratory data analysis (EDA)** on a cleaned Blinkit grocery sales dataset using **SQL**. The goal is to generate business-focused insights about product categories, outlet performance, customer behavior, and sales trends.

---

## 🧠 Objective

- Analyze grocery sales data for patterns and trends.
- Provide actionable insights to improve inventory, sales strategy, and category performance.
- Practice real-world SQL for data exploration and storytelling.

---

## 🔧 Tools & Technologies

- **SQL (PostgreSQL / MySQL compatible)**
- **DBMS**: PostgreSQL (can be run in BigQuery, MySQL, etc.)
- **Platform**: GitHub for version control and portfolio
- *(Optional for visualization: Power BI or Tableau)*

---

## 🗂️ Dataset Details

The analysis is performed on the following table:

- `refined.blinkit_data` – preprocessed grocery sales data containing fields like:
  - `order_id`
  - `product_name`
  - `category`
  - `quantity`
  - `price`
  - `order_date`
  - `outlet_name`

> Note: The raw data has been cleaned and refined before this analysis. Raw and cleaning steps are not shown here.

---

## 📊 Key Analysis Areas

- 🔸 Top-selling product categories
- 🔸 Sales performance by outlet
- 🔸 Monthly sales trends
- 🔸 Quantity and revenue heatmaps
- 🔸 Price-sensitive product analysis

---

## 📁 File Structure

```bash
📦 blinkit-sales-analysis/
 ┣ 📄 exploratory_data_analysis.sql   # Main SQL analysis file
 ┣ 📄 README.md                        # Project overview
 ┗ 📄 [future files: visualizations, notes, etc.]

