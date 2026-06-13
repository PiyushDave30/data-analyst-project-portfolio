# Power BI Dashboard — HR Attrition Analysis

This folder contains the Power BI dashboard file for the HR Attrition project.

---

## Files in This Folder

| File Name | Description |
|-----------|-------------|
| [HR Attrition Analysis PowerBi](HR-Attrition-Analysis.pbix) | Power BI dashboard — single page, full analysis |
| [Dashboard](HR5.png) | Screenshot of the complete dashboard |

---

## Dashboard Overview

Single-page interactive dashboard titled **"HR Attrition Analysis Dashboard"** with:

| Section | Details |
|---------|---------|
| **KPI Banner** | Attrition Rate (50.21%), Avg Hourly Rate Male Research Scientist (114.4), Avg Experience (20), Active Employees (24,895), Attrition (25,105), Avg Years at Company (11) |
| **Select Measure** | Toggle — Attrition Rate / Avg Income / Avg Experience / Job Satisfaction |
| **Select Parameter** | Toggle — Department / Job Role / Age Groups / Job Satisfaction / Promotion Groups / Over Time / Income Groups |
| **Business Travel Filter** | Non-Travel / Travel Frequently / Travel Rarely |
| **Attrition by Department** | Bar chart — R&D (51.21%) to Hardware (49.44%) |
| **Job Role vs Work-Life Balance** | Table — 10 job roles with employee count and avg work-life balance score |
| **Gender Count** | Donut — Male 50.12% (25,059) vs Female 49.88% (24,941) |
| **Top 5 Employees by Income** | Bar chart — top earners with employee IDs |
| **Dept-wise Attrition with Income Distribution** | Combined bar chart with tooltip |
| **Avg Working Years per Dept** | Lollipop chart — all departments ~20 years |
| **Attrition vs Year Since Last Promotion** | Line chart — peaks at 64% (36 years), drops to 33% (39 years) |

---

## Power BI Features Used
- Dynamic **Select Measure** and **Select Parameter** toggle buttons
- **Conditional tooltips** on department attrition chart
- **Slicers** for Business Travel filter
- DAX measures for Attrition Rate %, Active vs Attrited employee counts
- Lollipop chart, donut, bar, line, and table visuals

---

## How to Open
1. Download `HR_Attrition_Analysis.pbix`
2. Open with **Microsoft Power BI Desktop**
3. All data embedded — no external connections needed
