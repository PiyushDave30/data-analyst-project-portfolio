/******************************************************
		DATABasE CREATION and LOADinG DATA 
*******************************************************/
create database swiggy; 
use swiggy;

SHOW VARIABLES LIKE 'secure_file_priv';
select * from swiggy;
truncate table swiggy;
drop table swiggy;

LOAD DATA inFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Swiggy/Swiggy.csv'
inTO TABLE swiggy
CHARACTER SET latin1
FIELDS TERminATED BY ','
OPTIONALLY ENCLOSED BY '"'
LinES TERminATED BY '\r\n'
IGNORE 1 ROWS;

select * from swiggy;
desc swiggy;

-- ----------------------------------------------------------------------------------------------------------------

-- Understanding Dataset
select * from swiggy limit 10;
/* Insight: Dataset contains food orders across multiple cities with pricing, ratings, and category details per dish. */

-- Total Rows in Dataset
select count(*) as `Total Rows` from swiggy;
/* Insight: 1,97,430 rows — a large enough dataset for meaningful business analysis across cities and categories. */

-- Data Analysis
select 
count(distinct city) as `Total Cities`,
count(distinct state) as `Total States`,
count(distinct `restaurant name`) as `Total Restaurants`,
count(distinct `dish name`) as `Total Dishes`,
count(distinct `food type`) as `Food Type`,
count(distinct category) as Category
from swiggy;
/* Insight: 993 restaurants across 28 cities offer 59,064 unique dishes,showing massive menu diversity on the platform. */

-- NUll Check
select 
sum(case when `state` is null then 1 else 0 end ) as null_state,
sum(case when `city` is null then 1 else 0 end ) as null_city,
sum(case when `order date` is null then 1 else 0 end ) as null_date,
sum(case when `week_no` is null then 1 else 0 end ) as null_weekno,
sum(case when `quarter` is null then 1 else 0 end ) as null_quarter,
sum(case when `day` is null then 1 else 0 end ) as null_day,
sum(case when `restaurant name` is null then 1 else 0 end ) as null_restaurant,
sum(case when `location` is null then 1 else 0 end ) as null_location,
sum(case when `category` is null then 1 else 0 end ) as null_category,
sum(case when `Dish Name` is null then 1 else 0 end ) as null_dish,
sum(case when `food type` is null then 1 else 0 end ) as null_food,
sum(case when `Price (inr)` is null then 1 else 0 end ) as null_price,
sum(case when `Rating` is null then 1 else 0 end ) as null_rating,
sum(case when `Rating count` is null then 1 else 0 end ) as null_ratingcount
from swiggy;
/* Insight: Zero nulls across all 14 columns — data is clean and ready for analysis without any imputation needed. */

-- maximum, minimum & Average Price of Dishes
select 
concat(max(`price (inr)`)," /-") as `maximum Price`,
concat(round(min(`price (inr)`),1)," /-") as `minimum Price`,
concat(round(avg(`price (inr)`),2)," /-") as `Average Price`
from swiggy;
/* Insight: avg price ~₹220 with a wide range (₹0.95–₹8,000) High-end outliers likely represent bulk/catering orders. */

-- minimum, maximum & Average Rating
select 
min(rating) as `minimum Rating`,
max(rating) as `maximum Rating`,
round(avg(rating),2) as `Average Rating`,
sum(case when `rating count` = 0 then 1 else 0 end) as `Unrated Dishes`
from swiggy;
/* Insight: Avg price ~₹268.51 with a wide range (₹0.95–₹8,000) — High-end outliers likely represent bulk/catering orders */

-- Rating count Distribution
select 
case when `rating count` = 0 then "Unrated"
	 when `Rating count` Between 1 and 25 then "Low (1-25)"
	 when `Rating count` Between 26 and 100 then "Medium (26-100)"
	 else "High (100+)"
