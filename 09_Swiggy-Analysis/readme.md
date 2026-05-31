# Swiggy Food Orders Analysis 🍕

![SQL Preview](screenshots/SW1.png)

> **Self-Made Project**  
> A comprehensive SQL analysis of Swiggy food order data covering 1,97,430 orders across 993 restaurants, 28 cities, and 59,064 unique dishes — using advanced MySQL queries organized into 6 analytical sections.

---

## 📌 Project Overview

This project performs an end-to-end SQL analysis on Swiggy's food ordering platform data to uncover patterns in restaurant performance, dish pricing, food type preferences, city-wise demand, time-based ordering trends, and customer behaviour.

**Key business questions answered:**
- Which cities and states generate the most orders?
- How do Veg vs Non-Veg dishes compare in volume and pricing?
- What are the peak ordering days, weeks, and months?
- Which restaurants have the best ratings and largest menus?
- How are dishes distributed across price categories (Budget to Luxury)?
- What hidden data quality issues exist in the dataset?

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| **MySQL Workbench** | All analysis — EDA, filtering, aggregation, window functions, subqueries, string functions |

---

## 📋 SQL Query Screenshots

| Screenshot | Section | Content |
|------------|---------|---------|
| `SW1.png` | Database Setup + EDA | DB creation, LOAD DATA INFILE, basic counts |
| `SW2.png` | EDA Results | Total rows, cities, states, restaurants, dishes output |
| `SW3.png` | Data Quality | Null check, price stats, rating stats, food type distribution |
| `SW4.png` | Filtering Queries | Bengaluru premium, Non-Veg filter, metro cities, Biryani search |
| `SW5.png` | Aggregation + Time | City-wise analysis, state orders, monthly trends, day-wise orders |
| `SW6.png` | Advanced Queries | CASE WHEN, window functions, subquery, string functions |

---

## 🔑 Key Business Insights

### 📊 Dataset Overview
| Metric | Value |
|--------|-------|
| Total Rows | 1,97,430 |
| Total Cities | 28 |
| Total Restaurants | 993 |
| Total Unique Dishes | 59,064 |
| Total Food Types | Multiple |
| Total Categories | Multiple |
| Zero Null Values | ✅ All 14 columns clean |

### 💰 Pricing Insights
- **Average dish price: ~₹220** with range from ₹0.95 to ₹8,000
- High-end outliers (₹2000+) represent bulk/party/catering orders
- **Only 2 cities** have avg price above ₹300: **Panaji (₹306)** and **Lucknow (₹305)**
- Surprisingly, metros like Mumbai and Delhi fall **below ₹300 avg** — showing platform-wide price sensitivity
- **Non-Veg dishes are pricier on average** than Veg — meat ingredients drive up cost

### 🥗 Food Type Distribution
| Food Type | Orders | Percentage |
|-----------|--------|------------|
| Veg | 1,40,604 | ~71.5% |
| Non-Veg | 56,826 | ~28.5% |

- **ALL 28 cities** have more Veg listings than Non-Veg — without exception
- Bengaluru leads with **14,481 Veg** vs **5,596 Non-Veg** — Veg dominance is platform-wide, not regional

### ⭐ Rating Insights
- **Average rating: ~4.0** — healthy platform-wide quality score
- **ALL 28 cities** pass both thresholds: 1000+ orders AND avg rating above 3.8
- **Kochi leads** with highest avg rating (4.44), followed by Aizawl and Kolkata (4.41)
- Majority of dishes fall in "Unrated" or "Low (1–25)" rating bucket — many new or low-traffic items

