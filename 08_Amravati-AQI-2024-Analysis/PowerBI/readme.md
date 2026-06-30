# Power BI Dashboard — Amravati AQI 2024 Analysis

This folder contains the Power BI dashboard built after Python cleaning for the Amravati AQI project.

---

## Files in This Folder

| File Name | Description | 
|-----------|-------------|
| [Amravati 2024 AQI PowerBI](Amravati_2024_AQI+Analysis.pbix) | Power BI dashboard file |
| [Dashboard Image](AQI.png) | Screenshot of the complete dashboard |
| [PDF File](Amravati_2024_AQI+Analysis.pdf) | PDF file of complete dashboard |

---

## Dashboard Overview

Dashboard titled **"Air Quality Index (AQI) Analysis – Amravati 2024"**:

### KPI Cards (Left Panel)
| KPI | Value |
|-----|-------|
| **Total Days** | 366 |
| **Average AQI** | 85.86 |
| **Max AQI** | 205 |
| **Min AQI** | 16 |
| **Polluted Days** | 138 |
| **Clean Days** | 228 |

### Filters / Slicers
- **Month slicer** — January to December (all 12 months)
- **AQI Category slicer** — Good / Moderate / Poor / Satisfactory

### Visuals
| Visual | Description |
|--------|-------------|
| **AQI Category Pie Chart** | Moderate 37.16% (136) \| Satisfactory 34.43% (126) \| Good 27.87% (102) \| Poor 0.55% (2) |
| **Clean vs Polluted Donut** | Clean 62.3% (228 days) vs Polluted 37.7% (138 days) |
| **Avg AQI by Quarter** | Line chart — Q1 (125.62) → Q2 (78.55) → Q3 (38.95) → Q4 (100.66) |
| **Avg AQI by Month** | Horizontal bar — January worst (142.16), July best (33.52) |
| **Avg AQI by Day** | Area line chart — day-wise fluctuation within selected month |

---

## Power BI Features Used
- KPI card visuals for key metrics
- Month and category slicers for interactivity
- Pie chart and donut chart for category distribution
- Line chart for quarterly trend
- Horizontal bar chart for monthly comparison
- Area line chart for daily AQI pattern
- Data imported from Python-cleaned Excel file

---

## 🔗 How to Open
1. Download `Amravati_AQI_2024.pbix`
2. Open with **Microsoft Power BI Desktop**
3. Data is embedded from the cleaned Excel — no live connection needed