end as `Rating Window`,
count(*) as "Total Dishes"
from swiggy group by `Rating Window` order by `Total Dishes` desc;
/*  Insight: Majority of dishes fall in the "Unrated" or "Low" bucket,meaning most dishes have very few customer reviews. */

-- Food Type Distribution
select `food type`as "Food Type", count(*) as "Total Orders",
concat(round(count(*) * 100.0 / sum( count(*) ) over() ,2)," %")as "Percentage Contribution"
from swiggy group by `food type`;
/* Insight: Veg dishes dominate at ~71.5% (1,40,604 orders) vs Non-Veg at ~28.5% (56,826 orders) — 
reflecting india's strong vegetarian food culture. */

-- Dates Covered
select 
min(`order date`) as "Start Date" , 
max(`order date`) as "end Date" , 
datediff(max(`order date`),min(`order date`)) +1 as "Total Days Covered"
from swiggy;
/* Insight: Data spans approx. 8–9 months (Q1–Q3), giving a good window to study seasonal and weekly ordering trends. */




-- Quarter wise Orders 
select quarter,count(*) as "Total Order" from swiggy group by quarter order by `total order`desc;
/* -- 📌 Insight: Q2 leads in orders — April to June is peak season,possibly driven by summer holidays and IPL season. */

-- Day wise Orders
select day,count(*) as "Total Order" from swiggy group by day order by `total order`desc;
/*  Insight: Saturday has the most orders (28,938), closely followed by Sunday (28,474) — weekends dominate but Thursday and Friday are surprisingly strong too. Tuesday is the slowest day, not Monday. */

-- Least Food Price
select `restaurant name`, `dish name`, `price (inr)`, `city` from swiggy where `Price (inr)` < 10;
/* A small number of items priced below ₹10 are there (e.g. sauces, ketchup ) */

-- *****************************************************************************************************************************************************
-- *****************************************************************************************************************************************************

-- All dishes from Bengaluru with a price greater than 2000/-
select `state`,`city`,`restaurant name`,`dish name`,`price (inr)`,`rating`
from swiggy 
where city = "Bengaluru" and `price (inr)` >= 2000
order by `Price (inr)` desc;
/* Insight: Premium dishes (₹2000+) in Bengaluru are likely bulk platters or catering menus — Bengaluru's high-income tech workforce drives luxury orders. */

-- All Non-Veg dishes priced Between ₹200 and ₹400
select city, `restaurant name`, `dish name` ,`food type`, `Price (inr)` , rating
from swiggy where `food type` = "Non-Veg" and `Price (inr)` Between 200 and 400;
/* Insight: This mid-range band is the sweet spot for Non-Veg — affordable enough for daily orders yet profitable for restaurants. */

-- Find all orders from Mumbai, New Delhi, or Kolkata only.
select `restaurant name` , `dish name` , city , `price (inr)`
from swiggy where city in ("Mumbai","New Delhi","Kolkata") order by city asc;
/* Insight: These 3 metros represent india's commercial, political, and cultural capitals — together they reveal regional cuisine preferences. */

-- Find all dishes that are NOT Veg and have a rating above 4.5.
select city,`restaurant name`,`dish name`,`food type`,`price (inr)`,rating
from swiggy where `food type` <> "Veg" and rating > 4.5 order by rating desc;
/* Insight: Highly rated Non-Veg dishes signal quality leaders — restaurants serving these are strong candidates for "best in city" analysis. */

-- Find all dishes where rating count is 0 (completely unrated) but price is above 2000
select city,`restaurant name`,`dish name`,`food type`,`price (inr)`,rating,`rating count`
from swiggy where `rating count` = 0 and `price (inr)` > 2000 order by `price (inr)` desc;
/* Insight: Premium dishes with zero ratings are a business blind spot — restaurants need reviews to justify high prices to new customers. */

--  Find the Top 10 most expensive dishes in the entire dataset.
select city,`restaurant name`,`dish name`,`food type`,`price (inr)`,rating
from swiggy order by `price (inr)` desc limit 10;
/* Insight: Most top-priced items are bulk/party packs — confirms that high price outliers are not regular menu items but event-based orders. */

