# SQL Queries — Adventure Works Analysis

This folder contains all SQL queries written for the Adventure Works project using **MySQL Workbench**.

---

## Files in This Folder

| File Name | Description |
|-----------|-------------|
| [Adventure Works SQL](Adventure_Works_Analysis_SQl.sql) | Complete SQL file with all 11+ queries |
| [Dashboard 7](Dashboard7.png) | Query screenshot — Database setup + Product/Customer JOINs |
| [Dashboard 8](Dashboard8.png) | Query screenshot — KPI View + Stored Procedure |
| [Dashboard 9](Dashboard9.png) | Query screenshot — Profit, Month-wise, Year-wise, Quarter-wise |
| [Dashboard 10](Dashboard10.png) | Query screenshot — Additional analysis queries |

---

## Queries Covered

| # | Query | Description |
|---|-------|-------------|
| 1 | Product-wise Sales | JOIN dimproduct + fact table → Total Sales per product |
| 2 | Customer Full Name + Product | 3-table JOIN across customer, product, sales |
| 3 | Date Fields Extraction | Year, Month, MonthName, Quarter from OrderDateKey |
| 4 | Gender-wise Sales | Sales aggregated by customer gender |
| 5 | Country-wise Sales | Sales grouped by territory/country |
| 6 | Profit Calculation | `(UnitPrice × Qty × (1 - Discount)) - (StandardCost × Qty)` |
| 7 | Month-wise Sales | Sales grouped and ordered by month |
| 8 | Year-wise Sales | Sales grouped by year ascending |
| 9 | Quarter-wise Sales | Sales grouped by quarter |
| 10 | KPI VIEW | Single view returning Total Sales, Order Qty, Total Profit, Distinct Orders |
| 11 | Stored Procedure | `CustInfo(CustomerKey)` — returns individual customer sales summary |

---

## SQL Concepts Used
- `CREATE DATABASE`, `USE`, `CREATE VIEW`, `CREATE PROCEDURE`
- `JOIN` (INNER, multiple tables)
- `GROUP BY`, `ORDER BY`, `WHERE`
- Aggregate functions — `SUM()`, `COUNT()`, `ROUND()`, `CONCAT()`
- Date functions — `YEAR()`, `MONTH()`, `MONTHNAME()`, `QUARTER()`
- `CASE WHEN` logic
- Stored Procedure with `IN` parameter + `CALL`

---

## Key Query Output
```
Total Sales    | Order Quantity | Total Profit | Distinct Orders
29.36 M        | 60.40 K        | 12.08 M      | 27.66 K
```
