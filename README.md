# Capstone-Customer-Data-Analysis-

### Project Tittle: Capstone Customer Analysis

### Overview of the Project
This project is a comprehensive customer data analysis focused on customer and subscription data. It integrates Power BI, SQL, and Excel to provide multi-faceted insights into revenue generation, customer activity, and subscription trends. The repository is designed to demonstrate end-to-end data analysis, showcasing how data can be transformed into actionable insights through various analytical tools.

### Project Goals 
- To visualize key performance metrics and trends using Power BI. 
- To extract and analyze data using SQL queries for deeper insights. 
- To leverage Excel for supplementary analysis and reporting.
- To provide a cohesive understanding of customer behavior, revenue trends, and churn rates.

### Data Analysis Tools
1. Microsoft Excel
2. SQL Server
3. GitHub
4. Power BI
   
### Key Components 
1. Power BI Analysis: 
  a. Purpose: Create interactive dashboards and reports to present key insights.
  b. Key Visuals: KPI Cards for tracking total revenue, active customers, and churn rates.
   --Line Charts showing revenue trends and churn rates over time.
   --Bar Charts for regional revenue comparisons and customer segmentation. 
 c. Features: Detailed DAX measures for calculating active customers, churned customers, and revenue metrics. Dynamic visuals with slicers for region, product, and subscription type filters.

2. SQL Analysis: 
  a. Purpose: Extract and manipulate data directly from the database for custom reporting and deeper analysis.
  b. Example Queries: Revenue Analysis Query: Calculate revenue by product and region. Churn Analysis Query: Identify churned customers based on subscription end and cancellation data. 
  c.SQL Features: Use of sub queries and aggregation functions to analyze data.

 3. Excel Analysis: 
  a. Purpose: Conduct supplementary analysis, create reports, and visualize data using Excel’s pivot tables, charts, and formulas. 
  b. Key Analyses: Pivot tables summarizing revenue by region and product. Custom charts to illustrate customer growth and segmentation. Use of Excel functions for calculating active and churned customers.

### What You Can Learn from This Project Power 
- BI Techniques: How to create interactive dashboards, design visuals for KPIs, and write DAX formulas.
- SQL Skills: Techniques for data extraction and custom SQL reporting to support business analysis.
- Excel Analysis: How to use pivot tables, charts, and functions to complement BI and SQL insights. 

#### Data Analysis with Excel
To analyze my customer data, I first of all created some new columns to help me through my analyses. The columns I created I named; churned customers, subscription duration and subscription start date.
1.	Churned customers: created using conditional formatting.
```excel
=IF(false, 1,0)
```
 This means that if canceled is true it should return 1 but if it’s false it should return 0. The false or 0 represents the active customers while the true or 1 represents the churned customers. This column was created in order to be able to run analysis, on actual figures since analysis on text are limited.
2.	Subscription duration. The next column I created was the subscription duration column. This column was created in order to know the duration of period or the time frame it took from the beginning of the listing till the end of the listing. It’s calculated thus; 
```excel
= subscription end – subscription start.
```
3.	Subscription start date: this column was created in order to help format the subscription start into ‘yyyy-mm’ format. This means that the subscription duration would now be in a format of the year and month only. The formula is;
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
g.	Total number of basic subscription: This applies to the other subscription types also with slight change to the criteria alone.
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

