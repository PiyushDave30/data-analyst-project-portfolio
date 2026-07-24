# Ecommerce Analytics Dashboard 🛒

![Dashboard Preview](Screenshots/2.%20Executive%20Overview.png)

> **Self-Made Project** | Portfolio Project  
> A 6-page interactive Power BI dashboard analyzing 1,000 ecommerce transactions across Jan 2024 – Dec 2025 — covering revenue, profit, customer behaviour, return orders, and marketing channel performance using advanced DAX, Power Query, and field parameters.

---

## 📌 Project Overview

This project performs a complete business analysis on an ecommerce transactions dataset to answer real-world questions about profitability, customer retention, return order impact, and marketing effectiveness. The dashboard is designed as an executive-level report with 6 dedicated pages — each solving a specific business problem.

---

## ❓ Business Questions Answered

| # | Business Question |
|---|------------------|
| 1 | Which categories and products drive revenue vs profit — and where is discounting causing orders to turn negative? |
| 2 | Who are the highest-value customers and how much revenue comes from repeat vs one-time buyers? |
| 3 | What is driving returns and which categories or shipping modes hurt net profit once returns are factored in? |
| 4 | Which marketing channel acquires the most valuable orders and how should Q4 seasonality shape inventory and spend? |

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| **Power BI Desktop** | 6-page interactive dashboard — DAX, field parameters, Power Query, data modeling |
| **Power Query** | Data transformation, calculated column setup, data type formatting |
| **DAX** | 20+ measures and calculated columns for KPIs, customer segmentation, return analysis |
| **Microsoft Excel** | Raw dataset source (.xlsx) |

---

## 📊 Dashboard Pages

### Page 1 — Home
![Home](Screenshots/1.%20Home.png)
Navigation landing page with links to all 5 report pages.

### Page 2 — Executive Overview
![Executive Overview](Screenshots/2.%20Executive%20Overview.png)

| KPI | Value |
|-----|-------|
| Total Revenue | 236.76K |
| Total Profit | 66.19K |
| Total Orders | 1,000 |
| Total Customers | 326 |
| Profit Margin % | 27.96% |
| Return Rate % | 8.20% |

Visuals: Monthly revenue/profit trend line, revenue by category donut, revenue by country donut, revenue & profit by region bar chart, country/city performance table.

### Page 3 — Revenue & Profit Analysis
![Revenue & Profit](Screenshots/3.%20Revenue%20&%20Profit%20Analysis.png)

Additional KPIs: Total Cost (170.57K) | Avg Selling Price (169.78)

Visuals: Field-parameter toggle (Revenue ↔ Profit), profit by sub-category bar, profit by category donut, profit by payment method, top 5 and bottom 5 products by profit, **profit by discount bucket** — showing profit turns negative above 20% discount.

### Page 4 — Customer Analysis
![Customer Analysis](Screenshots/4%20Customer%20Analysis.png)

| KPI | Value |
|-----|-------|
| Revenue per Customer | 726.27 |
| Orders per Customer | 3.07 |
| Repeat Customers | 275 of 326 (84%) |
| Repeat Customer Revenue | 225K (95.2%) |
| One-time Customers | 51 |

Visuals: Customers by payment method, customer type donut (Repeat vs One-time), customers by segment (Consumer/Corporate/Home Office), avg order value by segment, top customers table.

### Page 5 — Return Orders Insight
![Return Orders](Screenshots/5%20Return%20Orders.png)

| KPI | Value |
|-----|-------|
| Total Return Orders | 82 |
| Return Rate % | 8.20% |
| Lost Revenue | 18.37K |
| Lost Profit | 5.12K |

Visuals: Return rate % by category (Fashion highest at 14.16%), profit vs loss profit by category, total profit vs loss profit donut, return rate by shipping mode, monthly returns trend, shipping mode performance table.

### Page 6 — Marketing & Seasonal Analysis
![Marketing](Screenshots/6.%20Marketing%20&%20Seasonal%Insights.png)

| KPI | Value |
|-----|-------|
| Top Marketing Channel | Organic Search |
| Top Sales Month | December |

Visuals: Marketing channel by revenue & profit, channel by avg order value per segment, weekend vs weekday comparison, quarterly revenue by channel line chart, channel by customer count.

---

## 🔑 Key Business Insights

### 💰 Revenue & Profit
- **Electronics drives 53.23% of revenue** but only **30.84% of profit** — revenue-profit mismatch signals over-discounting or high costs
- **Discounts above 20%** consistently push orders into loss — shown clearly in the Profit by Discount Bucket chart
- Total Cost is **170.57K** against revenue of **236.76K** — margin of 27.96%