-- Find the Top 10 highest rated dishes with rating count more than 100
select city,`restaurant name`,`dish name`,`food type`,`price (inr)`,rating ,`rating count`
from swiggy where `rating count` >= 100
order by rating desc, `rating count` desc limit 10;
/* Insight: Dishes with 100+ ratings and high scores are proven bestsellers — these are the menu items restaurants should promote most aggressively. */

-- Which city has the most restaurants? Show top 5.
select city , count(distinct `restaurant name`) as "Total Restaurants"
from swiggy group by city order by `Total Restaurants` desc limit 5;
/* Insight: Bengaluru leads comfortably — as Swiggy's home city it has the deepest restaurant network, followed by other Tier-1 metros. */

-- Find all dishes where the dish name contains the word 'Biryani' 
select city,`restaurant name`,`dish name`,`food type`,`price (inr)`,rating
from swiggy where `dish name` like '%Biryani%'
order by `price (inr)` desc;
/* Insight: Biryani has the widest dish name presence across the platform — it is clearly the single most popular food category on Swiggy in india. */

--  Find all restaurants whose name starts with 'The'
select distinct `restaurant name`,city from swiggy where `restaurant name` like "The %" order by `restaurant name`;
/* Insight: 'The' prefix is a common branding choice for premium/themed restaurants — signals an attempt to stand out with a formal identity. */

-- Show each dish name in UPPERcase, its length, and the first 15 characters only 
select `dish name` , upper(`dish name`) as "Upper Name" , length(`dish name`) as "Name length" , left(`dish name`,15) as "Short Name" 
from swiggy limit 20;
/* Insight: Dish name lengths vary wildly — short names (Dosa, Roti) vs long descriptive names. Long names often signal fusion or specialty dishes. */

-- How many categories have extra spaces 
select 
distinct category as "Original Category",
length(category) as "Length Before Trim",
trim(category) as "Trimmed Category",
length(trim(category)) as "Length After Trim"
from swiggy
where length(category) <> length(trim(category));

-- count how many rows are affected
select count(*) as "Category with extra spaces"
from swiggy
where LENGTH(category) != LENGTH(TRIM(category));
/* Insight: Hidden whitespace causes group by to treat identical categories as different — this silently inflates category counts in all analyses. */

-- Spelling Diffrence can make diffrent categories 
select distinct category
from swiggy
where category REGEXP "Biryani|Biriyani|Biryanis|Biryani's"   -- Biryani's ( last one )
order by category;
/* Insight: At least 3–4 spelling variants exist for Biryani alone — proof that category standardization is critical before any category-level analysis. */

-- Show dish name with the 'Biriyani' word replaced by 'Biryani' using REPLACE() 
select `dish name` , replace(`dish name`,'Biriyani','Biryani') from swiggy
where `dish name` like "%Biriyani%";
/* Insight: 'Biriyani' is a common misspelling of 'Biryani' — REPLACE() can bulk-fix these without touching the original data. */

-- Longest city name and Shortest city name using order by
select distinct city, length(city) as name_length
from swiggy order by name_length desc limit 1;

-- Shortest city name
select distinct city, length(city) as name_length
from swiggy order by name_length asc limit 1;
/* Insight: A fun but useful check — longer city names can cause display issues in dashboards and need trimming in reporting layers. */

-- *****************************************************************************************************************************************************
-- *****************************************************************************************************************************************************

-- Find the total number of orders, average price, and average rating for each city. order by average price descending.
select city,count(*) as total_orders, round(avg(`price (inr)`), 2)    as avg_price, round(avg(rating), 2) as avg_rating from swiggy group by city order by avg_price desc;
/* Insight: Panaji (Goa) leads with highest avg price (₹306), followed by Lucknow (₹305) — surprisingly NOT Bengaluru or Mumbai. Smaller cities with premium restaurant mix can outrank metros in avg spend per order.. */

