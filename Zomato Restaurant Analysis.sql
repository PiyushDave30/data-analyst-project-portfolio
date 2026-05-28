/******************************************************
		DATABASE CREATION AND LOADING DATA 
*******************************************************/
create database Zomato; 
use Zomato;

select * from zomato;
truncate table zomato;
drop table zomato;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Zomato Data/Zomato Restaurant Data.csv'
INTO TABLE zomato
CHARACTER SET latin1
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/************************************************************************************************************************************************************/

select * from zomato;
/******************************************************
				CREATED VIEW FOR KPI's
*******************************************************/
create view KPI as 
select 
count(restaurantid) as `Total Restaurants`,
count(distinct(countrycode)) as `Total Countries`,
count(distinct(city)) as `Total Cities`,
count(distinct(cuisines)) as `Total Cuisines`,
count(votes) as `Total Votes`,
round(avg(average_cost_for_two)) as `Avg bill for two`,
round(avg(rating),2) as `Average Rating`,
concat ( count(case when has_online_delivery='yes' then 1 end), ' ( ' , 
round(count(case when has_online_delivery='yes' then 1 end)*100.0 / COUNT(*),2),
'% )') as "Online Delivery %",
concat ( count(case when has_table_booking = 'yes' then 1 end) , ' ( ',
round(count(case when has_table_booking = "yes" then 1 end ) *100.0 / count(*),2),
'% )') as "Table Booking %"
from zomato;

select * from KPI;

/******************************************************** CITY ANALYSIS ************************************************************************/
-- Which city has the highest number of restaurants?
select city,count(*) from zomato group by city order by count(*) desc;

-- Which top 10 cities have most restaurants?
select city,count(*) from zomato group by city order by count(*) desc limit 10;

-- Which city has the highest average rating?
select city ,round(avg(rating),2) as `Avg Rating` from zomato group by city order by avg(rating) desc;

-- Which city has the highest average cost for two?
select city, round(avg(average_cost_for_two),0) as ` Two Person Bill ` from zomato group by city order by avg(average_cost_for_two) desc;

-- Which city offers best value for money? Rating > 4 and avg_cost_for_two <= 1000
select city,count(*) fromzomato where rating > 4 and average_cost_for_two <= 1000 group by city order by count(*) desc;

/***************************************************** REVENUE ANALYSIS *************************************************************************/
-- How does price range affect ratings?
SELECT Price_range, ROUND(AVG(Rating),2) AS Avg_Rating, COUNT(*) AS Restaurants FROM zomato GROUP BY Price_range ORDER BY Price_range;

-- Which price range has maximum restaurants?
SELECT Price_range, COUNT(*) AS Total_Restaurants FROM zomato GROUP BY Price_range ORDER BY Total_Restaurants DESC LIMIT 1;

-- Are premium restaurants always highly rated? ( Assume Price Range 4 is Premium )
SELECT Rating, COUNT(*) AS Total FROM zomato WHERE Price_range = 4 GROUP BY Rating ORDER BY Rating DESC;

-- Find expensive restaurants with poor ratings.
SELECT RestaurantID, City, Cuisines, Price_range, Rating FROM zomato WHERE Price_range = 4 AND Rating < 3 ORDER BY Rating ASC;


/******************************************************
		CUISINE ANALYSIS
*******************************************************/
-- What are the top 10 most popular cuisines?
select cuisines,count(*) fromzomato group by cuisines order by count(*) desc;

-- Which cuisine has the highest average rating?
select cuisines,round(Avg(rating),2) as Avg_Rating from zomato group by cuisines order by avg(rating) desc;

-- Which cuisines are most common in top cities?
select city,cuisines,count(*) fromzomato group by city,cuisines;

/******************************************************
		CUSTOMER BEHAVIOUS ANALYSIS
*******************************************************/
-- Which restaurants have highest votes?
select restaurantid, city, cuisines, votes fromzomato order by Votes desc limit 10;

-- Is higher rating associated with more votes?
select Rating,ROUND(AVG(Votes),0) AS Avg_Votes from zomato group by Rating order by Rating desc;

-- Which restaurants are highly rated but underrated (low votes)?
select restaurantid, city, cuisines, rating, votes from zomato
where rating >= 4.5 and votes < 50 order by rating desc, votes asc;

