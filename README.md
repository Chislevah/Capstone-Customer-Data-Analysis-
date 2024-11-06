# Capstone-Customer-Data-Analysis-


## Project Tittle: Capstone Customer Analysis
---

### Overview of the Project
---
This project is a comprehensive customer data analysis focused on customer and subscription data. It integrates Power BI, SQL, and Excel to provide multi-faceted insights into revenue generation, customer activity, and subscription trends. The repository is designed to demonstrate end-to-end data analysis, showcasing how data can be transformed into actionable insights through various analytical tools.


### Project Goals 
---
- To visualize key performance metrics and trends using Power BI.
   
- To extract and analyze data using SQL queries for deeper insights.
  
- To leverage Excel for supplementary analysis and reporting.
  
- To provide a cohesive understanding of customer behavior, revenue trends, and churn rates.


### Data Analysis Tools
---
1. Microsoft Excel
2. SQL Server
3. GitHub
4. Power BI
   
   
### Key Components 
---
1. Power BI Analysis:
   - Purpose: Create interactive dashboards and reports to present key insights.
   -  Key Visuals: KPI Cards for tracking total revenue, active customers, and churn rates.
      1. LIne Charts showing revenue trends and churn rates over time.
      2.  Bar Charts for regional revenue comparisons and customer segmentation.
   - Features: Detailed DAX measures for calculating active customers, churned customers, and revenue metrics. Dynamic visuals with slicers for region, subscription date, and subscription type filters.

2. SQL Analysis:
   - Purpose: Extract and manipulate data directly from the database for custom reporting and deeper analysis.
   -  Example Queries: Revenue Analysis Query: Calculate revenue by product and region. Churn Analysis Query: Identify churned customers based on subscription end and cancellation data.
   -  SQL Features: Declaration of a primary key so as to help check the authenticity of the dataset and the integrity of the analysis while working with aggregation functions to analyze data.

 3. Excel Analysis:
    - Purpose: Conduct supplementary analysis, create reports, and visualize data using Excel’s pivot tables, charts, and formulas.
    -  Key Analyses: Pivot tables summarizing revenue by region and product. Custom charts to illustrate customer growth and segmentation. Use of Excel functions for calculating active and churned customers.


### What You Can Learn from This Project
---
- BI Techniques: How to create interactive dashboards, design visuals for KPIs, and write DAX formulas.
- SQL Skills: Techniques for data extraction and custom SQL reporting to support business analysis.
- Excel Analysis: How to use pivot tables, charts, and functions to complement BI and SQL insights.
  

#### Data Analysis with Excel
---
To analyze this customer data, I first of all created some new columns to help me through my analyses. They columns I created, I named; churned customers, subscription duration and subscription start date.
1.	Churned customers: created using conditional formatting.
```excel
=IF(false, 1,0)
```
 This means that if canceled is true it should return 1 but if it’s false it should return 0. The false or 0 represents the active customers while the true or 1 represents the churned customers. This column was created in order to be able to run analysis, on actual figures since analysis on text are limited on excel.
2.	Subscription duration. The next column I created, was the subscription duration column. This column was created in order to know the duration of period or the time frame it took from the beginning of the listing till the end of the listing. It’s calculated thus; 
```excel
= subscription end – subscription start.
```
3.	Subscription start date: This column was created in order to help format the subscription start into ‘yyyy-mm’ format. This means that the subscription duration would now be in a format of the year and month only. This is an optional column. The formula is;
```excel
=TEXT( subscription start, ‘yyyy-mm’).
```
The following are some other steps are applied in running some calculations on my dataset.

a.	Revenue loss due to churn: 
```excel
= SUMIF(Canceled, True, Revenue).
```
b.	Revenue gained:
```excel
= SUMIF(Canceled, False, Revenue).
```
c.	Total expected revenue: 
```excel
=SUM(Revenue)
```
d.	Total number of churned customers: 
```excel
=COUNTIF(churned customers, True).
```
e.	Churned rate: 
```excel
= SUM(Churned customers)/ COUNT(Customer id).
```
f.	Average subscription duration:
```excel
= AVG(subscription duration)
```
g.	Total number of basic subscription: This applies to the other subscription types too, with slight change made on the criteria alone.
```excel
COUNTIF(subscription type, basic).
```