-- Find the total orders and average price per food type (Veg / Non-Veg). Which is more expensive on average?
select `food type`,count(*) as total_orders,round(avg(`price (inr)`), 2) as avg_price,round(min(`price (inr)`), 2) as min_price,round(max(`price (inr)`), 2) as max_price from swiggy group by `food type`;
/* Insight: Non-Veg dishes tend to be pricier on average — meat ingredients drive up cost, making Non-Veg a higher revenue-per-order segment. */

-- Which state generates the most orders? Show all states with their order count and average dish price.
select state, count(*) as total_orders, round(avg(`price (inr)`), 2) as avg_price from swiggy group by state order by total_orders desc;
/* Insight: Karnataka leads with 20,077 orders — but only ~2x ahead of Maharashtra and Telangana (~10,000 each), showing demand is more distributed across states than expected.. */

-- Find all cities where the average dish price is >300. This is the having clause — filtering on aggregated values.
select city, round(avg(`price (inr)`), 2) as avg_price, count(*) as total_orders 
from swiggy group by city having avg_price > 300 order by avg_price desc;
/* Insight: Only 2 cities clear the ₹300 avg price mark — Panaji (₹306) and Lucknow (₹305). Most indian cities including metros like Mumbai and Delhi fall below ₹300 avg,
 showing price sensitivity across the platform.*/

-- Find restaurants that have more than 50 dishes on their menu. Show restaurant name, city, and dish count.
select `restaurant name`,city,count(distinct `dish name`) as total_dishes 
from swiggy group by `restaurant name`, city 
having total_dishes > 50 order by total_dishes desc;
/* Insight: Restaurants with 50+ dishes are large chains or multi-cuisine places — large menus attract more customers but can  dilute quality focus. */

-- Find the most expensive dish per city — the single highest priced item in each city.
select city, max(`price (inr)`) as max_dish_price from swiggy group by city order by max_dish_price desc;
/* Insight: The max price per city reveals premium outliers — bulk orders and catering menus heavily influence the ceiling in metro cities. */

-- Find cities where the total number of Veg dishes is greater than Non-Veg dishes.
select city, sum(case when `food type` = 'Veg'     then 1 else 0 end) as veg_count, sum(case when `food type` = 'Non-Veg' then 1 else 0 end) as nonveg_count
from swiggy group by city having veg_count > nonveg_count order by veg_count desc;
/* Insight: ALL 28 cities have more Veg listings than Non-Veg — without exception. Bengaluru leads with 14,481 Veg vs 5,596 Non-Veg dishes, confirming Veg dominance is a platform-wide pattern, not regional. */


-- Find the average rating per city but only include cities that have at least 1000 orders and an average rating above 3.8.
select city,count(*) as total_orders,round(avg(rating), 2) as avg_rating from swiggy group by city having total_orders >= 1000 and avg_rating > 3.8 order by avg_rating desc;
/* Insight: ALL 28 cities pass both thresholds (1000+ orders, rating > 3.8) — showing consistently high quality across the platform. Kochi leads with the highest avg rating (4.44), followed by Aizawl and Kolkata (4.41). */


-- Extract the year, month number, month name, and day name from the order date. Show first 10 rows.
select `order date`,year(`order date`) as Year , month(`order date`) as Month , monthname(`order date`) as Month_Name , day(`order date`) as Day , dayname(`order date`) as Day_Name , weekofyear(`order date`) as `Week's Year` from swiggy limit 10;
/* Insight: Breaking dates into components enables powerful time-series analysis — month and week trends are critical for demand forecasting. */

-- Find the total orders per month 
select month(`order date`) as Month , monthname(`order date`) as Month_Name , count(*) as `Total Orders` from swiggy group by Month , Month_Name order by Month;
/* Insight: January leads with 25,398 orders, followed closely by August (25,231) and May (25,190). Orders are remarkably consistent month-on-month with no dramatic seasonal spike — demand is steady year-round.*/

