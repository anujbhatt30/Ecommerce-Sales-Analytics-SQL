# 🛒 Ecommerce Sales Analytics using SQL

## 📌 Project Overview

This project focuses on analyzing e-commerce sales data using **SQL** to extract meaningful business insights. The goal is to understand sales performance, customer behavior, product trends, and regional performance through data analysis.

The project demonstrates practical SQL skills including **database creation, data importing, data cleaning, aggregation, joins, subqueries, CTEs, and window functions**.

---

# 🎯 Problem Statement

E-commerce businesses generate large amounts of transactional data. Analyzing this data helps organizations understand:

- Revenue performance
- Customer purchasing patterns
- Best-selling products
- Category performance
- Regional sales trends
- Customer value and retention

This project uses SQL-based analysis to answer important business questions and support data-driven decision-making.

---

# 📂 Dataset Information

The dataset contains transactional e-commerce sales records with details about:

| Column | Description |
|--------|-------------|
| Order ID | Unique identifier for each order |
| Order Date | Date when order was placed |
| Customer ID | Unique customer identifier |
| Customer Name | Customer details |
| Product Name | Name of purchased product |
| Category | Product category |
| Region | Customer region |
| State | Customer state |
| Quantity | Number of products purchased |
| Sales | Revenue generated |
| Profit | Profit earned |

---

# 🛠️ Technologies Used

- **MySQL**
- **SQL**
- **MySQL Workbench**
- **CSV Dataset**
- **Git & GitHub**

---

# 🗄️ Database Design

The project includes:

- Database creation
- Table creation
- Data importing
- Data validation
- Analytical queries

Example:

```sql
CREATE DATABASE ecommerce_sales_analytics;
```

---

# 🔍 Business Analysis Performed

## 1. Sales Performance Analysis

Analyzed:

- Total revenue generated
- Monthly sales trends
- Yearly sales growth
- Average order value


Example:

```sql
SELECT 
SUM(sales) AS total_revenue
FROM orders;
```

---

## 2. Product Analysis

Identified:

- Top-selling products
- Most profitable categories
- Product contribution to revenue


Example:

```sql
SELECT
product_name,
SUM(sales) AS revenue
FROM orders
GROUP BY product_name
ORDER BY revenue DESC;
```

---

## 3. Customer Analysis

Performed customer-level analysis:

- Top spending customers
- Customer purchase frequency
- Repeat customers
- Customer value analysis


Example:

```sql
SELECT
customer_name,
SUM(sales) AS total_spending
FROM orders
GROUP BY customer_name
ORDER BY total_spending DESC;
```

---

## 4. Regional Sales Analysis

Analyzed:

- Sales by region
- State-wise performance
- Regional profitability


Example:

```sql
SELECT
region,
SUM(sales) AS revenue
FROM orders
GROUP BY region;
```

---

# 📊 Advanced SQL Concepts Used

The project applies:

✅ Aggregate Functions  
- SUM()
- COUNT()
- AVG()
- MAX()
- MIN()

✅ Filtering & Sorting  
- WHERE
- HAVING
- ORDER BY

✅ Joins

- INNER JOIN
- LEFT JOIN

✅ Subqueries

✅ Common Table Expressions (CTEs)

✅ Window Functions

- RANK()
- ROW_NUMBER()
- DENSE_RANK()

---

# 📈 Key Insights Generated

Some insights obtained from analysis:

- Identified products generating maximum revenue.
- Found the highest-performing categories.
- Analyzed customer spending patterns.
- Compared sales performance across regions.
- Discovered repeat customer behavior.
- Evaluated profitability trends.

---

# 📁 Project Structure

```
Ecommerce-Sales-Analytics-SQL
│
├── Dataset
│   └── ecommerce_sales.csv
│
├── SQL Queries
│   ├── database_creation.sql
│   ├── data_import.sql
│   ├── data_cleaning.sql
│   └── sales_analysis.sql
│
├── Results
│   └── query_outputs.png
│
└── README.md
```

---

# 🚀 Future Improvements

- Build an interactive **Power BI dashboard**
- Perform customer segmentation using RFM analysis
- Automate reporting using Python
- Deploy analytics pipeline using cloud services

---

# 👨‍💻 Author

**Anuj Bhatt**


Skills:
- SQL
- Python
- Machine Learning
- Data Analytics
- Power BI

---

⭐ If you found this project useful, consider giving it a star!