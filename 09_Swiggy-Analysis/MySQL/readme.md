# 🗄️ SQL Queries — Swiggy Food Orders Analysis

**File:** `Swiggy_Analysis.sql`  
All queries written in **MySQL Workbench** on the `swiggy` table with insights after every query.

---

## 📄 Files in This Folder

| File Name | Description |
|-----------|-------------|
| [Swiggy Analysis MySQL](Swiggy_Analysis.sql) | Complete SQL file — all queries across 6 sections |
| [SW1](SW1.png) | Database setup + basic SELECT |
| [SW2](SW2.png) | EDA output — counts and KPIs |
| [SW3](SW3.png) | Null check + price + rating stats |
| [SW4](SW4.png) | Filtering queries |
| [SW5](SW5.png) | Aggregation + time analysis |
| [SW6](SW6.png) | Advanced — CASE WHEN, window functions, subquery |

---

## 📋 Complete Query List

### Section 1 — Database Setup & Loading
| # | Query | Description |
|---|-------|-------------|
| 1 | `CREATE DATABASE swiggy` | Create database |
| 2 | `LOAD DATA INFILE` | Bulk load CSV with latin1 encoding |
| 3 | `SELECT * FROM swiggy LIMIT 10` | First look at dataset |

### Section 2 — Basic EDA
| # | Query | Key Output |
|---|-------|------------|
| 4 | `COUNT(*)` | **1,97,430 total rows** |
| 5 | Distinct counts | **28 cities, 993 restaurants, 59,064 dishes** |
| 6 | NULL check (all 14 columns) | **Zero nulls across all columns** ✅ |
| 7 | MAX/MIN/AVG price | Max ₹8,000 / Min ₹0.95 / Avg ~₹220 |
| 8 | Rating stats + unrated count | Avg ~4.0, many unrated dishes |
| 9 | Rating count distribution | Majority "Unrated" or "Low (1–25)" |
| 10 | Food type distribution (window %) | **Veg 71.5% (1,40,604) vs Non-Veg 28.5% (56,826)** |
| 11 | Date range with DATEDIFF | ~8–9 months of data (Q1–Q3) |
| 12 | Quarter-wise orders | **Q2 leads (74,163 orders)** |
| 13 | Day-wise orders | **Saturday highest (28,938), Tuesday lowest** |

### Section 3 — Filtering & Pattern Matching
| # | Query | Description |
|---|-------|------------|
| 14 | `WHERE city = "Bengaluru" AND price >= 2000` | Premium Bengaluru dishes |
| 15 | `WHERE food_type = "Non-Veg" AND price BETWEEN 200 AND 400` | Mid-range Non-Veg |
| 16 | `WHERE city IN ("Mumbai","New Delhi","Kolkata")` | Metro cities filter |
| 17 | `WHERE rating_count = 0 AND price > 2000` | Premium unrated dishes |
| 18 | `ORDER BY price DESC LIMIT 10` | Top 10 most expensive dishes |
| 19 | `WHERE rating_count >= 100 ORDER BY rating DESC LIMIT 10` | Top 10 highest rated popular dishes |
| 20 | `WHERE dish_name LIKE '%Biryani%'` | Biryani search |
| 21 | `WHERE restaurant_name LIKE 'The %'` | Restaurants starting with 'The' |
| 22 | `WHERE food_type <> "Veg" AND rating > 4.5` | Highly rated Non-Veg |
| 23 | `WHERE price < 10` | Cheapest dishes (sauces, condiments) |

### Section 4 — Aggregation & HAVING
| # | Query | Key Output |
|---|-------|------------|
| 24 | City-wise orders + avg price + avg rating | Panaji leads avg price (₹306) |
| 25 | Food type: orders + avg/min/max price | Non-Veg pricier on average |
| 26 | State-wise orders + avg price | **Karnataka leads (20,077 orders)** |
| 27 | `HAVING avg_price > 300` | Only Panaji and Lucknow above ₹300 |
| 28 | `HAVING total_dishes > 50` | Large menu restaurants |
| 29 | Max price per city | Metro cities have highest price ceilings |
| 30 | `HAVING veg_count > nonveg_count` | **ALL 28 cities have more Veg than Non-Veg** |
| 31 | `HAVING orders >= 1000 AND rating > 3.8` | **ALL 28 cities pass both thresholds** |

### Section 5 — Time Analysis
| # | Query | Key Output |
|---|-------|------------|
| 32 | Date component extraction | YEAR, MONTH, MONTHNAME, DAY, DAYNAME, WEEKOFYEAR |
| 33 | Monthly orders | **January leads (25,398), orders are steady year-round** |
| 34 | Week-wise orders | Peak week identification |
| 35 | Quarter: orders + avg/max/min price | Q1 highest avg price (₹269.07) |
| 36 | Busiest day per city | Saturday dominates most cities |
| 37 | Single busiest date | **22nd Feb 2025 (Saturday) — 1,550 orders** |
| 38 | Weekend vs Weekday split (window %) | **Weekday 70.92% (1,40,018) vs Weekend 29.08% (57,412)** |

### Section 6 — Advanced Queries
| # | Query | Concept |
|---|-------|---------|
| 39 | Price category label (Budget/Mid-Range/Premium/Luxury) | `CASE WHEN` |
| 40 | Count per price category with % | `CASE WHEN` + Window Function |
| 41 | Restaurant performance label (Poor/Average/Good/Excellent) | `CASE WHEN` on AVG(rating) |
| 42 | Weekend/Veg segment combined label | `CONCAT(CASE...END, ' | ', food_type)` |
| 43 | Dishes above overall avg price | **Subquery** — `WHERE price > (SELECT AVG(price) FROM swiggy)` |
| 44 | Hidden whitespace in category | `LENGTH() <> LENGTH(TRIM())` |
| 45 | Biryani spelling variants | `REGEXP "Biryani\|Biriyani\|Biryanis"` |
| 46 | Fix Biriyani → Biryani | `REPLACE(dish_name, 'Biriyani', 'Biryani')` |
| 47 | String functions | `UPPER()`, `LENGTH()`, `LEFT()`, `TRIM()` |
| 48 | Longest/Shortest city name | `ORDER BY LENGTH(city) DESC/ASC LIMIT 1` |

---

## 🛠️ SQL Concepts Used
- `LOAD DATA INFILE` with CHARACTER SET latin1
- `COUNT(DISTINCT)`, `SUM(CASE WHEN IS NULL)` for null checks
- `CONCAT()` with `ROUND()` for formatted output
- `CASE WHEN` — price labels, performance labels, day type flags
- **Window Function** — `SUM(COUNT(*)) OVER()` for percentage calculation
- **Subquery** — filter above average price
- `HAVING` — post-aggregation filtering
- `REGEXP` — pattern matching for spelling variants
- `REPLACE()`, `UPPER()`, `LENGTH()`, `LEFT()`, `TRIM()` — string functions
- `DATEDIFF()`, `YEAR()`, `MONTH()`, `MONTHNAME()`, `DAY()`, `DAYNAME()`, `WEEKOFYEAR()`
- `IN`, `BETWEEN`, `LIKE`, `<>` — filtering operators
- `GROUP BY` with `ORDER BY COUNT(*) DESC`
