# Power BI Dashboard — Amravati AQI 2024 Analysis

This folder contains the Power BI dashboard built after Python cleaning for the Amravati AQI project.

---

## Files in This Folder

| File Name | Description | 
|-----------|-------------|
| [Amravati 2024 AQI PowerBI](Amravati_2024_AQI_Analysis.pbix) | Power BI dashboard file (3 pages: Home, Dashboard, Conclusion) |
| [Dashboard Image](AQI.png) | Screenshot of the complete dashboard |
| [Home Page Image](Home.png) | Screenshot of the Home page |
| [Dashboard Page Image](DB.png) | Screenshot of the Dashboard page |
| [Conclusion Page Image](Conclusion.png) | Screenshot of the Conclusion page |
| [PDF File](Amravati_2024_AQI_Analysis.pdf) | PDF file of complete dashboard (3 pages) |

---

## Dashboard Overview

Dashboard titled **"Air Quality Index (AQI) Analysis – Amravati 2024"**, built as 3 pages with navigation buttons (Home, Dashboard, Conclusion):

### Dashboard Pages
| Page | Content |
|------|---------|
| **Home** | Project title, 62.3% clean-days donut, AQI scale (Good to Very Poor), key stats (Average 85.86, Max 205, Min 16), author links, and navigation buttons |
| **Dashboard** | KPI cards, month slicer, pie chart, donut chart, monthly bar chart, and daily AQI line chart |
| **Conclusion** | Quarter average cards, key findings, recommendations, and bottom line |

### KPI Cards (Top Row — Dashboard Page)
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
- **AQI Category filter** — click any slice in the pie chart (Good / Moderate / Poor / Satisfactory) to filter the page

### Visuals (Dashboard Page)
| Visual | Description |
|--------|-------------|
| **AQI Category Pie Chart** | Days by AQI Category — Moderate 37.16% (136) \| Satisfactory 34.43% (126) \| Good 27.87% (102) \| Poor 0.55% (2) |
| **Clean vs Polluted Donut** | Clean 62.3% (228 days) vs Polluted 37.7% (138 days), with a leaf icon in the center |
| **Avg AQI by Month** | Horizontal bar in Jan–Dec order, colored by level (red above 100, amber 50–100, green below 50) — January worst (142.16), July best (33.52) |
| **Daily AQI Across 2024** | Area line chart of all 366 days with a red dashed line at AQI 100 (polluted above 100) |
| **Insight & Conclusion Strips** | "Nov-Mar peaks, monsoon cleans the air" and "62.3% of days were clean" |

### Conclusion Page
| Item | Description |
|------|-------------|
| **Avg AQI by Quarter** | Four cards — Q1 (125.62) → Q2 (78.55) → Q3 (38.95) → Q4 (100.66), colored by level |
| **Key Findings** | 62.3% of days clean, Nov–Mar all above 100 AQI, Jun–Sep under 52, only 2 days reached Poor |
| **Recommendations** | Prioritize Nov–Mar, extend to multiple years, add a second city, add weather and pollution-source data, and note the limitation of one year of data from one city |
| **Bottom Line** | Pollution peaks Nov–Mar and clears in the monsoon, so Nov–Mar is the window to act on |

---

## Power BI Features Used
- KPI card visuals for key metrics
- Month slicer for interactivity
- Pie chart and donut chart for category distribution
- Horizontal bar chart for monthly comparison, with red / amber / green color rules
- Area line chart for daily AQI pattern, with a constant line at AQI 100
- Quarter average cards on the Conclusion page
- Custom page backgrounds and page navigation buttons (Home, Dashboard, Conclusion)
- Web URL buttons for LinkedIn and GitHub
- Data imported from Python-cleaned Excel file

---

## 🔗 How to Open
1. Download `Amravati_2024_AQI+Analysis.pbix`
2. Open with **Microsoft Power BI Desktop**
3. Data is embedded from the cleaned Excel — no live connection needed
4. Use the **Home**, **Dashboard** and **Conclusion** buttons at the top to move between pages (Ctrl + click in Power BI Desktop)