Pivot Table Presentation (insert a new sheet for pivot table presentation)
- Revenue by Region: Use a Pivot Table to group by region and calculate total revenue.
Insert a Pivot Table. Drag Region to the "Rows" area and Revenue to the "Values" area.

- 	Revenue by Product: Similar to region analysis, you can group by product to see how much each product contributes to total revenue. In the Pivot Table, drag Product to the "Rows" area and Revenue to the "Values" area.
   
- 	Revenue by Subscription Type: Use a Pivot Table to group revenue by subscription type (e.g., monthly, yearly). Insert a Pivot Table. Drag Subscription Type to the "Rows" area and Revenue to the "Values" area.
   
- Count of Subscription Types: Count how many customers are subscribed to each type: Insert a Pivot Table. Drag Subscription Type to the "Rows" area.mDrag Customer ID to the "Values" area (set it to "Count").
  
- Churn by Subscription Type/Region: Use a Pivot Table to group churned customers by subscription type or region to see if certain segments have higher cancellation rates. Drag Cancelled to the "Rows" area, Subscription Type (or Region) to the "Rows" area, and Revenue to the "Values" area. Set the count of Cancelled to show the number of churned customers.
  
- Subscription Start Analysis (Growth Over Time): Use a Pivot Table with Month/Year in the "Rows" area and Customer ID in the "Values" area (set to "Count") to see how many new subscriptions were added per time period.
  
- Customer Segmentation: Identify top customers based on revenue. Use a Pivot Table with Customer Name (or Customer ID) in the "Rows" area and Revenue in the "Values" area. Sort by total revenue to find high-value customers.
  
- Customer Lifetime Value (CLTV): Calculate the total revenue each customer has brought in. Use a Pivot Table with Customer ID in the "Rows" area and Revenue in the "Values" area.
  
- Segmentation by Region: Group customers by region and analyze total revenue and churn by region.
  
-  Revenue from Active vs. Cancelled Customers: Create a Pivot Table showing the count of active vs. cancelled customers. Drag Cancelled to the "Rows" area and Customer ID to the "Values" area (set to "Count"). In the same Pivot Table, add Revenue to the "Values" area to analyze the total revenue from active vs. cancelled customers.

-  Retention by Subscription Type: To see how long customers are retaining their subscriptions by type. Use a Pivot Table with Subscription Type in the "Rows" area and the new column for Subscription Duration in the "Values" area (set to "Average").
  
-  Average Revenue by Subscription Type: Use a Pivot Table to find the average revenue per subscription type. Insert Subscription Type in the "Rows" area and Revenue in the "Values" area. Change the calculation in the Pivot Table to show the average revenue by going to Value Field Settings and selecting Average.
 
-	Cancelled Subscriptions by Product: Identify which products have higher cancellation rates. Use a Pivot Table with Product in the "Rows" area, Cancelled in the "Columns" area, and Customer ID (set to "Count") in the "Values" area.
  
-	Subscription Duration by Region: Analyze if subscriptions tend to last longer in certain regions. Insert a Pivot Table with Region in the "Rows" area and Subscription Duration in the "Values" area (set to "Average").
  
-	Most Popular Subscription Type: Drag Subscription Type to the "Rows" area. Drag Customer ID to the "Values" area, and make sure it shows "Count of Customer ID." This will show the number of customers subscribed to each subscription type. In the Pivot Table, click the drop-down arrow next to Subscription Type. Choose Sort Largest to Smallest based on the count of Customer ID. The subscription type at the top of the list is the most popular one.

<img width="960" alt="Screenshot 2024-11-05 133649" src="https://github.com/user-attachments/assets/20268883-ac0d-4f92-95fb-5d84ebeda29d">

<img width="960" alt="Screenshot 2024-11-05 133616" src="https://github.com/user-attachments/assets/8000ab96-87a1-4be0-8cff-a2840b1fe7d5">

<img width="960" alt="Screenshot 2024-11-05 133452" src="https://github.com/user-attachments/assets/e25b5236-f2b8-4022-bb09-a6428e31387e">

<img width="960" alt="Screenshot 2024-11-05 133649" src="https://github.com/user-attachments/assets/2b326d25-b013-4b8b-9ee1-5e4feb928c96">

