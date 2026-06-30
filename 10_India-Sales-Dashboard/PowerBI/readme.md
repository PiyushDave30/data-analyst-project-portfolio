# Power BI Dashboard — India Sales Dashboard

This folder contains the Power BI dashboard file for the India Sales project.

---

## Files in This Folder 

| File Name | Description |
|-----------|-------------|
| [India Sales Data PowerBI](India_Sales_Dashboard.pbix) | Complete 5-page Power BI dashboard |
| [I1](I1.png) | Screenshot — Manager Performance Overview |
| [I2](I2.png) | Screenshot — Profit Performance Overview |
| [I3](I3.png) | Screenshot — Data Table |
| [I4](I4.png) | Screenshot — Sales Performance Overview |
| [I5](I5.png) | Screenshot — Category Analysis |

---

## Dashboard Pages

### Page 1 — Manager Performance Overview
- **KPIs:** Total Sales (589.65K), Sales/Manager (196.55K), Total Profit (129.07K), Profit/Manager (43.02K), Total Managers (3), Total Orders (1.56K)
- **Team Lead vs Profit** — grouped bar chart showing all team leads under each manager
- **Total Profit by Manager** — pie: Suresh 34.2% (44.14K), Mahesh 33.36% (43.05K), Ramesh 32.45% (41.88K)
- **Total Sales by Manager** — donut: Mahesh 35.67% (210K), Suresh 34.34% (202K), Ramesh 29.99% (177K)
- **Decomposition Tree** — Sales → Manager → Team Lead → Region → Category drill-down

### Page 2 — Sales Performance Overview
- **Toggle buttons** — Sales / Profit / Reset
- **KPIs:** Total Sales (589.65K), AvgSales/Customer (1,194), AvgSales/Order (751.1), Max Sales (5,752), Min Sales (5), Total Orders (1.6K)
- **Total Sales by Month** — line chart — June peak (75K), March low (26K)
- **Total Sales by Category** — pie: Technology 41.09% (242K), Furniture 36.64% (216K), Office Supplies 22.27% (131K)
- **Top 5 Sub-Category by Sales** — bar: Phones (105K), Bookcases (89K), Copiers (70K), Chairs (69K), Appliances (45K)
- **Total Sales by Region** — bar: West (189K), North (162K), South (142K), East (96K)

### Page 3 — Profit Performance Overview
- **Toggle buttons** — Sales / Profit / Reset
- **KPIs:** Total Sales (589.65K), Total Profit (129.07K), Avg Profit (83), Max Profit (2,818), Min Profit (-522.1), Total Orders (1.6K)
- **Total Profit by Month** — line chart — June peak (19.5K), March low (4.5K)
- **Total Profit by Category** — pie: Technology 43.46% (56.09K), Furniture 32.88% (42.44K), Office Supplies 23.66% (30.54K)
- **Sub-Category by Profit** — horizontal bar: Phones (23K), Copiers (18K), Bookcases (16K)...
- **Total Profit by Region** — bar: West (38K), North (37K), South (33K), East (22K)

### Page 4 — Category Analysis
- **Total Sales by Category** — pie: Technology 41.09%, Furniture 36.64%, Office Supplies 22.27%
- **Total Profit by Category** — bar: Technology (56K), Furniture (42K), Office Supplies (31K)
- **Sub-Category by Sales** — full horizontal bar (17 sub-categories)
- **Sub-Category by Profit** — full horizontal bar (17 sub-categories)
- **KPI cards** — Total Sales (589.65K) + Total Profit (129.07K)

### Page 5 — Data Table
- **City-wise Sales** table — Delhi top (31,014.63)
- **Region-wise Sales** table — West top (1,88,675.33)
- **Category-wise Sales** — Technology (2,42,259.03), Furniture (2,16,056.25), Office Supplies (1,31,334.83)
- **Sub-Category-wise Sales** table — Phones top (1,04,627.24)
- **State-wise Sales & Profit** table — Maharashtra top (1,01,322.41 sales, 16,105.76 profit)
- **Filters** — Year (2021/2022/2023/2024) + Manager (Mahesh/Ramesh/Suresh)

---

## Power BI Features Used
- **Toggle buttons** — Sales / Profit / Reset on Sales and Profit pages
- **Decomposition Tree** — drill-down: Sales → Manager → Team Lead → Region → Category
- **Slicers** — Year and Manager filters on Data Table page
- **DAX Measures** — Avg Sales per Customer, Avg Sales per Order, Sales per Manager, Profit per Manager
- **Visuals** — Line, Bar, Horizontal Bar, Pie, Donut, Decomposition Tree, Table, KPI Cards

---

## How to Open
1. Download `India_Sales_Dashboard.pbix`
2. Open with **Microsoft Power BI Desktop**
3. Data is embedded — no external connections needed