-- Find total orders per week number. Which week had the most orders?
select week_no,count(*) as `Total Orders` from swiggy group by week_no order by `Total Orders` desc;
/* Insight: Identifying peak weeks helps restaurants prepare stock and Swiggy to plan delivery partner availability in advance. */

-- Find the total orders and average price per quarter, and calculate which quarter has the highest avg price.
select quarter as Quarter, count(*) as `Total Orders` , round(avg(`price (inr)`),2) as avg_Price , round(max(`price (inr)`),2) as Max_Price , round(min(`price (inr)`),2) as Min_Price 
from swiggy group by Quarter order by avg_Price desc;
/* Insight: Q1 has the highest avg price (₹269.07) but Q2 has the most orders (74,163). The avg price difference across quarters is very small (< ₹2) — pricing is stable, volume is what shifts by quarter. */

-- Find the busiest day of the week per city — which day gets the most orders in each city?
select city as City , day as Day , count(*) as `Total Orders` from swiggy  group by City,Day order by City, `Total Orders` desc;
/* Insight:  Saturday dominates as the peak day across most cities — weekend leisure ordering is the primary driver. However sorting by city then orders reveals each city's unique rhythm. */

-- Find the date with the single highest number of orders in the entire dataset.
select `order date` , day(`order date`) as day , dayname(`order date`) as day_name , month(`order date`) as month , monthname(`order date`) as month_name , count(*) as `Total Orders`
from swiggy group by `order date` order by `Total Orders` desc limit 1;
/* Insight:  The single busiest date is 22nd February 2025 (Saturday) with 1,550 orders — a Saturday in February, possibly tied to a Valentine's season weekend or a major Swiggy promotional event. */

-- How many orders were placed on weekends (Saturday + Sunday) vs weekdays? Show count and percentage.
select
case when `day` in ("Sat","Sun") then "Weekend" else "Weekday" end as Day_Type, 
count(*) as "Total Orders", concat(round(count(*) * 100.0 / sum(count(*)) over(),2)," %") as Percentage
from swiggy group by day_type;
/* Insight:  Weekdays account for 70.92% of orders (1,40,018) vs weekends at only 29.08% (57,412) — OPPOSITE of what was assumed. Swiggy's core audience is actually need/habit 
driven on weekdays, not just leisure weekend ordering. Weekdays = 5 days, weekends = 2 days, yet weekdays dominate even proportionally (~14% per day vs ~14.5% per day — nearly equal) */

-- *****************************************************************************************************************************************************
-- *****************************************************************************************************************************************************

-- Create a price category label for every dish: Budget → below ₹150 Mid-Range → ₹150 to ₹400 Premium → ₹400 to ₹800 Luxury → above ₹800 Show dish name, price, and the label. limit 20.
select `dish name`,`price (inr)`,`food type`,city,
    case 
        when `price (inr)` < 150 then 'Budget'
        when `price (inr)` Between 150 and 400 then 'Mid-Range'
        when `price (inr)` Between 401 and 800 then 'Premium'
        else 'Luxury'
    end as price_category
from swiggy
limit 20;
/* Insight: Most dishes are Mid-Range (₹150–₹400) — confirms Swiggy's menu is dominated by everyday affordable meals, not luxury dining. */

-- count how many dishes fall in each price category
select 
case when `price (inr)` < 150 then 'Budget' when `price (inr)` Between 150 and 400  then 'Mid-Range' when `price (inr)` Between 401 and 800  then 'Premium' else 'Luxury'
end  as price_category, count(*)  as total_dishes, concat(round(count(*) * 100.0 / sum(count(*)) over(), 2), ' %') as percentage
from swiggy group by price_category order by total_dishes desc;
/* Insight: Mid-Range leads at 58.51% (1,15,514 dishes), Budget at 27.45%, Premium at 11.86%, Luxury only 2.18% — the platform is value-market driven. */

