# Raw Data — Hospitality Analysis

This folder contains the original Hospitality Analytics dataset used for this project.

---

## Files in This Folder

| File Name | Description |
|-----------|-------------|
| `fact_bookings.csv` | Main bookings table — all 1,34,590 booking records |
| `dim_hotels.csv` | Hotel dimension table — property names, cities, categories |
| `dim_rooms.csv` | Room dimension table — room class details |
| `dim_date.csv` | Date dimension table — date, week number, day type |

---

## Dataset Details

| Property | Value |
|----------|-------|
| **Source** | Hospitality Analytics Dataset — ExcelR AI Variant Internship |
| **Period** | April – July 2022 |
| **Total Records** | 1,34,590 bookings |
| **Cities** | 4 (Mumbai, Bangalore, Hyderabad, Delhi) |
| **Hotels** | 7 (Atliq Palace, Exotica, City, Blu, Bay, Grands, Seasons) |
| **Room Classes** | 4 (Elite, Premium, Presidential, Standard) |

---

## Key Fields — fact_bookings

| Field | Description |
|-------|-------------|
| `booking_id` | Unique booking identifier |
| `property_id` | Links to dim_hotels |
| `booking_date` | Date booking was made |
| `check_in_date` | Check-in date |
| `room_category` | Links to dim_rooms |
| `booking_status` | Checked Out / Cancelled / No Show |
| `revenue_generated` | Total revenue at booking |
| `revenue_realized` | Actual revenue collected |
| `no_guests` | Number of guests |
| `booking_platform` | Platform used for booking |
| `ratings_given` | Customer rating (0–5) |

---

## Star Schema Structure
```
fact_bookings (center)
    ├── dim_hotels  (on property_id)
    ├── dim_rooms   (on room_category = room_id)
    └── dim_date    (on check_in_date = date)
```
