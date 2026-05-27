create database adventure_works;
use adventure_works;

# 1. Lookup the productname from the Product sheet to Sales sheet.
select p.productkey,p.EnglishProductName,sum(f.salesamount) as "Total Sales"
from dimproduct p join fact_internet_sales_new f
on f.productkey = p.productkey
group by p.ProductKey,p.EnglishProductName
order by p.productkey asc;

# 2. Lookup the Customerfullname from the Customer and Unit Price from Product sheet to Sales sheet.
select c.customerkey,concat(c.firstname ," ",c.MiddleName," " ,c.lastname) as "Full Name" ,
p.EnglishProductName, f.unitprice 
from dimcustomer c join fact_internet_sales_new f
on c.CustomerKey = f.CustomerKey join dimproduct p
on f.ProductKey = p.Productkey;

-- 3. Calcuate the following fields from the Orderdatekey field ( First Create a Date Field from Orderdatekey )
select 
	OrderDate,
	year((OrderDate)) as Year,
	month(OrderDate) as Month,
    monthname(OrderDate) as "Month Name",
    concat("Qtr","-",Quarter(OrderDate)) as Quarter,
    concat(year(orderdate)," - ",left(monthname(orderdate),3)) as "Year Month",
	weekday(OrderDate)+1 as "Weekday No",
    dayname(OrderDate) as "Weekday Name",
    CASE
	WHEN MONTH(OrderDate) >= 4 THEN MONTH(OrderDate) - 3
	ELSE MONTH(OrderDate) + 9
	END AS "Financial Month",

    CASE
	WHEN MONTH(OrderDate) BETWEEN 4 AND 6 THEN 'Q1'
	WHEN MONTH(OrderDate) BETWEEN 7 AND 9 THEN 'Q2'
	WHEN MONTH(OrderDate) BETWEEN 10 AND 12 THEN 'Q3'
	ELSE 'Q4'
	END AS "Financial Quarter" 
 from fact_internet_sales_new;


-- 4.Calculate the Productioncost uning the columns(unit cost ,order quantity)
SELECT ProductStandardCost , OrderQuantity ,
    (ProductStandardCost * OrderQuantity) AS ProductionCost
FROM fact_internet_sales_new;


-- 5.Calculate the SalesAmount using the columns(unit cost ,order quantity)
SELECT UnitPrice , OrderQuantity , UnitPriceDiscountPct ,
    (UnitPrice * OrderQuantity * (1-UnitPriceDiscountPct)) AS SalesAmount
FROM fact_internet_sales_new;


-- 6. Calculate the profit.
SELECT concat(round(SUM( (UnitPrice * OrderQuantity * (1 - UnitPriceDiscountPct)) - (ProductStandardCost * OrderQuantity))/1000000,2)," M") As Total_Profit
FROM fact_internet_sales_new;

-- 7. Month wise Sales
select monthname(orderDate) as Month,concat(round(sum(salesamount)/1000000,2)," M") as Sales
from fact_internet_sales_new 
group by monthname(orderdate) 
order by sum(SalesAmount) desc;

-- 8. Year wise Sales
select year(orderdate) as Year,concat(round(sum(salesamount)/1000000,2)," M") as Sales
from fact_internet_sales_new
group by Year
order by Year asc;

-- 9. Quarter wise Sales
select concat("Q-",Quarter(orderdate)) as Quarter,concat(round(sum(salesamount)/1000000,2)," M") as Sales
from fact_internet_sales_new
group by Quarter
order by Quarter asc;



-- KPI ( total sales , order quantity , total profit , Distinct Orders )
create view KPI as 
select concat(round(sum(SalesAmount)/1000000,2)," M") as "Total Sales",
concat(round(count(OrderQuantity)/1000,2)," K") as "Order Quantity" ,
concat(round(sum((UnitPrice * OrderQuantity * (1 - UnitPriceDiscountPct)) - (ProductStandardCost * OrderQuantity))/1000000,2)," M") as "Total Profit",
concat(round(count(distinct salesordernumber)/1000,2)," K") as "Distinct Orders"
from fact_internet_sales_new;
 
select * from KPI;


-- 11. Customer wise Data using Stored Procedure
Delimiter ==
create procedure CustInfo( in A int)
Begin
select c.CustomerKey,concat(c.firstname ," ",c.MiddleName," " ,c.lastname) as "Full Name",
sum(f.salesamount),count(distinct(f.orderquantity))
from dimcustomer c join fact_internet_sales_new f 
on c.CustomerKey = f.CustomerKey
Where c.CustomerKey = A
group by c.CustomerKey,concat(c.firstname ," ",c.MiddleName," " ,c.lastname);
End ==
delimiter ;
call custinfo(11002);
