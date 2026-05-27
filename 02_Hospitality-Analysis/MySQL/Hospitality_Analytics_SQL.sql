-- 1. Total Revenue
select concat(round(sum(revenue_generated)/10000000,2),"Cr") as "Revenue Generated",
	   concat(round(sum(revenue_realized)/10000000,2),"Cr") as "Revenue Realized"
from fact_bookings;


-- 2. Occupancy 
select concat(round(count(booking_id)/1000,2),"K") as "Total Booking"
from fact_bookings;


-- 3. Cancellation Rate ( % )
select concat(round(sum(case when booking_status = "Cancelled" then 1 else 0 end )/ count(*) * 100,2)," %") as "Cancellation Rate"
from fact_bookings;
select * from fact_bookings;


-- 4. Total Succesfull Booking and Total Capacity
select  concat(round(sum(successful_bookings)/1000,2),"K") as "Successfull Bookings",
		concat(round(sum(capacity)/1000,2),"K") as "Capacity Available"
from fact_aggregated_bookings;


-- 5. Utilize Capacity
SELECT
concat(round(SUM(CASE WHEN booking_status = 'Checked Out' THEN 1 ELSE 0 END)/1000,2),"K") AS "Utilized Capacity"
FROM fact_bookings;


-- 6. Trend Analysis
select year(booking_date) as Year, monthname(booking_Date) as Month, 
concat(round(sum(revenue_realized)/10000000,2)," M") as "Total Revenue in Millions"
from fact_bookings
group by year(booking_date), monthname(booking_Date)
order by year(booking_date), monthname(booking_Date);

-- 7. Weekday  & Weekend  Revenue and Booking
select d.day_type as Day_Type, 
concat(round(sum(f.revenue_realized)/10000000,2)," Cr") as "Total Revenue", 
concat(round(count(f.booking_id)/1000,2),"K") as "Total Bookings"
from dim_date d join fact_bookings f
on d.date = f.check_in_date
group by d.day_type;

-- 8. Revenue by State & hotel
select h.city as State, h.property_name as "Property",
	   concat(round(sum(f.revenue_realized)/1000000)," M") as "Total Revenue"
from dim_hotels h left join fact_bookings f
on h.property_id = f.property_id
group by State,Property
order by sum(f.revenue_realized) desc ;


-- State Wise Revenue
select h.city as State,
	   concat(round(sum(f.revenue_realized)/10000000)," Cr") as "Total Revenue"
from dim_hotels h left join fact_bookings f
on h.property_id = f.property_id
group by State
order by sum(f.revenue_realized) desc ;


--  9. Class Wise Revenue
select r.room_Class as Class,
	   concat(round(sum(f.revenue_realized)/10000000,2)," Cr") as "Total Revenue"
from dim_rooms r left join fact_bookings f
on r.room_id = f.room_category
group by room_class
order by sum(f.revenue_realized) desc ;

-- 10. Checked out cancel No show
select booking_status, count(*) as Count
from fact_bookings
group by booking_status;

-- 11. Weekly trend Key trend (Revenue, Total booking, Occupancy) 
select d.weekno as week, sum(f.revenue_realized) as Total_Revenue,count(f.booking_id) as Total_Booking
from dim_date d join fact_bookings f 
on d.date = f.check_in_date
group by weekno;






