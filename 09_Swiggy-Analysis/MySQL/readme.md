# SQL Queries — Swiggy Food Orders Analysis

**File:** [Swiggy Analysis MySQL](Swiggy%20Analysis.sql)  
All queries written in **MySQL Workbench** with insights after every query — 8 sections total.

--- 

## Files in This Folder

| File Name | Description |
|-----------|-------------|
| [Swiggy Analysis MySQL](Swiggy%20Analysis.sql) | Complete SQL project containing all queries, views, stored procedures, and analysis |
| [SW1.png](SW1.png) | Dataset scale analysis showing total cities, restaurants, and dishes |
| [SW2.png](SW2.png) | Data quality validation across 14 columns confirming no missing values |
| [SW3.png](SW3.png) | Food type analysis using window functions comparing Veg and Non-Veg dishes |
| [SW4.png](SW4.png) | HAVING clause analysis identifying cities with average dish price above ₹300 |
| [SW5.png](SW5.png) | Weekday vs Weekend order distribution analysis |
| [SW6.png](SW6.png) | Price category segmentation using CASE WHEN (Budget, Mid-Range, Premium) |
| [SW7.png](SW7.png) | View creation and output for `vw_city_summary` and `vw_top_rated_dishes` |
| [SW8.png](SW8.png) | Stored procedures (`GetTopDishes`, `cityreport`) with execution results |

---

## Complete Query Sections

### Section 1 — Database Setup
```sql
CREATE DATABASE swiggy;
LOAD DATA INFILE '...' INTO TABLE swiggy CHARACTER SET latin1;
```

### Section 2 — Basic EDA
| # | Query | Key Output |
|---|-------|------------|
| 1 | `SELECT * LIMIT 10` | First look at dataset |
| 2 | `COUNT(*)` | **1,97,430 total rows** |
| 3 | Distinct counts | **28 cities, 993 restaurants, 59,064 dishes** |
| 4 | NULL check (14 columns) | **Zero nulls across all columns** ✅ |
| 5 | MAX/MIN/AVG price | Max ₹8,000 / Min ₹0.95 / Avg ₹268.51 |
| 6 | Rating stats + unrated count | Avg ~4.0 |
| 7 | Rating count distribution CASE WHEN | Majority "Unrated" or "Low (1–25)" |
| 8 | Food type % (window function) | **Veg 71.5% (1,40,604) vs Non-Veg 28.5% (56,826)** |
| 9 | Date range with DATEDIFF | ~8–9 months (Q1–Q3) |
| 10 | Quarter-wise orders | **Q2 leads (74,163 orders)** |
| 11 | Day-wise orders | **Saturday highest (28,938), Tuesday lowest** |

### Section 3 — Filtering & Pattern Matching
| # | Query | Description |
|---|-------|-------------|
| 12 | `WHERE city="Bengaluru" AND price >= 2000` | Premium Bengaluru dishes |
| 13 | `WHERE food_type="Non-Veg" AND price BETWEEN 200 AND 400` | Mid-range Non-Veg |
| 14 | `WHERE city IN ("Mumbai","New Delhi","Kolkata")` | Metro cities |
| 15 | `WHERE food_type <> "Veg" AND rating > 4.5` | Highly rated Non-Veg |
| 16 | `WHERE rating_count=0 AND price > 2000` | Premium unrated dishes |
| 17 | `ORDER BY price DESC LIMIT 10` | Top 10 most expensive |
| 18 | `WHERE rating_count >= 100 ORDER BY rating DESC LIMIT 10` | Top 10 rated popular dishes |
| 19 | `WHERE city IN (...) LIMIT 5` | Top 5 cities by restaurants |
| 20 | `WHERE dish_name LIKE '%Biryani%'` | Biryani dishes |
| 21 | `WHERE restaurant_name LIKE 'The %'` | Premium restaurant names |
| 22 | String functions on dish names | `UPPER()`, `LENGTH()`, `LEFT()` |
| 23 | Whitespace check | `LENGTH() <> LENGTH(TRIM())` |
| 24 | REGEXP for Biryani variants | `REGEXP "Biryani\|Biriyani\|Biryanis"` |
| 25 | REPLACE fix | `REPLACE(dish_name,'Biriyani','Biryani')` |

### Section 4 — Aggregation & HAVING
| # | Query | Key Output |
|---|-------|------------|
| 26 | City-wise orders + avg price + avg rating | Panaji leads avg price (₹306) |
| 27 | Food type: orders + avg/min/max price | Non-Veg pricier on average |
| 28 | State-wise orders | **Karnataka leads (20,077 orders)** |
| 29 | `HAVING avg_price > 300` | Only **Panaji (₹306)** and **Lucknow (₹305)** |
| 30 | `HAVING total_dishes > 50` | Large menu restaurants |
| 31 | Max price per city | Metro city ceiling prices |
| 32 | Veg vs Non-Veg per city | **ALL 28 cities have more Veg than Non-Veg** |
| 33 | `HAVING orders >= 1000 AND rating > 3.8` | **ALL 28 cities pass both thresholds** |

