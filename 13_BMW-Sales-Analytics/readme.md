# BMW Sales Analytics Dashboard 🚗

![Landing Page](Screenshots/1.%20Home.png)

> **Self-Made Project** | Project 13  
> A 7-page professional Tableau dashboard analyzing BMW car sales across 6 models and 4 regions — built on a custom PowerPoint-designed background with a premium BMW dark blue theme. Covers 200 sales records, 1,974 units sold, and $117.28M total revenue.

---

## 📌 Project Overview

This project analyzes BMW automobile sales data to uncover performance patterns across models, regions, revenue, and profitability. The dashboard features a fully custom-designed background built in PowerPoint, a branded landing/navigation page, and a **Quick Analysis** page with dynamic metric × dimension selectors — making it one of the most interactive dashboards in this portfolio.

**Key business questions answered:**
- Which BMW model generates the most revenue and profit?
- How do 4 regions compare in sales volume and profitability?
- Which model has the highest profit margin?
- What is the relationship between units sold and profit?
- How are prices and unit volumes distributed across the dataset?

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| **Tableau Desktop** | 7-page interactive dashboard with parameters, calculated fields, lollipop charts, scatter plots, heatmaps |
| **PowerPoint** | Custom background design for all 7 pages — Premium BMW Dark Blue theme |

---

## 📊 Dashboard Pages — All 7

### Page 1 — Landing / Home
![Home](Screenshots/1.%20Home.png)
- BMW logo + branding
- 6 navigation cards — one per analysis page
- Data summary: 6 Models | 4 Regions | 200 Records
- Key stats: Units 1,974 | Revenue $117.28M | Profit $32.87M
- Click-to-navigate buttons for each page

### Page 2 — Executive Overview
![Overview](Screenshots/2.%20Overview.png)
- 5 KPIs: Total Revenue, Total Units, Total Profit, Avg Price, Profit Margin %
- Revenue by Model — bar chart
- Revenue by Region — horizontal bar chart
- Sales Trend — stacked bar by Model × Region
- Filters: Model, Region, Price Range

### Page 3 — Model Analysis
![Model](Screenshots/3.%20Model.png)
- 5 KPIs: Top Model, Units X3, Units X1, Avg Price, Top Profit Model
- Units Sold by Model — **lollipop chart**
- Revenue by Model — bar chart
- Profit by Model — **green bar chart**
- Avg Price by Model — horizontal bar chart

### Page 4 — Region Analysis
![Region](Screenshots/4.%20Region.png)
- 5 KPIs: Top Region, North Units, South Units, East Units, West Units
- Units by Region — **lollipop chart**
- Revenue by Region — horizontal bar chart
- Model × Region Breakdown — **cross-tab table**
- Profit by Region — horizontal green bar chart

### Page 5 — Revenue & Profit
![Revenue](Screenshots/5.%20Revenue%20&%20Profit.png)
- 5 KPIs: Top Revenue Model, Total Cost, Total Profit, Profit Margin %, Avg Profit/Record
- Revenue vs Profit by Model — grouped bar
- Profit Margin by Model — horizontal green bar
- Revenue vs Cost Comparison — grouped bar
- Profit Distribution — **Treemap by Model × Region**

### Page 6 — Time Analysis
![Time](Screenshots/6.%20Time%20Analysis.png)
- 5 KPIs: Total Records, Peak Units, Min Units, Avg Units, Price Range
- Price Distribution by Model — **stacked histogram**
- Units Sold Distribution — **stacked histogram**
- Profit vs Units Sold — **scatter plot with trend lines**

### Page 7 — Quick Analysis
![Quick](Screenshots/7.&20Quick%20Analysis.png)
- **Metric Selector** — 5 options: Total Revenue, Total Profit, Units Sold, Avg Price, Profit Margin %
- **Dimension Selector** — 5 options: Model, Region, Price Range, Unit Range, Profit Tier
- Dynamic bar chart — updates instantly on any selection
- Selected Metric KPI card
- Distribution donut — updates with dimension selection

---

## 🔑 Key Business Insights

### 📊 Overall KPIs
| Metric | Value |
|--------|-------|
| Total Revenue | $117,285,097 |
| Total Cost | $84,406,943 |
| Total Profit | $32,878,154 |
| Total Units Sold | 1,974 |
| Avg Price per Car | $59,361 |
| Profit Margin | 28.03% |
| Avg Profit per Record | $164,391 |
| Total Records | 200 |
| Total Models | 6 |
| Total Regions | 4 |

### 🚗 Model Performance
| Model | Units | Revenue | Profit | Margin | Avg Price |
|-------|-------|---------|--------|--------|-----------|
| BMW X3 | 421 | $25.27M | $7.16M | 28.34% | $60,951 |
| BMW 7 Series | 364 | $22.52M | $6.37M | 28.28% | $62,533 |
| BMW X1 | 385 | $22.51M | $6.76M | **30.02%** | $57,368 |
| BMW 3 Series | 355 | $21.37M | $5.89M | 27.55% | $59,800 |
| BMW 5 Series | 236 | $13.91M | $3.47M | 24.93% | $59,709 |
| BMW X5 | 213 | $11.71M | $3.24M | 27.64% | $54,580 |

- **BMW X3** leads in Revenue (21.53%) and Units Sold (421)
- **BMW X1** has the highest Profit Margin at **30.02%** — most efficient model
- **BMW 5 Series** has the lowest margin at 24.93% — needs pricing review
- **BMW 7 Series** commands the highest average price at $62,533

