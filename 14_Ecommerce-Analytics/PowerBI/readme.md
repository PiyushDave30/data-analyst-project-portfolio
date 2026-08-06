# ⚙️ Power BI File — Technical Documentation

Technical breakdown of `Ecommerce_Analytics.pbix`: data model, DAX measures, calculated columns, field parameters, and page-by-page logic.

📁 **Location:** `/dashboard/Ecommerce_Analytics.pbix`

📥 **Direct download:** [Ecommerce_Analytics.pbix](./Ecommerce_Analysis.pbix)

🖼️ **See it rendered first:** [View all page Screenshots](../Screenshots/README.md)

---

## 🗂️ Data Model

The model is built around a single fact table (`ecommerce`) at order-line grain, with all descriptive attributes present as columns on the same table (flat/wide model — no separate dimension tables were required given dataset size).

**Fact table:** `ecommerce` (1,000 rows, one row per order line)

**Key columns used for modeling:**
- `order_date` → base for all time intelligence and the date-driven visuals
- `customer_id` → grain for customer-level DISTINCTCOUNT measures
- `category` / `sub_category` → product hierarchy used in drill-downs
- `country` / `region` / `city` → geographic hierarchy
- `is_returned` → boolean flag driving all Return Orders Insight measures

A **Date table** was added and marked as the official date table, related to `ecommerce[order_date]` on a single active relationship, to support month/quarter time intelligence (`Monthly Revenue & Profit Trend`, `Total Revenue by Quarter and Marketing Channel`).

---

## 🧮 DAX Measures

| Measure | Logic Summary |
|---|---|
| `Total Revenue` | `SUM(net_revenue)` |
| `Total Profit` | `SUM(profit)` |
| `Total Cost` | `SUM(quantity * unit_cost)` |
| `Total Orders` | `DISTINCTCOUNT(order_id)` |
| `Total Customers` | `DISTINCTCOUNT(customer_id)` |
| `Average Order Value` | `[Total Revenue] / [Total Orders]` |
| `Avg Selling Price` | `[Total Revenue] / SUM(quantity)` |
| `Profit Margin %` | `DIVIDE([Total Profit], [Total Revenue])` |
| `Total Discount` | `SUM(discount_amount)` |
| `Discount %` | `DIVIDE([Total Discount], SUM(gross_amount))` |
| `Return Rate %` | `DIVIDE(CALCULATE([Total Orders], is_returned = TRUE), [Total Orders])` |
| `Profit Lost to Returns` | `CALCULATE([Total Profit], is_returned = TRUE) * -1` |
| `Net Profit Excl Returns` | `CALCULATE([Total Profit], is_returned = FALSE)` |
| `Revenue from Repeat Customers %` | `DIVIDE(CALCULATE([Total Revenue], [Customer Type] = "Repeat"), [Total Revenue])` |
| `Revenue per Customer` | `DIVIDE([Total Revenue], [Total Customers])` |
| `Orders per Customer` | `DIVIDE([Total Orders], [Total Customers])` |
| `Loss Making Orders Count` | `CALCULATE([Total Orders], profit < 0)` |
| `Loss Making Orders %` | `DIVIDE([Loss Making Orders Count], [Total Orders])` |
| `Avg Discount on Loss Orders` | `CALCULATE(AVERAGE(discount_pct), profit < 0)` |

---

## 🧱 Calculated Columns

| Column | Table | Logic Summary |
|---|---|---|
| `Discount Bucket` | `ecommerce` | Buckets `discount_pct` into bands (0%, 1–10%, 11–20%, 21–30%, 31–40%) for the profit-by-discount analysis on Page 3 |
| `Customer Order Count` | `ecommerce` | `CALCULATE(DISTINCTCOUNT(order_id), ALLEXCEPT(ecommerce, ecommerce[customer_id]))` — total lifetime orders per customer |
| `Customer Type` | `ecommerce` | `IF([Customer Order Count] > 1, "Repeat", "One-time")` — drives Customer Analysis and revenue-mix visuals |

---

## 🎛️ Field Parameters

**`Revenue/Profit Toggle`** (Page 3 — Revenue & Profit Analysis)
A field parameter containing `Total Revenue` and `Total Profit` as swappable fields, bound to a button-style slicer. Lets a single set of visuals (sub-category bars, category donut, payment method chart) re-render against either metric without duplicating visuals — used to keep the page compact while still letting the viewer compare both lenses.

---

## 📄 Page-by-Page Technical Breakdown

/**1. Home** — [🔗 view screenshot](../Screenshots/1.%20Home.png)

Static navigation page. Bookmarks + buttons link each card to its corresponding report page.

**2. Executive Overview** — [🔗 view screenshot](../Screenshots/2.%20Executive%20Overview.png)

Card visuals bound to `Total Revenue`, `Total Profit`, `Total Orders`, `Total Customers`, `Profit Margin %`, `Return Rate %`. Line chart uses the Date table for month-level granularity. Donuts use `country` and `category`. Table visual uses `country`, `city` with `Revenue`, `Orders`, `Profit`, `Quantity` columns, sorted descending on Revenue.

**3. Revenue & Profit Analysis** — [🔗 view screenshot](../Screenshots/3.%20Revenue%20&%20Profit%20Analysis.png)

Field parameter drives the bar/donut visuals. Top 5 / Bottom 5 product tables use `TOPN` logic via visual-level filters on `Total Profit`. Discount Bucket calculated column powers the final chart.

**4. Customer Analysis** — [🔗 view screenshot](../Screenshots/4.%20Customer%20Analysis.png)

`Customer Type` and `Customer Order Count` calculated columns drive the repeat vs. one-time split. Slicers on `Category`, `Country`, `Customer Segment`, `Customer_ID`, and `Day` allow full cross-filtering.

**5. Return Orders Insight** — [🔗 view screenshot](../Screenshots/5.%20Return%20Orders.png)

All visuals filtered/split by `is_returned`. Shipping mode table blends `Return Rate %`, `AVERAGE(delivery_days)`, `SUM(shipping_cost)`, and `Profit Margin %` into one comparative view.

**6. Marketing & Seasonal Analysis** — [🔗 view screenshot](../Screenshots/6.%20Marketing%20&%20Seasonal%20Insights.png)

`marketing_channel` drives the revenue/profit and customer-count visuals. Weekend vs. weekday comparison uses a calculated `Day Type` logic (via the Date table) grouping Saturday/Sunday vs. weekdays. Quarterly trend uses `QUARTER(order_date)` from the Date table crossed with `marketing_channel`.

---

## 🔧 Requirements to Open

- Power BI Desktop (free) — [download here](https://powerbi.microsoft.com/desktop/)
- No external data source connections required — data is imported directly into the model

---

## 🔗 Related

- [⬅️ Back to main project README](../README.md)
- [🖼️ Dashboard Screenshots](../Screenshots/README.md)
- [🗃️ Raw data & column dictionary](../Raw-Data/README.md)
