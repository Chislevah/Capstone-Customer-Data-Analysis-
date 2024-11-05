Select * from [dbo].[LITA Capstone Dataset CUSTOMER DATA]

Alter table [dbo].[LITA Capstone Dataset CUSTOMER DATA]
drop column COLUMN12, COLUMN13, COLUMN14, COLUMN15, COLUMN16, COLUMN17, COLUMN18,COLUMN19, COLUMN20  

Select customerid, count (*)
from [dbo].[LITA Capstone Dataset CUSTOMER DATA]
group by CustomerId
having COUNT(*) >1

with duplicate as (
select *,
row_number() over(partition by customerid order by customerid) as rownum
from [dbo].[LITA Capstone Dataset CUSTOMER DATA]
)
delete from duplicate
where rownum >1

Alter table [dbo].[LITA Capstone Dataset CUSTOMER DATA]
Add Constraint pk_customerID primary key (customerid)

----------------- retrieve the total number of customers from each region. ------------------------------
SELECT region, COUNT(CustomerID) AS total_customers
FROM [dbo].[LITA Capstone Dataset CUSTOMER DATA]
GROUP BY region

-------------------find the most popular subscription type by the number of customers. -----------------
SELECT TOP 1 SubscriptionType, COUNT(*) AS total_customers
FROM [dbo].[LITA Capstone Dataset CUSTOMER DATA]
GROUP BY SubscriptionType

------------------find customers who canceled their subscription within 6 months. ---------------------
SELECT CustomerName, CustomerID, subscriptionstart, SubscriptionEnd, SubscriptionType,Subsciption_duration
from [dbo].[LITA Capstone Dataset CUSTOMER DATA]
WHERE Canceled = 'true'
and DATEDIFF(MONTH, SubscriptionEnd, SubscriptionStart) = 6

------------------ calculate the average subscription duration for all customers. ---------------------
SELECT customerid, avg(Subsciption_duration) AS avg_duration from [dbo].[LITA Capstone Dataset CUSTOMER DATA]
group by CustomerID 

SELECT avg(Subsciption_duration) AS avg_duration from [dbo].[LITA Capstone Dataset CUSTOMER DATA]

----------------------find customers with subscriptions longer than 12 months. --------------------
SELECT CustomerName, CustomerID, subscriptionstart, SubscriptionEnd, SubscriptionType,Subsciption_duration, Revenue
from [dbo].[LITA Capstone Dataset CUSTOMER DATA]
WHERE Subsciption_duration> 365

--------------------------calculate total revenue by subscription type------------------------
SELECT SubscriptionType, SUM(revenue) AS total_revenue
from [dbo].[LITA Capstone Dataset CUSTOMER DATA]
GROUP BY SubscriptionType

SELECT SUM(revenue) AS total_revenue from [dbo].[LITA Capstone Dataset CUSTOMER DATA]

-----------------find the top 3 regions by subscription cancellations. -------------------------
SELECT top 3 region, COUNT(*) AS total_cancellations
from [dbo].[LITA Capstone Dataset CUSTOMER DATA]
WHERE Canceled = 'true'
GROUP BY region
ORDER BY total_cancellations DESC

----------------find the total number of active and canceled subscriptions. ------------------------
SELECT Canceled, COUNT(CustomerID) AS customer_count
from [dbo].[LITA Capstone Dataset CUSTOMER DATA]
group by Canceled

--------------revenue analysis( monthly revenue & revenue by susbcription type)------------------------
select YEAR( SubscriptionStart) as year, MONTH(SubscriptionStart) as months, sum(revenue) as total_revenue
from [dbo].[LITA Capstone Dataset CUSTOMER DATA]
group by SubscriptionStart
order by total_revenue desc

---------------average revenue per customer-------------------------
select SubscriptionType, sum(revenue) as total_revenue
from [dbo].[LITA Capstone Dataset CUSTOMER DATA]
group by SubscriptionType
order by total_revenue desc

---------------customer with longest subsription duration-------------------------
select top 10 CustomerID, CustomerName, Subsciption_duration, Revenue, Canceled
from [dbo].[LITA Capstone Dataset CUSTOMER DATA]
order by Subsciption_duration desc

---------------churned rate----------------------------
select 
(COUNT(case when  churned_customers ='true' then customerid end) *1.0) / count (customerID) as churned_rate
from [dbo].[LITA Capstone Dataset CUSTOMER DATA]

select 
(COUNT(case when  churned_customers ='true' then customerid end) *1.0) / count (customerID) * 100 as churned_rate_percentage
from [dbo].[LITA Capstone Dataset CUSTOMER DATA]

select 
(COUNT(case when  Canceled ='1' then customerid end) *1.0) / count (customerID) * 100 as churned_rate_percentage
from [dbo].[LITA Capstone Dataset CUSTOMER DATA]

select * from [dbo].[LITA Capstone Dataset CUSTOMER DATA]