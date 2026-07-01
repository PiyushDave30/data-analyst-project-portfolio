# 📂 Data — BMW Sales Analytics

This folder contains the BMW sales dataset used for this project.

---

## 📄 Files in This Folder

| File Name | Description |
|-----------|-------------|
| [BMW Sales Dataset](bmw_sales_dataset.xlsx) | BMW sales dataset — 200 records, 6 columns |

---

## 📊 Dataset Details

| Property | Value |
|----------|-------|
| **Source** | BMW Sales Dataset |
| **Total Records** | 200 |
| **Total Columns** | 6 |
| **Models** | 6 (BMW X1, X3, X5, 3 Series, 5 Series, 7 Series) |
| **Regions** | 4 (North, South, East, West) |

---

## 🔑 Columns

| Column | Type | Description |
|--------|------|-------------|
| `Model` | Text | BMW model name |
| `Region` | Text | Sales region — North/South/East/West |
| `Units Sold` | Number | Number of cars sold in this record (1–19) |
| `Price` | Number | Price per car in USD ($30,009–$89,581) |
| `Cost` | Number | Cost per car in USD |
| `Profit` | Number | Already calculated = (Price − Cost) × Units Sold |

---

## 🧮 Key Derived Metrics (Calculated in Tableau)

| Metric | Formula |
|--------|---------|
| Revenue | Price × Units Sold |
| Total Cost | Cost × Units Sold |
| Profit Margin % | Profit / Revenue × 100 |

---

## 📌 Key Dataset Facts

| Fact | Value |
|------|-------|
| Total Revenue | $117,285,097 |
| Total Profit | $32,878,154 |
| Total Units | 1,974 |
| Avg Price | $59,361 |
| Profit Margin | 28.03% |
| Price Range | $30,009 – $89,581 |
| Units Range | 1 – 19 per record |
| Top Model Units | BMW X3 (421) |
| Top Region Units | North (560) |
