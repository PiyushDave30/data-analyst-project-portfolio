# Raw Data — Hospitality Analysis

This folder contains the original, unmodified datasets used for this project.  
The data was provided by **ExcelR** as part of the AI Variant virtual internship curriculum.

---

## Files in This Folder

| File Name | Description |
|-----------|-------------|
| `fact_bookings.csv` | Main bookings fact table — all 134K+ booking records |
| `dim_hotels.csv` | Hotel dimension — property names, cities, categories |
| `dim_rooms.csv` | Room dimension — room class (Elite, Premium, Presidential, Standard) |
| `dim_date.csv` | Date dimension — booking dates, week numbers, day type (weekday/weekend) |

---

## Dataset Details

| Property | Value |
|----------|-------|
| **Source** | Hospitality Analytics Dataset — ExcelR Internship |
| **Database** | `Hospital` (MySQL) |
| **Period** | April – July 2022 |
| **Total Records** | 134,590 booking transactions |
| **Cities** | Mumbai, Bangalore, Hyderabad, Delhi |
| **Properties** | 7 Atliq hotels (Palace, Exotica, City, Blu, Bay, Grands, Seasons) |
| **Key Fields** | booking_id, property_id, booking_date, check_in_date, revenue_generated, revenue_realized, booking_status, room_category, no_guests |

---

## Note
- Data is kept in its **original raw form** — no changes applied
- All transformations were done in Power BI (Power Query), SQL, Tableau, and Excel