Data visualization on Excel:
- Trend Analysis (Graph): Create a line chart to visualize the trend of new subscriptions over time.
- 	Visualize the data using a pie chart to show the proportion of active and cancelled customers.
- 	Visualization using Bar Charts for comparing regions, products, or subscription types.

<img width="960" alt="Screenshot 2024-11-05 133745" src="https://github.com/user-attachments/assets/3eecf837-14d9-4610-8b52-b0549df6a2e6">

<img width="960" alt="Screenshot 2024-11-05 133832" src="https://github.com/user-attachments/assets/bd3ed1b1-1612-4776-bc9a-2c3a0507d29c">

<img width="960" alt="Screenshot 2024-11-05 133911" src="https://github.com/user-attachments/assets/fe108287-d294-4b1d-aa57-41413cb49c8e">


#### Analysis with SQL
---
Since I’ve already given  detailed explanation on how to import my data into my SSMS in my sales repository, I’ll go straight to the various analysis I ran on my customer data. After importing my sales data into my database, the first query I ran was to be able to see the results of my newly imported table. 
```SQL
Select * from [dbo].[LITA Capstone Dataset CUSTOMER DATA SET]
```
This showed me the result of  my table with the fields and a total of 75,000 records. The importation process was quite easy up till the point I got to declaring my primary key. I was confused at first because I assumed I had thoroughly cleaned my data on excel before turning it to a CSV file, but to my amazement I was completely wrong. I still carried out my analysis based on the 75,000 records, until I stumbled on a chat in our data analysis group chat on telegram, God bless those ladies because I owe part of the success of this project to them. So to cut the long story short, I began my research and found out that while it’s not really necessary to declare a primary key it’s quite important cause it helps in cleaning the data and removing duplicates so as to ensure data integrity. If time permitted maybe I may have given analysis based on my unclean data but for purpose of this project I’ll work with my cleaned data. So I had to run another analysis to completely clean my data on SQL. It wasn’t easy but it was absolutely worth it. At the end I had a total of 20 records after cleaning my file in SQL.

Below is the outline of the SQL queries that was used for each task:

a.	Retrieve the total number of customers from each region: this return the total number of customers in each region.
```sql
SELECT region, COUNT(CustomerID) AS total_customers FROM [dbo].[LITA Capstone Dataset CUSTOMER DATA SET] GROUP BY region]
```

b.	Find the most popular subscription type by the number of customers: this returns the most popular subscription type from amongst other subscription types.
```sql
SELECT TOP 1 SubscriptionType, COUNT(*) AS total_customers
FROM [dbo].[LITA Capstone Dataset CUSTOMER DATA SET]
GROUP BY SubscriptionType
```

c.	 Find customers who canceled their subscription within 6 months: this would return the total number of customers who canceled their subscription within six month from the subscription start date to the subscription end date.
```sql
SELECT CustomerName, CustomerID, subscriptionstart, SubscriptionEnd, SubscriptionType,Subsciption_duration
from [dbo].[LITA Capstone Dataset CUSTOMER DATA SET]
WHERE Canceled = 'true' and DATEDIFF(MONTH, SubscriptionEnd, SubscriptionStart) = 6
```

d.	 Calculate the average subscription duration for all customers: For calculating the average duration, I used two method one returned avg sub for all customers while the other returned the avg sub as a whole. 
```sql
SELECT customerid, avg(Subsciption_duration) AS avg_duration from [dbo].[LITA Capstone Dataset CUSTOMER DATA SET] group by CustomerID
```

```sql
SELECT avg(Subsciption_duration) AS avg_duration from [dbo].[LITA Capstone Dataset CUSTOMER DATA SET]
```

e.	Find customers with subscriptions longer than 12 months: this calculate the total number of customers with subscriptin duration longer than 12month or 365days
```sql
SELECT CustomerName, CustomerID, subscriptionstart, SubscriptionEnd, SubscriptionType,Subsciption_duration, Revenue from [dbo].[LITA Capstone Dataset CUSTOMER DATA SET] WHERE Subsciption_duration> 365
```

f.	Calculate total revenue by subscription type: this would return the amt of revenue generated by each region.
```Sql
SELECT SubscriptionType, SUM(revenue) AS total_revenue from [dbo].[LITA Capstone Dataset CUSTOMER DATA SET] GROUP BY SubscriptionType
```

