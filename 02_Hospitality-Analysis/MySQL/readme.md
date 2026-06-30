# SQL Queries — Hospitality Analysis

This folder contains all 11 SQL queries written for the Hospitality project in MySQL Workbench.

---

## Files in This Folder

| File Name | Description |
|-----------|-------------|
| [SQL Queries](Hospitality_Analysis.sql) | All 11 SQL queries |
| [HA7](HA7.png) | Screenshot — KPI query + output |
| [HA8](HA8.png) | Screenshot — Trend, Weekday/Weekend, City/Hotel |
| [HA9](HA9.png) | Screenshot — Class Revenue, Status, Weekly Trend |

---

## All 11 Queries

| # | Query | Description | Key Output |
|---|-------|-------------|------------|
| 1 | Database Setup | `CREATE DATABASE Hospital; USE Hospital;` | Database created |
| 2 | KPI Summary | Revenue Generated, Revenue Realized, Total Bookings, Guests, Cancellation Rate, Utilized Capacity — all in ONE query | 200.75Cr revenue, 134.59K bookings, 24.83% cancellation |
| 3 | Revenue by City | SUM of revenue_realized grouped by city | Mumbai top city |
| 4 | Revenue by Hotel | SUM grouped by property | Atliq Exotica highest |
| 5 | Occupancy by Room Class | AVG occupancy % per room class | Elite highest |
| 6 | Trend Analysis | Monthly revenue trend using `YEAR()` + `MONTHNAME()` | May–Jul 2022 |
| 7 | Weekday vs Weekend | JOIN dim_date + fact_bookings on check_in_date — revenue and bookings by day_type | Weekday 63% revenue |
| 8 | Revenue by State & Hotel | LEFT JOIN dim_hotels + fact_bookings — city + property + revenue | Mumbai Atliq Exotica top |
| 9 | Class Wise Revenue | LEFT JOIN dim_rooms + fact_bookings — revenue per room class | Elite 32.87% |
| 10 | Booking Status Count | GROUP BY booking_status — Checked Out, Cancelled, No Show counts | Checked Out 94K |
| 11 | Weekly Trend | JOIN dim_date + fact_bookings — weekly revenue + booking count | Week-wise trend |

---

## SQL Concepts Used
- `CREATE DATABASE`, `USE`
- `SUM()`, `COUNT()`, `AVG()`, `ROUND()`, `CONCAT()`
- `CASE WHEN` — Cancellation Rate, Utilized Capacity calculation
- `GROUP BY`, `ORDER BY DESC`
- `JOIN` — fact_bookings + dim_hotels on property_id
- `LEFT JOIN` — dim_rooms + fact_bookings on room_category
- `JOIN` — dim_date + fact_bookings on check_in_date = date
- `YEAR()`, `MONTHNAME()` — date extraction for trend analysis

---

## 💡 KPI Query Output
```
Revenue Generated | Revenue Realized | Total Booking | Total Guest | Cancellation Rate | Utilized Capacity
200.75Cr          | 170.88Cr         | 134.59K       | 135K        | 24.83%            | 94.41K
```
