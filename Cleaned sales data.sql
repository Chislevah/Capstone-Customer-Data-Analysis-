Select * from [dbo].[LITA Capstone Dataset SALES DATA SET]

Alter table [dbo].[LITA Capstone Dataset SALES DATA SET]
drop column COLUMN10, COLUMN11, COLUMN12, COLUMN13, COLUMN14

Select customer_id, count (*)
from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Customer_Id
having COUNT(*) >1

with duplicate as (
select *,
row_number() over(partition by customer_id order by customer_id) as rownum
from [dbo].[LITA Capstone Dataset SALES DATA SET]
)
delete from duplicate
where rownum >1

Alter table [dbo].[LITA Capstone Dataset SALES DATA SET]
Add Constraint pk_customer_ID primary key (customer_id)

-----------Retrieve the total sales for each product category. -----------
Select products, count(Total_Revenue) as numb_of_sales from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Products

Select products, sum(Total_Revenue) as total_sales from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Products

Select products, avg(Total_Revenue) as avg_sales from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Products

------------ the number of sales transactions in each region. ------------
Select region, count(Total_Revenue) number_of_sales_transactions_in_each_region from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Region

Select region, avg(Total_Revenue) avg_sales_transactions_in_each_region from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Region

Select region, sum(Total_Revenue) total_sales_transactions_in_each_region from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Region

-------------highest-selling product by total sales value. --------------
Select Products, sum(Total_Revenue) as total_sales from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Products
order by 1 desc

Select Products, count(Total_Revenue) as numb_of_sales from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Products
order by 1 desc

Select Products, avg(Total_Revenue) as avg_sales from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Products
order by 1 desc 
-----------Calculate total revenue per product. -------------
Select Products, sum(Total_Revenue) as total_revenue_per_product from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Products

Select Products, avg(Total_Revenue) as avg_revenue_per_product from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Products

Select Products, count(Total_Revenue) as total_number_of_revenue_per_product from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Products

-------------calculate monthly sales totals for the current year.----------
select YEAR(orderdate) as year, MONTH(orderdate) as month,SUM(total_revenue) as total_sales
from [dbo].[LITA Capstone Dataset SALES DATA SET]
where YEAR(OrderDate) =2024
group by YEAR(OrderDate),MONTH(OrderDate)
order by year, month

select format (orderdate, 'yyyy-mm') as year, SUM(total_revenue) as total_revenue  from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by format (orderdate, 'yyyy-mm')

select format (orderdate, 'yyyy-mm') as year, SUM(total_revenue) as total_revenue  from [dbo].[LITA Capstone Dataset SALES DATA SET]
where YEAR(OrderDate) =YEAR(getdate())
group by format (orderdate, 'yyyy-mm')

------------- top 5 customers by total purchase amount. ---------------
select top 5 Customer_Id,  SUM(Total_Revenue) as total_purchase_amt from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Customer_Id
order by total_purchase_amt desc

select top 5 Products,  SUM(Total_Revenue) as product_revenue from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Products
order by product_revenue desc 


-------------calculate the percentage of total sales contributed by each region.---------------------
WITH total_sales as( 
select SUM(total_revenue) as sumofrevenue
from [dbo].[LITA Capstone Dataset SALES DATA SET] 
)
Select
region,
SUM(total_revenue) as totalrevenue,
(SUM (total_revenue) * 100.0 / (select sumofrevenue from total_sales)) as percentage_of_total_sales 
from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by region

select * from [dbo].[LITA Capstone Dataset SALES DATA SET]

------------Identify products with no sales in the last quarter----------------
SELECT count(Total_Revenue) as total_sales_in_last_quarter, Products
from [dbo].[LITA Capstone Dataset SALES DATA SET]
WHERE DATEPART(QUARTER, orderdate)=3
and YEAR(OrderDate)= 2024
GROUP BY Products

---------------total number of order--------------------
select COUNT(orderid) as total_orders
from [dbo].[LITA Capstone Dataset SALES DATA SET]

-------------------- average order value-----------------
select AVG(total_revenue) as avg_order_value
from [dbo].[LITA Capstone Dataset SALES DATA SET]

---------------------revenue by customers-------------------------
select Customer_Id, SUM(Total_Revenue) as customer_revenue
from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Customer_Id

 -------------------total sales by year and quarter-----------------
 select
YEAR(orderdate) as year,
DATEPART(QUARTER, orderdate)as quarters,
SUM(Total_Revenue) as total_sales
from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by year(orderdate), datepart(quarter, orderdate)
order by year, quarters

-----------------------------------------total sales by region and products-----------------------
Select Products, region, count(Total_Revenue) as total_number_of_revenue_per_product from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Products, Region

Select Products, region, sum(Total_Revenue) as total_revenue_per_product from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Products, Region


Select Products, region, avg(Total_Revenue) as avg_of_revenue_per_product from [dbo].[LITA Capstone Dataset SALES DATA SET]
group by Products, Region

select * from [dbo].[LITA Capstone Dataset SALES DATA SET]