### Section 5 — Time Analysis
| # | Query | Key Output |
|---|-------|------------|
| 34 | Date components extraction | YEAR, MONTH, MONTHNAME, DAYNAME, WEEKOFYEAR |
| 35 | Monthly orders | **January leads (25,398), steady year-round** |
| 36 | Week-wise orders | Peak week identification |
| 37 | Quarter analysis | Q1 highest avg price (₹269.07) |
| 38 | Busiest day per city | Saturday dominates |
| 39 | Single busiest date | **22nd Feb 2025 (Saturday) — 1,550 orders** |
| 40 | Weekend vs Weekday (window %) | **Weekday 70.92% vs Weekend 29.08%** |

### Section 6 — Advanced CASE WHEN + Subquery
| # | Query | Concept |
|---|-------|---------|
| 41 | Price category labels LIMIT 20 | `CASE WHEN` — Budget/Mid-Range/Premium/Luxury |
| 42 | Price category count + % | `CASE WHEN` + Window — **Mid-Range 58.51% (1,15,514)** |
| 43 | Restaurant performance label | `CASE WHEN` on AVG(rating) — Poor/Average/Good/Excellent |
| 44 | Weekend/Veg combined segment | `CONCAT(CASE...END,' \| ',food_type)` — **'Weekday \| Veg': 99,745 orders** |
| 45 | Above avg price filter | **Subquery** — `WHERE price > (SELECT AVG(price))` — **77,848 dishes (39.4%)** |

### Section 7 — Views
```sql
-- View 1: City Summary
CREATE VIEW vw_city_summary AS
SELECT city, COUNT(*) AS total_orders,
COUNT(DISTINCT `restaurant name`) AS total_restaurants,
ROUND(AVG(`price (INR)`), 2) AS avg_price,
ROUND(AVG(rating), 2) AS avg_rating
FROM swiggy GROUP BY city;

SELECT * FROM vw_city_summary ORDER BY total_orders DESC;

-- View 2: Top Rated Dishes
CREATE VIEW vw_top_rated_dishes AS
SELECT city, `restaurant name`, `dish name`, `food type`,
`price (INR)`, rating, `rating count`
FROM swiggy WHERE rating > 4.5 AND `rating count` >= 100;

SELECT * FROM vw_top_rated_dishes ORDER BY rating DESC, `rating count` DESC;
```

| View | Purpose |
|------|---------|
| `vw_city_summary` | Reusable city-level KPI view — orders, restaurants, price, rating |
| `vw_top_rated_dishes` | Curated best dishes — rating > 4.5 AND 100+ reviews |

### Section 8 — Stored Procedures
```sql
-- Procedure 1: Top Dishes by City
DELIMITER ==
CREATE PROCEDURE GetTopDishes(IN city_name VARCHAR(100), IN top_n INT)
BEGIN
  SELECT `dish name`, `food type`, COUNT(*) AS order_count,
  ROUND(AVG(`price (INR)`), 2) AS avg_price,
  ROUND(AVG(rating), 2) AS avg_rating
  FROM swiggy WHERE city = city_name
  GROUP BY `dish name`, `food type`
  ORDER BY order_count DESC LIMIT top_n;
END==
DELIMITER ;

CALL GetTopDishes('Bengaluru', 10);
CALL GetTopDishes('Mumbai', 5);
CALL GetTopDishes('Hyderabad', 3);

-- Procedure 2: City Report
DELIMITER ==
CREATE PROCEDURE cityreport(IN city_name VARCHAR(100))
BEGIN
  SELECT city, COUNT(*) AS total_orders,
  COUNT(DISTINCT `restaurant name`) AS total_restaurants,
  ROUND(AVG(`price (INR)`), 2) AS avg_price,
  ROUND(AVG(rating), 2) AS avg_rating
  FROM swiggy WHERE city = city_name GROUP BY city;
END==
DELIMITER ;

CALL cityreport('Bengaluru');
CALL cityreport('Mumbai');
```

| Procedure | Parameters | Output |
|-----------|------------|--------|
| `GetTopDishes` | city_name + top_n | Top N dishes by order count for any city |
| `cityreport` | city_name | Full KPI report: orders, restaurants, avg price, avg rating |

---

## All SQL Concepts Used
- `LOAD DATA INFILE` with CHARACTER SET latin1
- `SUM(CASE WHEN IS NULL)` — null check across 14 columns
- `CONCAT()` + `ROUND()` — formatted output
- `CASE WHEN` — price labels, performance labels, day-type flags
- **Window Function** — `SUM(COUNT(*)) OVER()` for % calculation
- **Subquery** — filter above dataset average price
- `HAVING` — post-aggregation filtering (4 different uses)
- `REGEXP` — Biryani spelling variant detection
- `REPLACE()`, `UPPER()`, `LENGTH()`, `LEFT()`, `TRIM()` — string functions
- `DATEDIFF()`, `YEAR()`, `MONTH()`, `MONTHNAME()`, `DAY()`, `DAYNAME()`, `WEEKOFYEAR()`
- `IN`, `BETWEEN`, `LIKE`, `<>`, `LIMIT` — filtering
- `CREATE VIEW` — 2 reusable views
- `CREATE PROCEDURE` with `DELIMITER ==` — 2 stored procedures with IN parameters
- `CALL` — procedure execution with different arguments