/*******************************************************************
		CREATED STORED PROCEDURE USING COLUMN NAME AS AN INPUT
********************************************************************/
DELIMITER ==
CREATE PROCEDURE Method(IN col_name VARCHAR(50))
BEGIN
SET @qry = CONCAT(
'SELECT City,
COUNT(*) AS Total_Restaurants,
SUM(CASE WHEN ', col_name, ' = ''Yes'' THEN 1 ELSE 0 END) AS Count_Value,
ROUND(
SUM(CASE WHEN ', col_name, ' = ''Yes'' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2
) AS Percentage
FROM zomato
GROUP BY City
ORDER BY Percentage DESC
LIMIT 10'
);
PREPARE stmt FROM @qry;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END ==
DELIMITER ;

call Method( "has_table_booking" );  -- Calling Procedure
drop procedure Method;

/******************************************************
		ADVANCED ANALYSIS QUESTIONS
*******************************************************/
-- Top 5 restaurants in each city by rating.
SELECT *
FROM ( SELECT RestaurantID, City, Rating,
           DENSE_RANK() OVER(
               PARTITION BY City
               ORDER BY Rating DESC
           ) AS rnk
    FROM zomato
) x
WHERE rnk <= 5;
-- Find cities where ratings are below global average.
SELECT City, ROUND(AVG(Rating),2) AS City_Avg_Rating FROM zomato GROUP BY City HAVING AVG(Rating) < (SELECT AVG(Rating) FROM zomato);

-- Rank cities based on restaurant count.
SELECT City, COUNT(*) AS Total_Restaurants, DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS City_Rank FROM zomato GROUP BY City;

/* Segment restaurants into: Budget Mid-range Premium */
SELECT RestaurantID, City, Average_Cost_for_two,
       CASE
          WHEN Average_Cost_for_two < 1000 THEN 'Budget'
          WHEN Average_Cost_for_two BETWEEN 1000 AND 3000 THEN 'Mid-range'
          ELSE 'Premium' END AS Segment
FROM zomato;

-- Find restaurants with 0 votes but high ratings
select restaurantid,votes from zomato where votes = 0 and rating > 3;

-- Count inactive restaurants
select count(Restaurantid) from zomato where Is_delivering_now = "No";

/************************************************ SERVICES OFFERED *******************************************************************/
-- Impact of Online Delivery on Rating
SELECT Has_Online_Delivery, ROUND(AVG(rating),1) AS Avg_Rating FROM zomato GROUP BY has_online_delivery order by Avg_Rating desc;

-- Impact of Table Booking on Rating
SELECT Has_Table_Booking, ROUND(AVG(rating),1) AS Avg_Rating FROM zomato GROUP BY has_table_booking order by Avg_Rating desc;

-- Which cities have highest online delivery adoption?
SELECT City,COUNT(*) AS Total_Restaurants,SUM(CASE WHEN Has_Online_delivery='Yes' THEN 1 ELSE 0 END) AS Delivery_Count,
ROUND(SUM(CASE WHEN Has_Online_delivery='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Delivery_Pct
FROM zomato GROUP BY City ORDER BY Delivery_Pct DESC LIMIT 10;

select city , count(*) as `Total Restaurant`, sum(case when has_table_booking = "Yes" then 1 else 0 end) as "Delivery Count",
round(sum(case when has_table_booking = "Yes" then 1 else 0 end)*100.0 / count(*),2) as " Delivery Percent"
from zomato group by city ORDER BY "Delivery Percent" DESC limit 10;

/******************************************************
		DELIVERY / BOOKINGS TREND
*******************************************************/

-- Are table-booking restaurants more expensive? 
SELECT Has_Table_booking, COUNT(*) AS Total_Restaurants, ROUND(AVG(Average_Cost_for_two),0) AS Avg_Bill_For_Two
FROM zomato GROUP BY Has_Table_booking order by avg_bill_for_two desc;

-- Restaurants offering both booking + delivery
select count(restaurantid) from zomato where has_online_delivery = "Yes" and has_table_booking = "yes";

-- Which city has most restaurants offering both services top 10?
SELECT City, COUNT(*) AS Both_Services_Count FROM zomato WHERE Has_Online_delivery='Yes' AND Has_Table_booking='Yes' 
GROUP BY City ORDER BY Both_Services_Count DESC LIMIT 10;

-- Which cities have most table booking restaurants?
select City, count(case when has_table_booking = "yes" then 1 end) as Table_Booking_Count from zomato
group by city  ORDER BY Table_Booking_Count DESC limit 10;

