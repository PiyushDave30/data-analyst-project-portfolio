# 🖼️ Screenshots — Zomato Sales & Rating Analysis

This folder contains all Tableau dashboard and SQL query screenshots for the Zomato project.

---

## 📄 Files in This Folder

### Tableau Dashboard Screenshots (3 pages)
| File Name | Page | Content |
|-----------|------|---------|
| [Z_1](Z_1.png) | Page 1 — Executive Overview | 6 KPIs, Country Performance bar, Country Table (15 countries), Top 5 Countries bar, Key Business Insights, City filter |
| [Z_2](Z-2.png) | Page 2 — Customer Experience | Table Booking impact (3.5 vs 2.8), Online Delivery donut (25.66%), Rating Distribution bar, Popular Cuisines lollipop (North Indian Mughlai 53,747 votes) |
| [Z_3](Z_3.png) | Page 3 — Cuisine & Pricing | Top 10 Cuisines lollipop (North Indian 936), Price Range distribution, Avg Rating by Price (Luxury 3.84), Ratings across cuisines |

### SQL Query Screenshots
| File Name | Content |
|-----------|---------|
| [Z1](Z1.png) | Advanced Stored Procedure `Method(col_name VARCHAR)` — dynamic PREPARE/EXECUTE/DEALLOCATE |
| [Z2](Z2.png) | KPI VIEW creation + `SELECT * FROM KPI` output — 9551 restaurants, 15 countries, 141 cities |
| [Z3](Z3.png) | Delivery/Booking Trend — table booking cost comparison (Yes:1536 vs No:1153) |
| [Z4](Z4.png) | Cuisine Analysis + Customer Behaviour (highest votes, underrated restaurants) |
| [Z5](Z5.png) | City Analysis + Revenue Analysis (price range, value for money) |
| [Z6](Z6.png) | DENSE_RANK window function, restaurant segmentation CASE WHEN, Services section |

---

## 📌 Quick Reference — Key Numbers

### Tableau Dashboard
| Metric | Value |
|--------|-------|
| Total Restaurants | 9,551 |
| Total Countries | 15 |
| Total Cities | 141 |
| Total Cuisines | 1,825 |
| Average Rating | 2.9 |
| Avg Cost for Two | ₹1,199 |
| Total Votes | 14,98,645 |
| Online Delivery | 25.66% (2,451) |
| Table Booking | 12.12% (1,158) |
| With Table Booking Rating | 3.5 |
| Without Table Booking Rating | 2.8 |
| Top Country | India (8,652 restaurants, 11,87,163 votes) |
| Top Cuisine | North Indian (936 restaurants) |
| Most Engaging Cuisine | North Indian Mughlai (53,747 votes) |
| Most Common Price Range | Cheap (4,444 restaurants) |
| Highest Rated Price Range | Luxury (3.84 avg rating) |
| Avg Votes per Restaurant | 157 |
| High Rated Restaurants | 1,380 |

### SQL Analysis
| Metric | Value |
|--------|-------|
| Table Booking Avg Bill | ₹1,536 (vs ₹1,153 without) |
| Online Delivery % | 2,451 (25.66%) |
| Top City by Price | Panaji, Goa (₹306 avg) |
| 2nd City by Price | Lucknow (₹305 avg) |
