# 📊 Power BI Dashboard — Hospitality Analysis

This folder contains the Power BI dashboard file built for the Hospitality Analysis project.

---

## 📄 Files in This Folder

| File Name | Description |
|-----------|-------------|
| [Hospitality Analysis PowerBI](Hospitality_Analysis_Dashboard_PowerBi.pbix) | Main Power BI dashboard file (4 pages + summary) |
| [HA1.png](HA1.png) | Screenshot — Home/Overview page |
| [HA2.png](HA2.png) | Screenshot — Revenue Analysis page |
| [HA3.png](HA3.png) | Screenshot — Booking & Occupancy Analysis page |
| [HA4.png](HA4.png) | Screenshot — Booking Analysis page |
| [HA5.png](HA5.png) | Screenshot — Project Summary page |

---

## 📋 Dashboard Pages

| Page | Key Visuals |
|------|------------|
| **Overview** | KPI cards — Revenue (1.71bn), Capacity (232.6K), Occupancy % (57.87%), Bookings (135K), Cancellations (33.42K, 24.83%) |
| **Revenue Analysis** | Bookings by platform, property, city, room class, booking status, category |
| **Booking & Occupancy** | Occupancy % by property, day type, month, room class; bookings vs capacity by property |
| **Booking Analysis** | Cancelled bookings deep-dive by room class, platform, city, category; ADR, DBRN, DSRN, DURN, Realisation % |

---

## 🛠️ Power BI Features Used
- **Star Schema Data Model** — fact_bookings connected to all 3 dimension tables
- **DAX Measures** — ADR, RevPAR, DBRN, DSRN, DURN, Realisation %, Occupancy %
- **Toggle Buttons** — Switch between Total Bookings / Revenue Earned / Total Capacity views
- **Slicers** — City, Room Class, Quarter, Category, Booking Status
- **Visualizations** — Bar charts, donut charts, line charts, KPI cards, pie charts

---

## 🔗 How to Open
1. Download `Hospitality_Analysis.pbix`
2. Open with **Microsoft Power BI Desktop**
3. All data is embedded — no external connections needed
