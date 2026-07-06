-- queries on retail_sales
use hero; -- database "hero"
select* from retail_sales;
select invoice_id,city,category,brand,units,revenue from retail_sales;
select distinct(invoice_id) from retail_sales;
select count(*) from retail_sales;
-- aggregation functions
select round(sum(revenue),3) as total_revenue from retail_sales;

select round(avg(margin),3) as Total_Profit,category from retail_sales group by category;
select max(revenue) as Max_revenue,category  from retail_sales group by category ;
-- max revenue based on high units along with distinct categories
select max(revenue) as max_revenue,category,units from retail_sales
 where units= (select max(units) from retail_sales) group by category,units;
 select max(units) as max_units from retail_sales;
 -- min revenue  based on category,units
 select min(revenue),category,units from retail_sales 
 where units=(select min(units) from retail_sales) group by category,units;
 
 -- LOYALTY_FLAG COUNT
  select count(loyalty_flag) from retail_sales;
 select count(loyalty_flag) from retail_sales where loyalty_flag=1;
 select count(loyalty_flag) from retail_sales where loyalty_flag=0;
 -- just checking null value is present or not
 select count(loyalty_flag) from retail_sales where loyalty_flag='null';
 select max(loyalty_flag) from retail_sales;
 
 
 -- top N cities
 select brand,city,revenue from retail_sales order by revenue desc limit 5;
 select sum(revenue) as total_revenue,category from retail_sales group by category order by total_revenue limit 5  ;
 
 
 
 select sum(margin) as Total_profit from retail_sales;
 
 -- group by --
 select sum(revenue) as total_revenue,category from retail_sales group by category;
 select sum(revenue) as total_revenue,city from retail_sales group by city;
select sum(revenue) as total_revenue,brand from retail_sales group by brand;

---- window functions
select avg(selling_price) over() sp,category from retail_sales ;
select category,invoice_id,cost_price,selling_price,revenue,margin,rank() over(category order by revenue desc) as rk from retail_sales;
 
select category,invoice_id,cost_price,selling_price,revenue,margin,rank() over(partition by category order by revenue desc) as rk from retail_sales;
select category,invoice_id,cost_price,selling_price,revenue,margin,dense_rank() over(partition by category order by revenue desc) as drk from retail_sales;