### 👥 Customer Behaviour
- **275 of 326 customers (84%)** are repeat buyers
- Repeat customers drive **95.2% (225K)** of total revenue — retention is the biggest revenue lever
- Revenue per Customer: **726.27** | Orders per Customer: **3.07**
- One-time buyers (51 customers) contribute only **4.8%** of revenue

### 🔄 Returns
- **Fashion has the highest return rate at 14.16%** — more than double any other category
- Returns cost the business **7.18% of total profit** (5.12K lost profit)
- Lost revenue from returns: **18.37K**
- Shipping mode impacts return rate — Same-Day vs Standard vs Express compared

### 📣 Marketing & Seasonality
- **Organic Search** is the top channel by both revenue and profit
- **December is the peak month** — Q4 seasonality should drive inventory and spend planning
- **Weekday sales are ~2× weekend sales** — promotions should focus on weekdays

---

## 🧮 DAX Measures & Calculated Columns

### Key Measures (20+)
| Measure | Description |
|---------|-------------|
| `Total Revenue` | SUM of net%20revenue |
| `Total Profit` | SUM of profit |
| `Total Cost` | SUM of unit%20cost × quantity |
| `Total Orders` | DISTINCTCOUNT of order%20id |
| `Total Customers` | DISTINCTCOUNT of customer%20id |
| `Average Order Value` | Total Revenue / Total Orders |
| `Profit Margin %` | Total Profit / Total Revenue × 100 |
| `Avg Selling Price` | Total Revenue / SUM(quantity) |
| `Return Rate %` | Return Orders / Total Orders × 100 |
| `Profit Lost to Returns` | Profit on returned orders |
| `Net Profit Excl Returns` | Total Profit − Profit Lost |
| `Revenue from Repeat Customers %` | Repeat Revenue / Total Revenue |
| `Revenue per Customer` | Total Revenue / Total Customers |
| `Orders per Customer` | Total Orders / Total Customers |
| `Loss Making Orders Count` | COUNT where profit < 0 |
| `Loss Making Orders %` | Loss Orders / Total Orders |
| `Avg Discount on Loss Orders` | AVG discount on loss-making orders |

### Calculated Columns
| Column | Logic |
|--------|-------|
| `Discount Bucket` | Groups discount%20pct into 0–5%, 5–10%, 10–15%, 15–20%, 20%+ |
| `Customer Type` | Repeat (orders > 1) vs One-time (orders = 1) |
| `Customer Order Count` | COUNT of orders per customer%20id |

### Field Parameters
- **Revenue ↔ Profit Toggle** on Revenue & Profit page — switches all visuals between revenue and profit view

---

## 📁 Project Structure

```
Ecommerce-Analytics-Dashboard/
│
├── README.md                          ← You are here
│
├── raw-data/
│   ├── ecommerce%20data.xlsx            ← Raw dataset — 1,000 rows
│   └── README.md
│
├── powerbi/
│   ├── Ecommerce%20Analytics.pbix       ← Power BI dashboard file
│   └── README.md
│
└── Screenshots/
    ├── Home.png
    ├── Executive%20Overview.png
    ├── Revenue%20Profit.png
    ├── Customer%20Analysis.png
    ├── Return%20Orders.png
    ├── Marketing%20Seasonal.png
    └── README.md
```

---

## 🎯 Skills Demonstrated

| Skill | How Used |
|-------|---------|
| **DAX** | 20+ measures — KPIs, return analysis, customer segmentation, discount impact |
| **Power Query** | Data transformation, column formatting, calculated column setup |
| **Data Modeling** | Star schema — fact table + dimension relationships |
| **Field Parameters** | Dynamic Revenue ↔ Profit toggle on visuals |
| **Business Analysis** | Discount impact, return ROI, customer retention, channel attribution |
| **Dashboard Design** | 6-page navigation, slicers, conditional formatting, KPI cards |

---

## 🔗 How to Use

1. Download `Ecommerce%20Analytics.pbix`
2. Open with **Microsoft Power BI Desktop** (free)
3. All data is embedded — no external connections needed
4. Use slicers on each page to filter by date, category, region, channel

---

## 👤 Author

**Piyush Dave**
Data Analyst | SQL · Power BI · Tableau · Excel · Python

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/piyush-dave-0980a03a8)
[![Tableau](https://img.shields.io/badge/Tableau-Public-orange?logo=tableau)](https://public.tableau.com/app/profile/piyushdave/vizzes)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-black?logo=github)](https://github.com/PiyushDave30)
