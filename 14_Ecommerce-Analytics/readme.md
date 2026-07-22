# 📊 Ecommerce Analytics Dashboard

An end-to-end Power BI analytics solution built on 1,000 ecommerce transactions (Jan 2024 – Dec 2025), designed to answer real revenue, customer, returns, and marketing questions that a growing ecommerce business would ask its data team.

![Dashboard Preview](Screenshots/2.%20Executive%20Overview.png)

---

## 📌 Problem Statement

An ecommerce business generating ~$237K in revenue across multiple countries needed a single source of truth to understand:

- Which products and categories actually drive **profit**, not just revenue
- Whether growth is being fueled by **new customers or repeat buyers**
- How much **returns** are silently eating into profit, and where
- Which **marketing channels** deserve more (or less) budget, and how demand shifts seasonally

This project builds a 6-page interactive Power BI dashboard that answers each of these questions with drill-down detail, not just summary numbers.

---

## 🛠️ Tools & Technologies

| Tool / Skill | Used For |
|---|---|
| **Power BI Desktop** | Dashboard build, report design |
| **DAX** | 20+ custom measures and calculated columns |
| **Power Query (M)** | Data cleaning and transformation |
| **Field Parameters** | Dynamic metric-switching visuals |
| **Data Modeling** | Star-schema style relationships across dimensions |

---

## 📂 Repository Structure

```
├── README.md                          → You are here
├── dashboard/
│   └── Ecommerce_Analytics.pbix       → Power BI file (see Power BI README)
├── Screenshots/
│   ├── 1_Home.png
│   ├── 2_Executive_Overview.png
│   ├── 3_Revenue_Profit_Analysis.png
│   ├── 4_Customer_Analysis.png
│   ├── 5_Return_Orders_Insight.png
│   ├── 6_Marketing_Seasonal_Analysis.png
│   └── README.md                      → Screenshot-by-screenshot walkthrough
├── data/
│   ├── ecommerce.csv
│   └── README.md                      → Column dictionary & data quality notes
```

---

## 🖥️ Dashboard Structure (6 Pages)

| Page | What It Covers |
|---|---|
| **1. Home** | Navigation landing page linking to all report sections |
| **2. Executive Overview** | Company-wide KPIs — revenue, profit, orders, customers, margin, return rate |
| **3. Revenue & Profit Analysis** | Category/sub-category/product profitability, discount impact analysis |
| **4. Customer Analysis** | Repeat vs. one-time customers, segment behavior, top customers |
| **5. Return Orders Insight** | Return rate drivers, lost revenue/profit, shipping mode performance |
| **6. Marketing & Seasonal Analysis** | Channel performance, weekday/weekend and quarterly seasonality |

---

## 📸 Dashboard Preview

All Screenshots below are full resolution and also available in the [`/Screenshots`](./Screenshots) folder along with a page-by-page write-up.

### 1. Home
![Home](Screenshots/1.%20Home.png)
🔗 [Open full image](Screenshots/1.%20Home.png)

### 2. Executive Overview
![Executive Overview](Screenshots/2.%20Executive%20Overview.png)
🔗 [Open full image](Screenshots/2.%20Executive%20Overview.png)

### 3. Revenue & Profit Analysis
![Revenue & Profit Analysis](Screenshots/3.%20Revenue%20&%20Profit%20Analysis.png)
🔗 [Open full image](Screenshots/3.%20Revenue%20&%20Profit%20Analysis.png)

### 4. Customer Analysis
![Customer Analysis](Screenshots/4.%20Customer%20Analysis.png)
🔗 [Open full image](Screenshots/4.%20Customer%20Analysis.png)

### 5. Return Orders Insight
![Return Orders Insight](Screenshots/5.%20Return%20Orders.png)
🔗 [Open full image](Screenshots/5.%20Return%20Orders.png)

### 6. Marketing & Seasonal Analysis
![Marketing & Seasonal Analysis](Screenshots/6.%20Marketing%20&%20Seasonal%20Insights.png)
🔗 [Open full image](Screenshots/6.%20Marketing%20&%20Seasonal%20Insights.png)

---

## ❓ Business Questions Answered

1. **Which categories and products drive revenue vs. profit, and where does discounting cause losses?**
2. **Who are the highest-value customers, and how much revenue comes from repeat vs. one-time buyers?**
3. **What's driving returns, and which categories/shipping modes hurt profit once returns are factored in?**
4. **Which marketing channel acquires the most valuable orders, and how should Q4 seasonality shape inventory and spend?**

---

## 💡 Key Insights

- 📉 **Electronics drives 53.2% of revenue but only 30.8% of profit** — a clear revenue-profit mismatch worth flagging to category managers
- 🔻 **Discounts above 20% consistently push orders into a loss** — a hard ceiling for future promotions
- 🔁 **84% of customers (275 of 326) are repeat buyers, driving 95.2% of total revenue** — retention matters more than acquisition here
- 👗 **Fashion has the highest return rate at 14.16%**, more than double any other category
- 💸 **Returns cost the business 7.18% of total profit**
- 📈 **Organic Search is the top channel** by both revenue and profit
- 📅 **December is the peak sales month**; weekday sales run ~2x weekend sales

---

## 🎯 Skills Demonstrated

- DAX measure design (time intelligence, ratios, distinct counts, conditional aggregations)
- Calculated columns for behavioral segmentation (e.g., Repeat vs. One-time customer flag)
- Field parameters for dynamic, recruiter-friendly interactivity
- Data modeling and relationship design
- Power Query-based data cleaning
- Business-first dashboard storytelling (KPI page → diagnostic pages → strategic recommendations)

---

## 👀 How to View This Project

- **Quick look:** Browse the [`/Screenshots`](./Screenshots/README.md) folder for a full page-by-page walkthrough
- **Full interactivity:** Download [`Ecommerce-Analytics.pbix`](./dashboard/Ecommerce_Analytics.pbix) and open in Power BI Desktop (free) — technical docs [here](./dashboard/README.md)
- **Data source:** Download [`ecommerce.csv`](./Raw-Data/ecommerce.csv) — full column documentation [here](./data/README.md)

| Resource | Location | Direct Link |
|---|---|---|
| Screenshots | `/Screenshots` | [Browse](./Screenshots/README.md) |
| Power BI file | `/dashboard/Ecommerce_Analytics.pbix` | [Download](./dashboard/Ecommerce_Analytics.pbix) |
| Raw dataset | `/data/ecommerce.csv` | [Download](./data/ecommerce.csv) |

---

## 👤 About Me

**Piyush Dave** — Data Analyst | Power BI • SQL • Python • Tableau
📍 Amravati, Maharashtra, India

Connect with me on [LinkedIn](#) | [GitHub](https://github.com/PiyushDave30) | [Portfolio Website](https://piyushdave30.github.io)
