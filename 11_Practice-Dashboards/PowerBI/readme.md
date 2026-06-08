# 📊 Power BI — Financial Performance Dashboard

This folder contains the Power BI Finance dashboard for practice.

---

## 📄 Files in This Folder

| File Name | Description |
|-----------|-------------|
| [PBI Dashboard](Financial_Performance_Dashboard.pbix) | Power BI 2-page dashboard file |
| [Sales Performance](PBI_Finance1.png) | Screenshot — Sales Performance Overview |
| [Profit Performance](PBI_Finance2.png) | Screenshot — Profit Performance Overview |

---

## 📋 Dashboard Pages

### Page 1 — Sales Performance Overview
| Section | Details |
|---------|---------|
| **Toggle** | Sales (active) / Profit buttons |
| **KPIs** | Sales (118.73M), Gross Sales (1,27,932K), Profit (16,893.7K), Discount (9,205K) |
| **Filters** | Country dropdown (All) + Year checkboxes (2013/2014) |
| **Sum of Sales by Month** | Line — August low (5.9M) to October peak (21.7M) |
| **Sales by Product** | Bar — Paseo (33M), VTT (21M), Velo (18M), Amarilla (18M) |
| **Sales by Segment** | Horizontal bar — Government (53M), Small Business (42M), Enterprise (20M) |
| **Sales by Country** | Bar — USA (25.03M), Canada (24.89M), France (24.35M), Germany (23.51M), Mexico (20.95M) |

### Page 2 — Profit Performance Overview
| Section | Details |
|---------|---------|
| **Toggle** | Sales / Profit (active) buttons |
| **KPIs** | Same 4 KPIs |
| **Sum of Profit by Month** | Line — October peak (3.4M), November low (1.4M) |
| **Profit by Product** | Bar — Paseo (4.8M), VTT (3.0M), Amarilla (2.8M) |
| **Profit by Segment** | Horizontal bar — Government (11.39M), Small Business (4.14M), Enterprise (-0.61M loss) |
| **Profit by Country** | Bar — France (3.78M), Germany (3.68M), Canada (3.53M) |

---

## 🔑 Key Business Insights
- **Enterprise segment loses money (-0.61M)** — pricing or cost structure needs review
- **Government segment** is most valuable in both sales and profit
- **Paseo product** consistently leads in both sales and profit
- **France leads in profit** despite USA leading in sales — better margins in Europe
- **October is the best month** for both sales and profit

---

## 🛠️ Power BI Features Used
- Toggle buttons — Sales/Profit page switch
- Country and Year slicers
- Line charts, bar charts, horizontal bar charts, KPI cards
- Negative value visualization (Enterprise -0.61M)
- DAX measures for Sales, Profit, Gross Sales, Discount

---

## 🔗 How to Open
1. Download `Financial_Performance_Dashboard.pbix`
2. Open with **Microsoft Power BI Desktop**
3. Data is embedded — no external connections needed

---

## 📂 Dataset
- **Source:** Finance Dataset — built-in Power BI sample dataset
- **Period:** 2013–2014
- **Countries:** USA, Canada, France, Germany, Mexico
- **Segments:** Government, Small Business, Enterprise, Midmarket, Channel Partners
- **Products:** Paseo, VTT, Velo, Amarilla, Montana, Carretera
