# Screenshots — Swiggy Food Orders Analysis

Take exactly **8 screenshots** in MySQL Workbench. Here is exactly which query to run for each, and why it's worth screenshotting.

--- 

### SW1 — Dataset Scale (Most Important — Take This First)
**Run this, screenshot the RESULT GRID:**
```sql
select 
count(distinct city) as `Total Cities`,
count(distinct state) as `Total States`,
count(distinct `restaurant name`) as `Total Restaurants`,
count(distinct `dish name`) as `Total Dishes`,
count(distinct `food type`) as `Food Type`,
count(distinct category) as Category
from swiggy;
```
**Expected output:** 28 cities | 993 restaurants | 59,064 dishes  
**Why:** One clean row showing the entire scale of your analysis. First thing a recruiter sees.

---

### SW2 — Null Check (Shows Data Quality Awareness)
**Run this, screenshot CODE + RESULT:**
```sql
select 
sum(case when `state` is null then 1 else 0 end) as null_state,
sum(case when `city` is null then 1 else 0 end) as null_city,
sum(case when `order date` is null then 1 else 0 end) as null_date,
sum(case when `Price (INR)` is null then 1 else 0 end) as null_price,
sum(case when `Rating` is null then 1 else 0 end) as null_rating,
sum(case when `rating count` is null then 1 else 0 end) as null_ratingcount
from swiggy;
```
**Expected output:** All zeros  
**Why:** Shows you proactively checked data quality. All-zero output is visually clean and impressive.

---

### SW3 — Food Type Window Function
**Run this, screenshot CODE + RESULT:**
```sql
select `food type` as "Food Type", count(*) as "Total Orders",
concat(round(count(*) * 100.0 / sum(count(*)) over(),2)," %") as "Percentage Contribution"
from swiggy group by `food type`;
```
**Expected output:** Veg 71.5% (1,40,604) | Non-Veg 28.5% (56,826)  
**Why:** Shows `SUM() OVER()` window function — advanced SQL. Clean 2-row output with % calculation.

---

### SW4 — HAVING Clause (Surprising Business Insight)
**Run this, screenshot CODE + RESULT:**
```sql
select city, round(avg(`price (INR)`), 2) as avg_price, count(*) as total_orders
from swiggy group by city having avg_price > 300 order by avg_price desc;
```
**Expected output:** Only Panaji (₹306) and Lucknow (₹305)  
**Why:** Short, clean output (only 2 rows) with a surprising insight — Goa and Lucknow beat Mumbai and Delhi.

---

### SW5 — Weekend vs Weekday Split (Counterintuitive Insight)
**Run this, screenshot CODE + RESULT:**
```sql
select case when `day` in ("Sat","Sun") then "Weekend" else "Weekday" end as Day_Type,
count(*) as "Total Orders",
concat(round(count(*) * 100.0 / sum(count(*)) over(),2)," %") as Percentage
from swiggy group by day_type;
```
**Expected output:** Weekday 70.92% (1,40,018) | Weekend 29.08% (57,412)  
**Why:** CASE WHEN + Window Function together. The insight (weekdays dominate) surprises everyone.

---

### SW6 — Price Category CASE WHEN (Most Advanced Regular Query)
**Run this, screenshot CODE + RESULT:**
```sql
select 
case when `price (INR)` < 150 then 'Budget'
     when `price (INR)` between 150 and 400 then 'Mid-Range'
     when `price (INR)` between 401 and 800 then 'Premium'
     else 'Luxury'
end as price_category,
count(*) as total_dishes,
concat(round(count(*) * 100.0 / sum(count(*)) over(), 2), ' %') as percentage
from swiggy group by price_category order by total_dishes desc;
```
**Expected output:** Mid-Range 58.51% | Budget 27.45% | Premium 11.86% | Luxury 2.18%  
**Why:** 4-tier CASE WHEN + window function = most advanced non-procedure query in the file.

---

