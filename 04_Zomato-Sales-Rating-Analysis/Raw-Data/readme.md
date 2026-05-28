# 📂 Raw Data — Zomato Sales & Rating Analysis

This folder contains the original Zomato restaurant dataset used for this project.

---

## 📄 Files in This Folder

| File Name | Description |
|-----------|-------------|
| `restaurant_data_cl.xlsx` | Main Zomato restaurant dataset — 9,551 records |


---

## 📊 Dataset Details

| Property | Value |
|----------|-------|
| **Source** | Zomato Public Restaurant Dataset |
| **Table Name** | `zomato` (MySQL) |
| **Total Records** | 9,551 restaurants |
| **Countries** | 15 (India, USA, UK, UAE, Australia, Canada, Brazil, Singapore, Sri Lanka, Qatar, Philippines, NZ, Turkey, Indonesia, South Africa) |
| **Cities** | 141 unique cities |
| **Cuisines** | 1,826 unique cuisine combinations |

---

## 🔑 Key Fields

| Field | Description |
|-------|-------------|
| `RestaurantID` | Unique restaurant identifier |
| `City` | City where restaurant is located |
| `Cuisines` | Type(s) of cuisine served |
| `Average_Cost_for_two` | Avg bill for 2 people (local currency) |
| `Has_Online_Delivery` | Yes / No |
| `Has_Table_Booking` | Yes / No |
| `Rating` | Aggregate rating (0–5) |
| `Votes` | Total customer votes |
| `Price_range` | 1 (Cheap) to 4 (Luxury) |
| `CountryCode` | Numeric country code |
| `Is_delivering_now` | Current delivery status |

---

## ⚠️ Note
- Raw data kept in original form — no modifications
- All analysis done in SQL and Tableau
