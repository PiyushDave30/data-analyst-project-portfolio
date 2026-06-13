# Raw Data — Blinkit Sales Performance Dashboard

This folder contains the original Blinkit grocery sales dataset used for this project.

---

## Files in This Folder

| File Name | Description |
|-----------|-------------|
| BlinkIT Grocery Data.xlsx | Dataset for analysis |

---

## Dataset Details

| Property | Value |
|----------|-------|
| **Source** | BlinkIT Grocery Sales Dataset |
| **Total Outlets** | 10 |
| **Total Item Types** | 16 |
| **Key Metrics** | Sales, Rating, Item Fat Content, Outlet Type, Outlet Size, Location Tier |

---

## Key Fields

| Field | Description |
|-------|-------------|
| **`Item Type`** | Product category (Fruits & Veg, Snack Foods, Household, etc.) |
| **`Item Fat Content`** | Low Fat / Regular |
| **`Item Visibility`** | Product visibility score in outlet |
| **`Outlet Type`** | Supermarket Type 1/2/3 or Grocery Store |
| **`Outlet Size`** | High / Medium / Small |
| **`Outlet Location Type`** | Tier 1 / Tier 2 / Tier 3 |
| **`Outlet Establishment Year`** | Year outlet was set up (2012–2022) |
| **`Sales`** | Total sales amount |
| **`Rating`** | Customer satisfaction rating |

---

##  Data Cleaning (done in Excel)
- Removed blank/null rows in key columns
- Standardized `Item Fat Content` — merged "LF", "low fat" → "Low Fat" and "reg" → "Regular"
- Formatted numeric columns for correct data types
- Removed duplicate entries
- Verified outlet count and item type categories