### 📅 Time-Based Insights
- **Busiest day: Saturday (28,938 orders)**, followed by Sunday (28,474)
- **Tuesday is the slowest day** — not Monday as expected
- **Weekdays account for 70.92%** of all orders (1,40,018) vs weekends 29.08% (57,412)
- **Single busiest date: 22nd February 2025 (Saturday)** — 1,550 orders (possibly Valentine's weekend + Swiggy promo)
- **January leads monthly** with 25,398 orders — orders are consistently spread with no dramatic seasonal spike
- **Q2 (Apr–Jun) leads** in quarterly orders — summer holidays + IPL season effect
- **Q1 has highest avg price** (₹269.07) but Q2 has the most orders (74,163)

### 🏙️ City Insights
- **Karnataka leads** state-wise with 20,077 orders
- **Bengaluru** has the most restaurants (Swiggy's home city)
- Panaji (Goa) and Lucknow are the only cities with avg dish price above ₹300

### 💡 Data Quality Findings
- Zero nulls across all 14 columns ✅
- **Hidden whitespace** found in category column — silently inflates category counts in GROUP BY
- **Biryani spelling variants** found: Biryani, Biriyani, Biryanis — category standardization critical
- Dishes priced below ₹10 exist (sauces, ketchup) — valid but outlier-level

---

## 📋 SQL Sections & Concepts

### Section 1 — Database Setup & Loading
```sql
CREATE DATABASE swiggy;
LOAD DATA INFILE '...' INTO TABLE swiggy CHARACTER SET latin1;
```

### Section 2 — Basic EDA
- Total rows, distinct cities, states, restaurants, dishes, food types, categories
- NULL check across all 14 columns using `SUM(CASE WHEN ... IS NULL)`
- Price stats: MAX, MIN, AVG with `CONCAT` formatting
- Rating stats + unrated dish count
- Date range with `DATEDIFF()`

### Section 3 — Filtering & Pattern Matching
- `WHERE city = "Bengaluru" AND price >= 2000`
- `WHERE food_type = "Non-Veg" AND price BETWEEN 200 AND 400`
- `WHERE city IN ("Mumbai","New Delhi","Kolkata")`
- `WHERE dish_name LIKE '%Biryani%'`
- `WHERE restaurant_name LIKE 'The %'`
- `WHERE rating_count = 0 AND price > 2000`

### Section 4 — Aggregation & HAVING
- City-wise: total orders, avg price, avg rating
- State-wise: total orders, avg price
- `HAVING avg_price > 300` — cities with premium pricing
- `HAVING total_dishes > 50` — large menu restaurants
- `HAVING veg_count > nonveg_count` — Veg-dominant cities
- `HAVING total_orders >= 1000 AND avg_rating > 3.8`

### Section 5 — Time Analysis
- `YEAR()`, `MONTH()`, `MONTHNAME()`, `DAY()`, `DAYNAME()`, `WEEKOFYEAR()`
- Monthly order counts + trends
- Quarter-wise orders, avg price, max/min price
- Day-wise orders — busiest day per city
- Single busiest date: `ORDER BY count DESC LIMIT 1`
- Weekend vs Weekday split using `CASE WHEN day IN ('Sat','Sun')`

### Section 6 — Advanced SQL
- **CASE WHEN** — 4-tier price labeling (Budget/Mid-Range/Premium/Luxury)
- **Window Function** — `COUNT(*) * 100.0 / SUM(COUNT(*)) OVER()` for percentage
- **Subquery** — dishes priced above overall dataset average
- **REGEXP** — `WHERE category REGEXP "Biryani|Biriyani|Biryanis"`
- **String functions** — `UPPER()`, `LENGTH()`, `LEFT()`, `TRIM()`, `REPLACE()`
- Restaurant performance labeling using CASE WHEN on avg rating
- Weekend/Veg segmentation using `CONCAT(CASE...END, ' | ', food_type)`

---

## 📁 Project Structure

```
09_Swiggy-Analysis/
│
├── README.md                    ← You are here
│
├── data/
│   ├── Swiggy.csv               ← Raw Swiggy dataset
│   └── README.md
│
├── sql/
│   ├── Swiggy_Analysis.sql      ← Complete SQL file — all queries
│   └── README.md
│
└── screenshots/
    ├── SW1.png                  ← DB setup + basic SELECT
    ├── SW2.png                  ← EDA output — counts and KPIs
    ├── SW3.png                  ← Null check + price + rating stats
    ├── SW4.png                  ← Filtering queries + outputs
    ├── SW5.png                  ← Aggregation + time analysis
    └── SW6.png                  ← Advanced — CASE WHEN, window, subquery
```

---

## 📂 Dataset

| Property | Value |
|----------|-------|
| **Source** | Swiggy Food Orders Dataset |
| **Table** | `swiggy` (MySQL) |
| **Total Rows** | 1,97,430 |
| **Key Fields** | restaurant name, dish name, city, state, food type, category, price (INR), rating, rating count, order date, week_no, quarter, day, location |

---

## 👤 Author

**Piyush Dave**  
Data Analyst | SQL · Power BI · Tableau · Excel · Python

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/piyush-dave-0980a03a8)
[![Tableau](https://img.shields.io/badge/Tableau-Public-orange?logo=tableau)](https://public.tableau.com/app/profile/piyushdave/vizzes)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-black?logo=github)](https://github.com/PiyushDave30)
