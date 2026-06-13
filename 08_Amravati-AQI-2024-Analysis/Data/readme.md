# Data — Amravati AQI 2024 Analysis

This folder contains both the raw and cleaned AQI datasets for Amravati city 2024.

---

## Files in This Folder

| File Name | Type | Description |
|-----------|------|-------------|
| `AQI_daily_city_level_amravati_2024_amravati_2024.xlsx` | Raw | Original daily AQI data downloaded directly from CPCB website — unmodified |
| `AQI_Cleaned_Final.xlsx` | Cleaned | Processed and feature-engineered dataset exported from Python — used in Power BI |

---

## Data Source

| Detail | Value |
|--------|-------|
| **Authority** | Central Pollution Control Board (CPCB), Government of India |
| **Website** | [CPCB AQI Repository](https://airquality.cpcb.gov.in/ccr/#/caaqm-dashboard-all/caaqm-landing/aqi-repository) |
| **City** | Amravati, Maharashtra, India |
| **Period** | January 1, 2024 – December 31, 2024 |
| **Total Records** | 366 daily readings (2024 is a leap year) |

---

## Raw vs Cleaned — What Changed?

| What | Raw File | Cleaned File |
|------|----------|--------------|
| Date format | Inconsistent | Uniform datetime |
| Null values | Present | Removed |
| AQI_Category | Not present | Added (Good/Satisfactory/Moderate/Poor) |
| Clean_Polluted | Not present | Added (Clean ≤ 100 / Polluted > 100) |
| Month column | Not present | Extracted from date |
| Quarter column | Not present | Extracted from date |
| Day column | Not present | Extracted from date |

---

## Key Fields in Cleaned File

| Field | Description |
|-------|-------------|
| `Date` | Date of AQI reading |
| `AQI` | Daily Air Quality Index (16 to 205) |
| `AQI_Category` | Good / Satisfactory / Moderate / Poor |
| `Clean_Polluted` | Clean or Polluted flag |
| `Month` | Month name |
| `Quarter` | Q1 / Q2 / Q3 / Q4 |
| `Day` | Day number of the month |

---

## ⚠️ Note
- Raw file kept exactly as downloaded from CPCB — no manual edits
- All transformations done in `AQI_AMT_Maharastra_PY.ipynb` (see notebooks/ folder)
- Cleaned file `AQI_Cleaned_Final.xlsx` is the direct input to Power BI dashboard