-- Create a restaurant performance label based on average rating:
select `restaurant name`, city, round(avg(rating), 2) as avg_rating, sum(`rating count`) as total_reviews,
    case  when avg(rating) < 3.5  then 'Poor' when avg(rating) < 4.0  then 'Average' when avg(rating) < 4.5  then 'Good'
	else 'Excellent' end  as performance_label
from swiggy group by `restaurant name`, city having sum(`rating count`) >= 50 order by avg_rating desc;
/* Insight: Restaurants are classified by avg rating — 'Good' and 'Excellent' labels dominate, showing Swiggy's onboarding quality filter is effective. */

-- Flag each order as 'Weekend' or 'Weekday' and as 'Veg' or 'Non-Veg' 
select concat( case when `day` in ('Sat','Sun') then 'Weekend' else 'Weekday' end, ' | ' ,`food type`) as order_segment,
count(*) as total_orders, round(avg(`price (inr)`), 2) as avg_price 
from swiggy group by order_segment order by total_orders desc;
/* Insight: 'Weekday | Veg' is the biggest segment (99,745 orders, avg ₹240) — daily habit-based Veg ordering drives Swiggy's core volume, not weekend splurges. */

-- Find all dishes that are priced above the overall average price of the entire dataset.
select `dish name`,`price (inr)`,`food type`,city
from swiggy where `price (inr)` > (select avg(`price (inr)`) from swiggy)
order by `price (inr)` desc;
/* Insight: 77,848 dishes (39.4%) are priced above the platform avg of ₹268.51 — meaning a large portion of menu items target the premium-and-above customer. */

-- *****************************************************************************************************************************************************
-- *****************************************************************************************************************************************************


-- Created View for each city for taking 
create view vw_city_summary as
select city, count(*) as total_orders, count(distinct `restaurant name`) as total_restaurants,
 round(avg(`price (inr)`), 2) as avg_price, round(avg(rating), 2) as avg_rating
from swiggy group by city;

select * from vw_city_summary order by total_orders desc;
/* Insight: Views abstract complexity — anyone on the team can run SELECT * FROM vw_city_summary without knowing the underlying aggregation logic. Standard practice in production databases. */

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Created View for top rated dishes 
create view vw_top_rated_dishes as
select city, `restaurant name`, `dish name`, `food type`, `price (inr)`, rating, `rating count`
from swiggy where rating > 4.5 and `rating count` >= 100;

select * from vw_top_rated_dishes
order by rating desc, `rating count` desc;
/* Insight: This curated 'best dishes' view lets marketing teams pull promotional content instantly without touching the raw 197K row table — a real-world performance and access pattern. */
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Created a Stored Procedure for getting city information  by city name and order count 
delimiter ==
create procedure GetTopDishes( in city_name varchar(100), in top_n int )
begin
select `dish name`, `food type`, count(*) as order_count, round(avg(`price (inr)`), 2) as avg_price, round(avg(rating), 2) as avg_rating
from swiggy where city = city_name group by `dish name`, `food type` order by order_count desc limit top_n;
end==
delimiter ;

call GetTopDishes('Bengaluru', 10); call GetTopDishes('Mumbai', 5); call GetTopDishes('Hyderabad', 3);
/* Insight: Parameterized procedures eliminate repetitive SQL — pass any city and limit to instantly get top dishes. This is how real reporting pipelines and dashboards are powered. */


-- Created a procedure for getting city  report at glance
delimiter ==
create procedure cityreport(in city_name varchar(100))
begin
select city, count(*) as total_orders, count(distinct `restaurant name`) as total_restaurants, round(avg(`price (inr)`), 2) as avg_price, round(avg(rating), 2) as avg_rating
from swiggy where city = city_name group by city;
end==
delimiter ;

call cityreport('Bengaluru'); call cityreport('Mumbai');
/* Insight: A city-level report on demand gives operations teams instant visibility — one CALL replaces a complex multi-condition query every time a city needs to be reviewed. */




