### 🗺️ Regional Performance
| Region | Units | Revenue | Profit |
|--------|-------|---------|--------|
| North | 560 | $33.76M | $9.00M |
| West | 482 | $30.49M | $8.33M |
| South | 474 | $27.57M | $8.07M |
| East | 458 | $25.46M | $7.48M |

- **North** leads all 4 regions in units, revenue, and profit
- **East** is the weakest region — expansion opportunity
- Regions are fairly balanced — no single region dominates overwhelmingly

### 🔝 Top 10 Records by Profit
| Rank | Model | Region | Units | Price | Profit |
|------|-------|--------|-------|-------|--------|
| 1 | BMW 7 Series | West | 19 | $85,766 | $640,571 |
| 2 | BMW X1 | South | 18 | $89,383 | $589,493 |
| 3 | BMW 7 Series | East | 16 | $82,796 | $529,035 |
| 4 | BMW X1 | East | 17 | $76,540 | $499,812 |
| 5 | BMW 7 Series | North | 17 | $72,675 | $482,195 |
| 6 | BMW X1 | North | 18 | $76,975 | $448,446 |
| 7 | BMW X3 | South | 13 | $87,010 | $443,564 |
| 8 | BMW X3 | West | 18 | $63,307 | $433,665 |
| 9 | BMW X3 | West | 16 | $89,150 | $407,925 |
| 10 | BMW X3 | South | 19 | $58,312 | $400,227 |

### 📈 Distribution Insights
- **Price Range:** $30,009 to $89,581 — spread evenly across all price buckets
- **Units Range:** 1 to 19 units per record — average 9.87
- **Profit vs Units:** Strong positive correlation — more units = more profit
- **Peak Units:** 19 (BMW 7 Series, West) generating $640,571 profit
- **Morning revenue** pattern not applicable — no time data in dataset

---

## 🧮 Calculated Fields Used

| Field Name | Formula |
|------------|---------|
| `Revenue` | `[Price] * [Units Sold]` |
| `Total Cost` | `[Cost] * [Units Sold]` |
| `Profit Margin %` | `SUM([Profit]) / SUM([Revenue]) * 100` |
| `Avg Revenue per Car` | `SUM([Revenue]) / SUM([Units Sold])` |
| `Price Range` | CASE WHEN — Budget/Mid-Range/Premium/Luxury |
| `Unit Range` | CASE WHEN — Low/Medium/High/Very High |
| `Profit Tier` | CASE WHEN — Low/Medium/High/Top |
| `Row Number` | `INDEX()` — for trend analysis |
| `Selected Metric Value` | Dynamic CF using Select Metric parameter |
| `Selected Dimension` | Dynamic CF using Select Dimension parameter |

---

## 📁 Project Structure

```
13_BMW-Sales-Analytics/
│
├── README.md                        ← You are here
│
├── data/
│   ├── bmw_sales_dataset.xlsx       ← Raw dataset — 200 records
│   └── README.md
│
├── tableau/
│   ├── tableau_link.txt             ← Tableau Public live link
│   └── README.md
│
├── background/
│   ├── BMW_Dashboard_Background_1668x861.pptx  ← Custom PPT backgrounds
│   └── README.md
│
└── Screenshots/
    ├── BMW_Home.png                 ← Page 1 — Landing/Navigation
    ├── BMW_Overview.png             ← Page 2 — Executive Overview
    ├── BMW_Model.png                ← Page 3 — Model Analysis
    ├── BMW_Region.png               ← Page 4 — Region Analysis
    ├── BMW_Revenue.png              ← Page 5 — Revenue & Profit
    ├── BMW_Time.png                 ← Page 6 — Time Analysis
    ├── BMW_Quick.png                ← Page 7 — Quick Analysis
    └── README.md
```

---

## 📂 Dataset

| Property | Value |
|----------|-------|
| **Source** | BMW Sales Dataset |
| **File** | `bmw_sales_dataset.xlsx` |
| **Records** | 200 |
| **Columns** | 6 (Model, Region, Units Sold, Price, Cost, Profit) |
| **Models** | BMW X1, BMW X3, BMW X5, BMW 3 Series, BMW 5 Series, BMW 7 Series |
| **Regions** | North, South, East, West |
| **Price Range** | $30,009 – $89,581 |
| **Units Range** | 1 – 19 per record |

---

## 🎨 Design Details

| Element | Detail |
|---------|--------|
| **Theme** | BMW Premium Dark Blue |
| **Background Tool** | Microsoft PowerPoint |
| **Dashboard Size** | 1668 × 861 pixels |
| **Primary Color** | BMW Blue `#1C69D3` |
| **Dark Background** | Navy `#0A1929` |
| **Profit Color** | Green `#2ECC71` |
| **Cost Color** | Red `#E74C3C` |
| **Text** | White `#FFFFFF` |
| **Sidebar** | Mid Blue `#0F3460` |

---

## 🌐 Live Dashboard

| Platform | Link |
|----------|------|
| Tableau Public | [View Live BMW Sales Dashboard](https://public.tableau.com/app/profile/piyushdave/viz/BMWSalesAnalytics_17828850435440/HOME) |

---

## 👤 Author

**Piyush Dave**
Data Analyst | SQL · Power BI · Tableau · Excel · Python

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/piyush-dave-0980a03a8)
[![Tableau](https://img.shields.io/badge/Tableau-Public-orange?logo=tableau)](https://public.tableau.com/app/profile/piyushdave/vizzes)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-black?logo=github)](https://github.com/PiyushDave30)