### SW7 — Views with Output (Production-Level SQL)
**Run these 2 queries together, screenshot CODE + both RESULTS:**
```sql
-- View 1
create view vw_city_summary as
select city, count(*) as total_orders,
count(distinct `restaurant name`) as total_restaurants,
round(avg(`price (INR)`), 2) as avg_price,
round(avg(rating), 2) as avg_rating
from swiggy group by city;

select * from vw_city_summary order by total_orders desc;

-- View 2
create view vw_top_rated_dishes as
select city, `restaurant name`, `dish name`, `food type`,
`price (INR)`, rating, `rating count`
from swiggy where rating > 4.5 and `rating count` >= 100;

select * from vw_top_rated_dishes order by rating desc, `rating count` desc;
```
**Why:** Views show production-level database design. Two views in one screenshot = very professional.

---

### SW8 — Stored Procedures with CALL Output (Most Impressive)
**Run these, screenshot CODE + CALL results:**
```sql
-- Procedure 1
delimiter ==
create procedure GetTopDishes(in city_name varchar(100), in top_n int)
begin
select `dish name`, `food type`, count(*) as order_count,
round(avg(`price (INR)`), 2) as avg_price, round(avg(rating), 2) as avg_rating
from swiggy where city = city_name
group by `dish name`, `food type` order by order_count desc limit top_n;
end==
delimiter ;

call GetTopDishes('Bengaluru', 10);

-- Procedure 2
delimiter ==
create procedure cityreport(in city_name varchar(100))
begin
select city, count(*) as total_orders,
count(distinct `restaurant name`) as total_restaurants,
round(avg(`price (INR)`), 2) as avg_price, round(avg(rating), 2) as avg_rating
from swiggy where city = city_name group by city;
end==
delimiter ;

call cityreport('Bengaluru');
call cityreport('Mumbai');
```
**Why:** 2 stored procedures with IN parameters = the most advanced SQL concept in your project. Interviewers always ask about this.

---

## Screenshot Files

| File Name | Tool | Description |
|-----------|------|-------------|
| [SW1.png](SW1.png) | SQL | Dataset scale analysis showing 28 cities, 993 restaurants, and 59,064 dishes |
| [SW2.png](SW2.png) | SQL | Data quality check across 14 columns confirming no missing values |
| [SW3.png](SW3.png) | SQL | Window function analysis comparing Veg vs Non-Veg dishes (71.5% vs 28.5%) |
| [SW4.png](SW4.png) | SQL | HAVING clause analysis identifying cities with average dish price above ₹300 |
| [SW5.png](SW5.png) | SQL | Weekday vs Weekend order distribution analysis |
| [SW6.png](SW6.png) | SQL | CASE WHEN based price segmentation analysis (Budget, Mid-Range, Premium) |
| [SW7.png](SW7.png) | SQL | View creation and output for `vw_city_summary` and `vw_top_rated_dishes` |
| [SW8.png](SW8.png) | SQL | Stored procedures (`GetTopDishes`, `cityreport`) and their execution results |
---

## Quick Reference — Key Numbers

| Metric | Value |
|--------|-------|
| Total Rows | 1,97,430 |
| Total Cities | 28 |
| Total Restaurants | 993 |
| Total Unique Dishes | 59,064 |
| Null Values | 0 |
| Avg Price | ₹268.51 |
| Price Range | ₹0.95 to ₹8,000 |
| Above Avg Price Dishes | 77,848 (39.4%) |
| Veg Orders | 71.5% (1,40,604) |
| Non-Veg Orders | 28.5% (56,826) |
| Mid-Range Dishes | 58.51% (1,15,514) |
| Weekday Orders | 70.92% (1,40,018) |
| Weekend Orders | 29.08% (57,412) |
| Biggest Segment | Weekday + Veg (99,745 orders) |
| Busiest Day | Saturday (28,938) |
| Slowest Day | Tuesday |
| Busiest Date | 22nd Feb 2025 — 1,550 orders |
| Q2 Orders | 74,163 (highest quarter) |
| January Orders | 25,398 (highest month) |
| Top City Avg Price | Panaji, Goa (₹306) |
| Top State Orders | Karnataka (20,077) |
| Views Created | 2 (vw_city_summary, vw_top_rated_dishes) |
| Stored Procedures | 2 (GetTopDishes, cityreport) |
