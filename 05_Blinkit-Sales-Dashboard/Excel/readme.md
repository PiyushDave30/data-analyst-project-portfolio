# Excel — Blinkit Sales Performance Dashboard

This folder contains the Excel file used for data cleaning and preparation before loading into Power BI.

---
 
## Files in This Folder

| File Name | Description |
|-----------|-------------|
| `BlinkIT Grocery Data.xlsx` | Fully cleaned dataset ready for Power BI import |

---

## Data Cleaning Steps Performed in Excel

| Step | Action |
|------|--------|
| **Null handling** | Identified and removed rows with missing Sales or Item Type values |
| **Fat Content standardization** | "LF" / "low fat" → "Low Fat" \| "reg" → "Regular" — ensured only 2 categories |
| **Column formatting** | Sales column formatted as number, Year as integer, Rating as decimal |
| **Duplicate removal** | Checked and removed duplicate outlet-item combinations |
| **Category validation** | Verified all 16 item types are correctly labeled |
| **Outlet verification** | Confirmed 10 unique outlets across Tier 1, 2, 3 locations |

---

## Why Excel First?
Raw data often contains inconsistencies that cause wrong results in Power BI.  
Cleaning in Excel first ensures that all DAX measures and visuals in Power BI reflect accurate, trustworthy data.

---

## Next Step
After cleaning in Excel, the data was imported into **Power BI** where the full 5-page dashboard was built.  
See the `powerbi/` folder for the dashboard file.
