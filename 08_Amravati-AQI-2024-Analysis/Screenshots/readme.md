# Screenshots — Amravati AQI 2024 Analysis

This folder contains all screenshots — Power BI dashboard, PDF export, and Jupyter Notebook screenshots.
 
---

## Files in This Folder

### Dashboard Screenshots
| File Name | Content |
|-----------|---------|
| [AQI Dashboard PowerBI](AQI.png) | Complete Power BI dashboard — all KPIs, charts, filters |


### Jupyter Notebook Screenshots
| File Name | Section | Content |
|-----------|---------|---------|
| [AQI2](AQI2) | Import Libraries + Importing Dataset + Basic Data Understanding | Libraries imported (pandas, numpy, matplotlib, seaborn), `pd.read_excel()` loading raw file, `head()` showing Day 1–3 with actual AQI values, `tail()` showing invalid rows (Very poor, Severe, NaN) |
| [AQI1](AQI1) | Data Cleaning | `isnull().sum()` before — nulls found (Jan:6, Feb:9, Sep:8 etc), `fillna(mean)` applied, `isnull().sum()` after — all months show 0 ✅ |
| [AQI3](AQI3) | Basic Data Understanding  | `info()` — 41 entries, 13 columns, Day=object, months=float64, `describe()` — mean/std/min per month, `shape` — (41, 13) |
| [AQI4](AQI4) | Checking Data Type + Remove Invalid Rows | `pd.to_numeric(errors='coerce')` — Day: object→float64, `info()` confirms 41 non-null per month, `dropna(subset=['Day'])` — shape: 41→**(31, 13)** |

---

## Quick Reference — Key Numbers

| Metric | Value |
|--------|-------|
| Total Days | 366 (leap year 2024) |
| Average AQI | 85.86 |
| Max AQI | 205 |
| Min AQI | 16 |
| Clean Days | 228 (62.3%) |
| Polluted Days | 138 (37.7%) |
| Worst Month | January (142.16) |
| Best Month | July (33.52) |
| Worst Quarter | Q1 (125.62) |
| Best Quarter | Q3 — Monsoon (38.95) |
| Raw Data Shape | (41, 13) |
| Cleaned Data Shape | (31, 13) |
| Nulls Before Cleaning | 6–9 per month column |
| Nulls After Cleaning | 0 |

---

## Data Source
[CPCB Official AQI Repository](https://airquality.cpcb.gov.in/ccr/#/caaqm-dashboard-all/caaqm-landing/aqi-repository)
