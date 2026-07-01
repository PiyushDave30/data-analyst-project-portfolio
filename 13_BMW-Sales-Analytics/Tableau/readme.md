# 📈 Tableau Dashboard — BMW Sales Analytics

This folder contains the Tableau dashboard for the BMW Sales Analytics project.

---

## 📄 Files in This Folder

| File Name | Description |
|-----------|-------------|
| [BMW Sales Analysis Tableau](BMW%20Analysis.twbx) | Tableau 7 Page Dashboard |

---

## 🌐 Live Dashboard

👉 **[Click here to view the live BMW Sales Dashboard](https://public.tableau.com/app/profile/piyushdave/viz/BMWSalesAnalytics_17828850435440/HOME)**

---

## 📋 Dashboard Pages — Complete Details

### Page 1 — Landing / Home
- BMW 4-quadrant logo (blue/white)
- 6 navigation cards with click-to-navigate buttons
- Data summary footer
- No charts — navigation only

### Page 2 — Executive Overview
**KPIs:** Total Revenue ($117.28M) | Total Units (1,974) | Total Profit ($32.88M) | Avg Price ($59,361) | Profit Margin (28.03%)

**Filters:** Model (dropdown) | Region (dropdown) | Price Range (list)

| Visual | Type | Details |
|--------|------|---------|
| Revenue by Model | Bar | BMW X3 leads at $25.27M |
| Revenue by Region | Horizontal Bar | North leads at $33.76M |
| Sales Trend | Stacked Bar | Model × Region breakdown |

### Page 3 — Model Analysis
**KPIs:** Top Model (BMW X3) | Units X3 (421) | Units X1 (385) | Avg Price ($59,361) | Top Profit Model (BMW X3 $7.2M)

**Filters:** Model (list) | Region (dropdown) | Price Range (list)

| Visual | Type | Details |
|--------|------|---------|
| Units Sold by Model | Lollipop | X3 421, X1 385, 7 Series 364 |
| Revenue by Model | Bar (BMW Blue) | X3 $25.27M leads |
| Profit by Model | Bar (Green) | X3 $7.16M leads |
| Avg Price by Model | Horizontal Bar | 7 Series $62,533 highest |

### Page 4 — Region Analysis
**KPIs:** Top Region (North) | North (560) | South (474) | East (458) | West (482)

**Filters:** Region (list) | Model (dropdown) | Unit Range (list)

| Visual | Type | Details |
|--------|------|---------|
| Units by Region | Lollipop | North 560, West 482, South 474, East 458 |
| Revenue by Region | Horizontal Bar (BMW Blue) | North $33.76M |
| Model × Region | Cross-tab Table | 6×4 matrix with units |
| Profit by Region | Horizontal Bar (Green) | North $9.00M |

### Page 5 — Revenue & Profit
**KPIs:** Top Revenue (BMW X3) | Total Cost ($84.41M) | Total Profit ($32.88M) | Profit Margin (28.03%) | Avg Profit/Record ($164,391)

**Filters:** Model (dropdown) | Region (dropdown) | Profit Tier (list)

| Visual | Type | Details |
|--------|------|---------|
| Revenue vs Profit by Model | Grouped Bar | Blue=Revenue, Teal=Profit |
| Profit Margin by Model | Horizontal Bar (Green) | BMW X1 30.02% highest |
| Revenue vs Cost | Grouped Bar | Blue=Revenue, Light Blue=Cost |
| Profit Distribution | Treemap | Model × Region profit breakdown |

### Page 6 — Time Analysis
**KPIs:** Total Records (200) | Peak Units (19) | Min Units (1) | Avg Units (9.87) | Price Range ($30,009–$89,581)

**Filters:** Model (list) | Region (dropdown) | Unit Range (list)

| Visual | Type | Details |
|--------|------|---------|
| Price Distribution | Stacked Histogram | Bins of $5K, colored by model |
| Units Sold Distribution | Stacked Histogram | Bins of 2, colored by model |
| Profit vs Units Sold | Scatter Plot | 200 dots, colored by model, trend lines per model |

### Page 7 — Quick Analysis
**Parameters:** Select Metric (5 options) | Select Dimension (5 options)

**Filters:** Region (dropdown)

| Visual | Type | Details |
|--------|------|---------|
| Dynamic Chart | Bar | Updates on metric + dimension selection |
| Selected Metric KPI | Big Number | Shows total of selected metric |
| Distribution Breakdown | Donut | Updates with dimension selection |

---

## 🛠️ Tableau Features Used
- **Parameters** — Select Metric + Select Dimension for Quick Analysis
- **Calculated Fields** — Revenue, Total Cost, Profit Margin %, Price Range, Unit Range, Profit Tier, Selected Metric Value, Selected Dimension
- **Lollipop Charts** — Dual axis (Circle + Bar) for Units by Model and Region
- **Stacked Histograms** — Bins created on Price and Units Sold
- **Scatter Plot** — Disaggregated with trend lines per model
- **Cross-tab Table** — Model × Region units matrix
- **Treemap** — Profit distribution by Model × Region
- **Page Navigation** — Dashboard actions linking all 7 pages
- **Custom Background** — PowerPoint PNG applied as wallpaper on all pages
- **Dashboard Size** — Fixed 1668 × 861 pixels
