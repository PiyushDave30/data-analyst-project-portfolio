# 🗄️ SQL Queries — Hospitality Analysis

This folder contains all SQL queries written for the Hospitality Analysis project using **MySQL Workbench**.

---

## 📄 Files in This Folder

| File Name | Description |
|-----------|-------------|
| [Hospitality Analytics Analysis](Hospitality_Analytics_SQL.sql) | Complete SQL file with all 11 queries |
| [HA7.png](HA7.png) | Screenshot — KPI master query with output |
| [HA8.png](HA8.png) | Screenshot — Trend analysis, weekday/weekend, revenue by state |
| [HA9.png](HA9.png) | Screenshot — Class-wise revenue, booking status, weekly trend |

---

## 📋 Queries Covered

| # | Query | Description |
|---|-------|-------------|
| 1 | KPI Master Query | Revenue Generated, Revenue Realized, Total Bookings, Total Guests, Cancellation Rate, Utilized Capacity — all in one query |
| 2 | City-wise Revenue | Revenue grouped by city |
| 3 | Property-wise Revenue | Revenue by each Atliq hotel property |
| 4 | Room Class Revenue | Revenue by Elite, Premium, Presidential, Standard |
| 5 | Platform-wise Bookings | Bookings count per booking platform |
| 6 | Trend Analysis | Year + Month wise revenue realized |
| 7 | Weekday & Weekend | Revenue and bookings split by day type (JOIN with dim_date) |
| 8 | Revenue by State & Hotel | City + property-level revenue (LEFT JOIN dim_hotels) |
| 9 | Class-wise Revenue | Room class revenue (LEFT JOIN dim_rooms) |
| 10 | Booking Status Count | Checked Out, Cancelled, No Show counts |
| 11 | Weekly Trend | Week number wise Total Revenue + Total Bookings |

---

## 🛠️ SQL Concepts Used
- `CREATE DATABASE`, `USE`
- `JOIN`, `LEFT JOIN` (multi-table across fact + dimensions)
- `GROUP BY`, `ORDER BY DESC`
- Aggregate — `SUM()`, `COUNT()`, `ROUND()`, `CONCAT()`
- `CASE WHEN` — for Cancellation Rate and Utilized Capacity calculation
- Date functions — `YEAR()`, `MONTHNAME()`

---

## 💡 Key Query Output (KPI Master)
```
Revenue Generated | Revenue Realized | Total Booking | Total Guest | Cancellation Rate | Utilized Capacity
200.75 Cr         | 170.88 Cr        | 134.59K       | 135K        | 24.83%            | 94.41K
```