g.	 Find the top 3 regions by subscription cancellations: this would give you the top three regions with the highest rate of churned customers.
```sql
SELECT top 3 region, COUNT(*) AS total_cancellations from [dbo].[LITA Capstone Dataset CUSTOMER DATA SET] WHERE Canceled = 'true' GROUP BY region ORDER BY total_cancellations DESC
```

h.	Find the total number of active and canceled subscriptions: this analysis would calculate the total number of canceled and active customers
```sql
SELECT Canceled, COUNT(CustomerID) AS customer_count from [dbo].[LITA Capstone Dataset CUSTOMER DATA SET] group by Canceled
```


Data Visualization with SQL

I also ran some further analysis for the benefit of it. This analysis can be found in the actual work or seen from my screenshots.

<img width="960" alt="Screenshot 2024-11-05 134110" src="https://github.com/user-attachments/assets/3de4299d-600e-4c2e-8211-467cce2fe0e5">

<img width="960" alt="Screenshot 2024-11-05 134217" src="https://github.com/user-attachments/assets/c32a5693-e159-4924-bf46-0ee7191bff56">

<img width="960" alt="Screenshot 2024-11-05 134320" src="https://github.com/user-attachments/assets/967f9195-b7c9-42b4-93f4-3cb6fcaa5bc8">

<img width="960" alt="Screenshot 2024-11-05 134500" src="https://github.com/user-attachments/assets/dcc1e97f-94aa-422a-993f-75036df120bf">

<img width="471" alt="Screenshot 2024-11-05 134638" src="https://github.com/user-attachments/assets/addd5e8d-d9e9-4a54-ade1-1fdec0f2b7b5">

<img width="960" alt="Screenshot 2024-11-05 134916" src="https://github.com/user-attachments/assets/00ea5e52-83a8-45cc-b3ef-48958906a103">


#### POWERBI –CUSTOMER-ANALYSIS
---
After importing my data from my excel workbook into my bi, I had to clean my data cause if you remember I mentioned my excel didn’t do the work. I think it partly because I’m working with a 2007 excel workbook. 
So I transformed my data, deleted the null column, imputed some conditional columns and made my data type to be accurate. I closed and applied my changes. I calculated some columns and measures on my table view, which can be seen below:

-	Total Revenue: Sum of revenue from all customers.
Measure: Create a DAX measure for total revenue, such as; 
```DAX
Total Revenue = SUM('Dataset'[Revenue])
```

-	Active Subscriptions: Count of active subscriptions at any given time (subscriptions where the current date is between subscription starts and subscription end and cancelled is false).
```DAX
Active Subscriptions = COUNTROWS(FILTER('Dataset', 'Dataset'[Cancelled] = FALSE && TODAY() >= 'Dataset'[Subscription Start] && TODAY() <= 'Dataset'[Subscription End]))
```

-	Average Subscription Duration: Average of subscription duration for all customers.
```DAX
Avg Subscription Duration = AVERAGE('Dataset'[Subscription Duration])
```

-	Churn Rate: Percentage of churned customers calculated as.
```DAX
Churn Rate = DIVIDE(COUNTROWS(FILTER('Dataset', 'Dataset'[Churned Customer] = TRUE)), COUNTROWS('Dataset'))
```
- Customer Lifetime Value (CLV): Sum of revenue over the subscription duration for each customer.
```DAX
CLV = SUMX(VALUES('Dataset'[Customer ID]), CALCULATE(SUM('Dataset'[Revenue])))
```

-	Monthly Recurring Revenue (MRR): Sum of monthly revenues from all active subscriptions.
```DAX
MRR = CALCULATE(SUM('Dataset'[Revenue]), FILTER('Dataset', MONTH('Dataset'[Subscription Start]) = MONTH(TODAY()))).
```

-	Customer Retention Rate: Percentage of customers who continue their subscription over a defined period, highlighting loyalty trends.
```DAX
Retention Rate = DIVIDE(COUNTROWS(FILTER('Dataset', 'Dataset'[Cancelled] = FALSE)), COUNTROWS('Dataset')).
```

- New vs. Returning Customers: Count of new customers in a given period compared to returning customers. Helps Understands the balance between acquiring new customers and retaining existing ones.
  
