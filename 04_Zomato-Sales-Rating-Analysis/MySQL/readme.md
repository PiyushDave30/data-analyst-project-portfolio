# SQL Queries — Zomato Sales & Rating Analysis

This folder contains all SQL queries for the Zomato project — organized into 6 analysis sections with 25+ queries.

---

## Files in This Folder

| File Name | Description |
|-----------|-------------|
| [Zomato SQL Analysis](Zomato%20Restaurant%20Analysis.sql) | Complete SQL file — all 25+ queries in 6 sections |
| [Z1](Z1.png) | Screenshot — Advanced Stored Procedure |
| [Z2](Z2.png) | Screenshot — KPI View with output |
| [Z3](Z3.png) | Screenshot — Delivery & Booking Trends |
| [Z4](Z4.png) | Screenshot — Cuisine + Customer Behaviour |
| [Z5](Z5.png) | Screenshot — City + Revenue Analysis |
| [Z6](Z6.png)` | Screenshot — Window Functions + Services |

---

## Query Sections & Queries

### Section 1 — KPI Analysis
| # | Query |
|---|-------|
| 1 | `CREATE VIEW KPI` — 9 metrics: Total Restaurants, Countries, Cities, Cuisines, Votes, Avg Bill, Avg Rating, Online Delivery %, Table Booking % |
| 2 | `SELECT * FROM KPI` — output: 9551 restaurants, 15 countries, 141 cities, 1826 cuisines, avg rating 2.93, online delivery 25.66%, table booking 12.12% |

### Section 2 — City Analysis
| # | Query |
|---|-------|
| 3 | City with highest number of restaurants |
| 4 | Top 10 cities by restaurant count |
| 5 | City with highest average rating |
| 6 | City with highest avg cost for two |
| 7 | Best value cities — Rating > 4 AND avg cost <= 1000 |

### Section 3 — Revenue Analysis
| # | Query |
|---|-------|
| 8 | Price range vs avg rating and restaurant count |
| 9 | Price range with maximum restaurants |
| 10 | Are premium restaurants (Price Range 4) always highly rated? |
| 11 | Expensive restaurants with poor ratings (Price Range 4 + Rating < 3) |
| 12 | `DENSE_RANK()` — Rank cities by restaurant count using window function |
| 13 | Restaurant segmentation — Budget (<1000), Mid-range (1000–3000), Premium (>3000) using `CASE WHEN` |
| 14 | Restaurants with 0 votes but high ratings (votes=0, rating>3) |
| 15 | Count inactive restaurants (Is_delivering_now = "No") |

### Section 4 — Cuisine Analysis
| # | Query |
|---|-------|
| 16 | Top 10 most popular cuisines |
| 17 | Cuisine with highest average rating |
| 18 | Most common cuisines in top cities |

### Section 5 — Customer Behaviour Analysis
| # | Query |
|---|-------|
| 19 | Restaurants with highest votes (Top 10) |
| 20 | Higher rating → more votes? (Rating vs Avg Votes) |
| 21 | Highly rated but underrated restaurants (rating >= 4.5, votes < 50) |

### Section 6 — Services Offered & Delivery Trends
| # | Query |
|---|-------|
| 22 | Impact of online delivery on rating |
| 23 | Impact of table booking on rating |
| 24 | Cities with highest online delivery adoption (%) |
| 25 | Cities with most table booking restaurants |
| 26 | Are table-booking restaurants more expensive? (Avg bill: Yes=1536, No=1153) |
| 27 | Restaurants offering BOTH delivery + booking |
| 28 | Top 10 cities with both services |
| 29 | **Advanced Stored Procedure** `Method(col_name VARCHAR)` — dynamic column analysis using `PREPARE`/`EXECUTE`/`DEALLOCATE PREPARE` |

---

## SQL Concepts Used
- `CREATE VIEW` for KPI reporting
- `GROUP BY`, `ORDER BY DESC`, `LIMIT`
- `CASE WHEN` — multi-level segmentation (Budget/Mid-range/Premium)
- `SUM(CASE WHEN ...)` — conditional aggregation for % calculations
- `DENSE_RANK() OVER(ORDER BY COUNT(*) DESC)` — Window Function
- `WHERE` with multiple AND conditions
- Dynamic SQL — `SET @qry = CONCAT(...)`, `PREPARE stmt FROM @qry`, `EXECUTE stmt`, `DEALLOCATE PREPARE stmt`
- `COUNT(DISTINCT(...))` for unique counts
- `ROUND()`, `AVG()`, `COUNT()`, `SUM()`
 
---

## KPI View Output
```
Total Restaurants | Countries | Cities | Cuisines | Votes     | Avg Bill | Avg Rating | Online Delivery % | Table Booking %
9551              | 15        | 141    | 1826     | 9551      | 1199     | 2.93       | 2451 (25.66%)     | 1158 (12.12%)
```

## Table Booking Impact on Rating
```
Has_Table_Booking | Total Restaurants | Avg_Bill_For_Two
Yes               | 1158              | 1536
No                | 8393              | 1153
```
