# Amravati AQI 2024 Analysis  
 
![Dashboard Preview](Screenshots/AQI.png)

> **Self-Made Project** | Original Data Collection  
> An end-to-end air quality analysis of Amravati city for the year 2024 — raw AQI data collected directly from the official CPCB government website, cleaned using Python in Jupyter Notebook, exported to Excel, and visualized in a Power BI dashboard.

---

## Project Overview

This project is unique because the data was **personally collected from India's official air quality monitoring authority (CPCB)** — not from Kaggle or any third-party source. Daily AQI readings for Amravati city throughout 2024 were downloaded, cleaned using Python, and then built into a comprehensive Power BI dashboard.
 
**Key questions answered:**
- What is the overall air quality of Amravati in 2024?
- Which months and quarters have the worst air pollution?
- How many days were clean vs polluted throughout the year?
- What is the day-wise AQI trend across the month?
- Which AQI category dominates — Good, Satisfactory, Moderate, or Poor?

---

## Tools & Workflow

```
CPCB Website → Raw AQI Excel → Python Jupyter Notebook → Cleaned Excel → Power BI Dashboard
```

| Step | Tool | Task |
|------|------|------|
| **1. Data Collection** | CPCB Official Website | Downloaded daily AQI data for Amravati 2024 |
| **2. Data Cleaning** | Python — Pandas, NumPy (Jupyter Notebook) | Handled nulls with mean imputation, fixed data types, removed invalid rows |
| **3. Export** | Python → Excel | Cleaned DataFrame exported to `AQI_Cleaned_Final.xlsx` |
| **4. Dashboard** | Power BI | Interactive AQI dashboard with month/category filters |

---

## Notebook — What Was Done

| Step | Code | Result |
|------|------|--------|
| Import Libraries | pandas, numpy, matplotlib, seaborn | Ready for analysis |
| Load Data | `pd.read_excel(...)` | 41 rows × 13 columns loaded |
| Basic Understanding | `head()`, `tail()`, `info()`, `describe()`, `shape` | Found NaN rows + object dtype in Day column |
| Check Nulls | `AQI.isnull().sum()` | Jan:6, Feb:9, Mar:7 ... Sep:8 nulls found |
| Fill Nulls | `AQI.fillna(AQI.mean(numeric_only=True))` | All month columns → 0 nulls ✅ |
| Fix Data Type | `pd.to_numeric(AQI['Day'], errors='coerce')` | Day: object → float64 |
| Remove Invalid Rows | `AQI.dropna(subset=['Day'])` | 41 rows → **31 valid rows** ✅ |
| Export | `to_excel('AQI_Cleaned_Final.xlsx')` | Clean file ready for Power BI |

---

## Dashboard

### Power BI — Air Quality Index (AQI) Analysis – Amravati 2024
![AQI Dashboard](Screenshots/AQI.png)

---

## Key Insights

### Overall AQI Summary
| Metric | Value |
|--------|-------|
| Total Days Analyzed | 366 (full year 2024) |
| Average AQI | 85.86 |
| Maximum AQI | 205 |
| Minimum AQI | 16 |
| Clean Days | 228 (62.3%) |
| Polluted Days | 138 (37.7%) |

### AQI Category Breakdown
| Category | Days | Percentage |
|----------|------|------------|
| Moderate | 136 | 37.16% |
| Satisfactory | 126 | 34.43% |
| Good | 102 | 27.87% |
| Poor | 2 | 0.55% |

### Quarterly Trend
| Quarter | Avg AQI | Observation |
|---------|---------|-------------|
| Q1 (Jan–Mar) | 125.62 | Worst — winter pollution |
| Q2 (Apr–Jun) | 78.55 | Improving — pre-monsoon |
| Q3 (Jul–Sep) | 38.95 | Best — monsoon cleans the air |
| Q4 (Oct–Dec) | 100.66 | Rising again — winter onset |

### Monthly AQI
| Month | Avg AQI | Category |
|-------|---------|----------|
| January | 142.16 | Worst |
| February | 118.34 | Moderate |
| March | 115.87 | Moderate |
| April | 87.03 | Satisfactory |
| May | 96.29 | Satisfactory |
| June | 51.73 | Satisfactory |
| July | 33.52 | Best |
| August | 36.48 | Good |
| September | 47.10 | Good |
| October | 81.65 | Satisfactory |
| November | 119.90 | Moderate |
| December | 101.06 | Moderate |

### Key Findings
- Winter months (Jan, Feb, Nov, Dec) consistently show worst AQI
- Monsoon months (Jul, Aug, Sep) are the cleanest — rain washes pollutants
- 62.3% of the year had clean air — but 37.7% polluted days still a health concern
- Only 2 days recorded "Poor" AQI — extreme pollution was rare in 2024

---

## Project Structure

```
08_Amravati-AQI-2024-Analysis/
│
├── README.md                                              ← You are here
│
├── data/
│   ├── AQI_daily_city_level_amravati_2024_amravati_2024.xlsx  ← Raw CPCB data
│   ├── AQI_Cleaned_Final.xlsx                            ← Python cleaned output
│   └── README.md
│
├── notebooks/
│   ├── AQI_AMT_Maharastra_PY.ipynb                       ← Jupyter Notebook
│   └── README.md
│
├── powerbi/
│   ├── Amravati_AQI_2024.pbix                            ← Power BI dashboard
│   └── README.md
│
└── Screenshots/
    ├── AQI.png                                           ← Power BI dashboard screenshot
    ├── Amravati_2024_AQI_Analysis.pdf                    ← Dashboard PDF export
    ├── AQI1.png                  ← Notebook: Data Cleaning
    ├── AQI2.png                  ← Notebook: Import + Dataset
    ├── AQI3.png                 ← Notebook: info + describe
    └── AQI4.png                  ← Notebook: Data type + Remove rows
```

---

## Data Source

| Detail | Info |
|--------|------|
| **Official Source** | Central Pollution Control Board (CPCB), Government of India |
| **Repository** | [CPCB AQI Repository](https://airquality.cpcb.gov.in/ccr/#/caaqm-dashboard-all/caaqm-landing/aqi-repository) |
| **City** | Amravati, Maharashtra |
| **Year** | 2024 (366 days — leap year) |

---

## Author

**Piyush Dave**  
Data Analyst | SQL · Power BI · Tableau · Excel · Python

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/piyush-dave-0980a03a8)
[![Tableau](https://img.shields.io/badge/Tableau-Public-orange?logo=tableau)](https://public.tableau.com/app/profile/piyushdave/vizzes)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-black?logo=github)](https://github.com/PiyushDave30)

---

> *Data collected directly from India's official CPCB air quality monitoring platform — not from any third-party dataset source.*
