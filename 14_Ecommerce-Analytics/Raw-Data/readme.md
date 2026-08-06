# 🗃️ Raw Data — `ecommerce.csv`

Documentation for the dataset powering the Ecommerce Analytics Dashboard.

---

## Overview

| Property | Value |
|---|---|
| **File** | [`ecommerce.csv`](./ecommerce.csv) |
| **Location** | `/data/ecommerce.csv` |
| **Rows** | 1,000 (order-line grain — one row per product sold within an order) |
| **Columns** | 24 |
| **Date Range** | Jan 1, 2024 – Dec 31, 2025 |
| **Grain** | One row per `order_id` + `product_id` combination |
| **Format** | CSV, UTF-8, comma-delimited |

📥 **Direct download:** [ecommerce.csv](./ecommerce.csv)

---

## 📖 Column Dictionary

| Column | Data Type | Description |
|---|---|---|
| `order_id` | Text | Unique identifier for the order (e.g., `ORD300176`) |
| `order_date` | Date (DD-MM-YYYY) | Date the order was placed |
| `customer_id` | Text | Unique identifier for the customer (e.g., `C50270`) |
| `customer_segment` | Categorical | Customer type: `Consumer`, `Corporate`, or `Home Office` |
| `product_id` | Text | Unique identifier for the product sold |
| `category` | Categorical | Top-level product category (e.g., Electronics, Fashion, Beauty) |
| `sub_category` | Categorical | Product sub-category (e.g., Smartphones, Makeup, Cameras) |
| `quantity` | Integer | Units of the product sold in this order line |
| `unit_price` | Decimal | Selling price per unit before discount |
| `unit_cost` | Decimal | Cost per unit to the business |
| `discount_pct` | Decimal (0–1) | Discount applied as a percentage of gross amount |
| `gross_amount` | Decimal | `quantity × unit_price`, before discount |
| `discount_amount` | Decimal | Dollar value of the discount applied |
| `net_revenue` | Decimal | `gross_amount − discount_amount` — actual revenue recognized |
| `profit` | Decimal | `net_revenue − (quantity × unit_cost)` |
| `payment_method` | Categorical | How the order was paid: Credit Card, Debit Card, PayPal, Digital Wallet, Cash on Delivery |
| `marketing_channel` | Categorical | Acquisition channel: Organic Search, Paid Search, Email, Social, Direct, Affiliate |
| `shipping_mode` | Categorical | Shipping speed selected: Same-Day, Standard, Express |
| `shipping_cost` | Decimal | Cost to ship this order line |
| `delivery_days` | Integer | Days taken from order to delivery |
| `country` | Categorical | Customer's country |
| `region` | Categorical | Sub-national region within the country |
| `city` | Categorical | Customer's city |
| `is_returned` | Boolean | `TRUE`/`FALSE` — whether this order line was returned |

---

## ✅ Data Quality Notes

- **No missing values** — all 24 columns are fully populated across all 1,000 rows
- **No duplicate `order_id` + `product_id` combinations** — each row represents a unique order line
- **Calculated fields verified:** `net_revenue = gross_amount − discount_amount` and `profit = net_revenue − (quantity × unit_cost)` were spot-checked against source formulas and hold across the dataset
- **Date format:** dates are stored as `DD-MM-YYYY` text in the raw file and converted to a proper date type during Power Query load
- **Categorical fields** (category, payment_method, marketing_channel, shipping_mode, country, region, city) contain a fixed, consistent set of values with no free-text variants or typos

---

## ⚠️ Usage Note

This dataset was constructed for portfolio/demonstration purposes to simulate realistic ecommerce transaction patterns (seasonality, return behavior, discount sensitivity, channel mix). It is not sourced from a live production system.

---

## 🔗 Related

- [⬅️ Back to main project README](../README.md)
- [📊 Power BI file & technical documentation](../dashboard/README.md)
- [🖼️ Dashboard screenshots](../screenshots/README.md)