```DAX
New Customers = COUNTROWS(FILTER('Dataset', 'Dataset'[Subscription Start] >= DATE(YEAR(TODAY()), 1, 1)))
Returning Customers = COUNTROWS(FILTER('Dataset', 'Dataset'[Subscription Start] < DATE(YEAR(TODAY()), 1, 1)))
```

Visualizations with BI

I used, line charts and bar charts to show the trend of new and retained subscriptions over time. I also created a time series visual with Order Date or Subscription Start as the x-axis and display the measures above as series, stacked bar charts to compare new and retained subscriptions for different months or years and other visuals are included in the work.
1. Cards
   - Total Revenue: Display the overall revenue.
   - Active Customers: Number of active customers.
   -  Latest and earliest Subscription: Date, month and year of the various subscription periods.
   -  Churn Rate: Percentage of churned customers.
   
2. Line Charts
   - Revenue Over Time: Monthly or quarterly revenue trends.
   - Churn Rate Over Time: Trends in churn rate across months or years.-
   - New vs. Retained Subscriptions: Show changes in new and retained subscriptions over time.
     
3. Bar/Column Charts
   - Revenue by Region: Breakdown of revenue per region.
   - Revenue by Product: Compare revenue generated by different products.
   - Active vs. Churned Customers by Region: Visualize regional trends in active and churned customers.
     
4. Stacked Bar Charts
   - Subscription Types by Region: Show different subscription types stacked by region.
   - New and Retained Subscriptions: Compare counts over time in one chart.
     
5. Pie/Donut Charts
   - Customer Distribution: Proportion of active vs. churned customers.
   - Subscription Type Breakdown: Percentage of customers by subscription type.
     
6. Tree map
   - Revenue Contribution by Product or Region: Visualize which products or regions contribute the most to revenue.
     
7. Tables
   - Detailed Customer Data: Include columns like customer name, ID, subscription type, start date, end date, revenue, and status.
   - Top 10 Customers: Sort customers by revenue to display the top contributors.
     
8. Area Charts
   - Total Revenue and Churn Over Time: Visualize trends with an emphasis on cumulative changes over time.
     
9. Slicers
  - Region, Product, and Subscription Type: Let users filter data across multiple visuals for more detailed insights.
  - Date Filters: Allow filtering by specific time frames (e.g., month, quarter, year).
    
10.  Gauge Chart
  - Churn Rate vs. Target: Visualize how current churn rate measures up against a set target.
    
11. Matrix Visuals
    - Revenue by Region and Product: Present revenue data in a grid format that allows cross-referencing.
    - Customer Count by Subscription Type and Region: Display counts with cross-filtering capabilities.

Actual Visualization

<img width="960" alt="Screenshot 2024-11-05 132638" src="https://github.com/user-attachments/assets/6ec336dd-64b6-44e7-ab64-d522445764b5">

<img width="960" alt="Screenshot 2024-11-05 133146" src="https://github.com/user-attachments/assets/3fa6f217-a1b5-4bbc-a65e-d0f2545ba9e8">

<img width="960" alt="Screenshot 2024-11-05 133100" src="https://github.com/user-attachments/assets/e9375b0f-425b-4baa-95bb-da8fc6271c32">

<img width="960" alt="Screenshot 2024-11-05 132819" src="https://github.com/user-attachments/assets/2af3ba12-031f-42b8-b45a-b097aa67f4a9">

      
### Importance of this Project
---
1. Integrated Approach: Combining Power BI, SQL, and Excel for a comprehensive data analysis strategy.
   
2. Use Cases Business Reporting:Use this project as a blueprint for reporting on customer metrics, revenue performance, and churn analysis.
   
3.  Data-Driven Decision-Making: Inform strategic decisions based on insights into active vs. churned customer trends.
   
4.  Customer Retention Strategies: Identify patterns and regions with high churn rates to implement targeted retention strategies.

   
### Intended Audience Data
---
1. Analysts and BI Developers looking for practical examples of integrating Power BI, SQL, and Excel.
   
2.  Business Managers who need a blueprint for understanding customer behavior and financial performance.
    
3. Students and Learners interested in business intelligence projects and best practices for analysis and reporting. This project serves as an educational and practical example of how businesses can leverage multiple tools for comprehensive data analysis, driving strategic insights and operational improvements






