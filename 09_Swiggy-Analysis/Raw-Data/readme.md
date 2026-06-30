# Data — Swiggy Food Orders Analysis

This folder contains the raw Swiggy dataset used for this project.

--- 

## Files in This Folder

| File Name | Description |
|-----------|-------------|
| `Swiggy.csv` | Raw Swiggy food orders dataset — 1,97,430 rows |

---

## Dataset Details

| Property | Value |
|----------|-------|
| **Source** | Swiggy Food Orders Dataset |
| **Total Rows** | 1,97,430 |
| **Total Columns** | 14 |
| **Null Values** | Zero — all 14 columns are clean |
| **Cities** | 28 |
| **Restaurants** | 993 |
| **Unique Dishes** | 59,064 |

---

## Key Fields

| Column | Description |
|--------|-------------|
| `restaurant name` | Name of the restaurant |
| `dish name` | Name of the dish |
| `city` | City of the restaurant |
| `state` | State of the restaurant |
| `location` | Area/locality within city |
| `category` | Food category (Biryani, Pizza, etc.) |
| `food type` | Veg / Non-Veg |
| `price (INR)` | Dish price in Indian Rupees |
| `rating` | Average dish rating |
| `rating count` | Number of customer ratings |
| `order date` | Date of order |
| `week_no` | Week number of the year |
| `quarter` | Q1 / Q2 / Q3 |
| `day` | Day of week (Mon–Sun) |

---

## Data Quality Notes
- Zero nulls across all 14 columns — confirmed via NULL check query
- Hidden **whitespace** found in `category` column — silently inflates category counts in GROUP BY
- **Biryani spelling variants** exist: Biryani, Biriyani, Biryanis — standardization needed before category-level analysis
- Items priced below ₹10 exist (sauces, condiments) — valid data but outlier-level entries
- Price outliers (₹2000+) represent bulk/party/catering orders — not standard menu items
