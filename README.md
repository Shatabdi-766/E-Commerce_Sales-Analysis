# E-Commerce_Sales-Analysis
E-Commerce Sales Analysis with Python and SQL This repository contains a project for analyzing e-commerce sales data to derive actionable insights and optimize business strategies. The project leverages SQL for data querying and manipulation, along with Python for advanced analytics and visualization, making it efficient for handling large datasets and performing complex calculations.

## Key Features:
- **Data Preprocessing**: Clean and prepare sales data for analysis, ensuring accuracy and consistency.
- **Sales Performance Metrics**: Calculate key metrics such as total revenue, average order value, conversion rates, and sales trends over time.
- **Product Analysis**: Identify best-selling products, analyze sales by category, and evaluate product performance.
- **Customer Insights**: Analyze customer behavior, including purchase frequency, customer lifetime value (CLV), and segmentation based on demographics or purchase history.
- **Geographical Analysis**: Evaluate sales performance by region, country, or city to identify high-performing markets.
- **Actionable Insights**: Provide recommendations to optimize marketing campaigns, inventory management, and pricing strategies.

## Technologies Used:
- **SQL**
- **MySQL**
- **Python** (Pandas, NumPy, Matplotlib, Seaborn, Scikit-learn)

## Dataset :
The dataset has been imported using the CSV files, and a Python code file has also been prepared for interactive analysis [here](./https://github.com/Shatabdi-766/E-Commerce_Sales-Analysis/blob/e6f84cf51ce125ea474412ae007ddc8b671383e7/Dataset_Link.txt)

## Dataset Overview : 

The dataset consists of multiple interrelated files that provide a comprehensive view of **bank churn behavior**. Below is a structured overview of each file and its purpose.

## Dataset Files:

### 1. **Customers (`customers.csv`)**
   - Contains customer details, including:
     - **Customer ID** (unique identifier)
     - **Customer unique ID**
     - **Location details**
     - **Zip code prefix**

### 2. **Orders (`orders.csv`)**
   - Tracks transactions, including:
     - **Order ID** (unique identifier)
     - **Customer ID** (link to customers)
     - **Order status**
     - **Timestamps** (purchase to estimated delivery)

### 3. **Sellers (`sellers.csv`)**
   - Stores seller-related data:
     - **Seller ID** (unique identifier)
     - **Zip code prefix**
     - **Geographic information**

### 4. **Products (`products.csv`)**
   - Contains product attributes, including:
     - **Product ID** (unique identifier)
     - **Category**
     - **Dimensions (height, width, length)**
     - **Weight**

### 5. **Geolocation (`geolocation.csv`)**
   - Maps zip codes to geographic locations:
     - **Zip code prefix**
     - **Latitude & Longitude**
     - **City & State mapping**

### 6. **Payments (`payments.csv`)**
   - Captures transaction payment details:
     - **Order ID** (link to orders)
     - **Payment type** (credit card, voucher, etc.)
     - **Installment plans**
     - **Payment amounts**

### 7. **Order Items (`order_items.csv`)**
   - Provides item-level transaction details:
     - **Order ID** (link to orders)
     - **Product ID** (link to products)
     - **Seller ID** (link to sellers)
     - **Price**
     - **Shipping data**
       
## Database Setup :
```sql
create database ecommerce;
```
## Data Exploration :
```sql
SELECT * FROM sellers;
```
```sql
SELECT * FROM customers;
```
```sql
SELECT * FROM geolocation;
```
```sql
SELECT * FROM order_items;
```
```sql
SELECT * FROM ORDERS;
```
```sql
SELECT * FROM PAYMENTS;
```
```sql
SELECT * FROM products;
```

## List all unique cities where customers are located :
```python
query = """ SELECT distinct CUSTOMER_CITY FROM CUSTOMERS """

cur.execute(query)

data = cur.fetchall()

df = pd.DataFrame(data,columns=['UNINIQUE CUSTOMER CITY'])

df.head()
```
## Count the number of orders placed in 2017 :
```python
query = """ select count(order_id) as order_placed 
from orders 
where year(order_purchase_timestamp)=2017 """

cur.execute(query)

data = cur.fetchall()

df = pd.DataFrame(data , columns=[""" total orders placed in 2017 are """])

df
```
## Find the total sales per category :
```python
query = """ 

SELECT  pp.product_category, round(SUM(p.payment_value)) AS total_sales
FROM products pp
INNER JOIN order_items oi ON pp.product_id = oi.product_id
INNER JOIN payments p ON oi.order_id = p.order_id
GROUP BY pp.product_category;




"""

cur.execute(query)

data = cur.fetchall()

df = pd.DataFrame(data,columns=['CATEGORY','SALES'])

df
```
## Calculate the percentage of orders that were paid in installments :
```python
query = """ 

SELECT SUM((
CASE 
WHEN PAYMENT_INSTALLMENTS >= 1 
then 1 
ELSE 0 
END) ) / count(*) *100 AS PERCENTAGE_INSTALLMENTS
FROM PAYMENTS;



"""

cur.execute(query)

data = cur.fetchall()

df = pd.DataFrame(data, columns=['PERCENTAGE_INSTALLMENTS'])

df
```

## Count the number of customers from each state :

```python
query = """ 

SELECT CUSTOMER_STATE , COUNT(distinct CUSTOMER_UNIQUE_ID) AS CUSTOMER_COUNT
FROM CUSTOMERS
GROUP BY 1;


"""

cur.execute(query)

data = cur.fetchall()

df = pd.DataFrame(data, columns=['CUSTOMER_STATE','CUSTOMER_COUNT'])

df
```



## Calculate the number of orders per month in 2018.

```python
query = """ 

SELECT date_format(ORDER_PURCHASE_TIMESTAMP,'%M') AS ORDER_MONTH , 
count(ORDER_ID) AS ORDER_COUNT 
 FROM ORDERS
 WHERE YEAR(ORDER_PURCHASE_TIMESTAMP) = 2018
 group by 1
 order by 2 DESC;

"""

cur.execute(query)

data = cur.fetchall()

df = pd.DataFrame(data, columns=['ORDER_MONTH','ORDER_COUNT'])

df
```



## Find the average number of products per order, grouped by customer city.

```python
query = """ 

WITH COUNT_PER_ORDER AS
(
SELECT o.ORDER_ID, o.CUSTOMER_ID, COUNT(OO.ORDER_ID) AS OC
FROM ORDERS o 
INNER JOIN ORDER_ITEMS OO
ON o.ORDER_ID = OO.ORDER_ID
GROUP BY 1,2
)

SELECT customers.customer_city, round(AVG(COUNT_PER_ORDER.OC),2) AS AVG_ORDERS
FROM customers
INNER JOIN COUNT_PER_ORDER
ON customers.customer_id = COUNT_PER_ORDER.CUSTOMER_ID
GROUP BY 1
ORDER BY 2 DESC;


"""

cur.execute(query)

data = cur.fetchall()

df = pd.DataFrame(data, columns=['CUSTOMER_CITY','AVERAGE_ORDERS'])

df
```


## Calculate the percentage of total revenue contributed by each product category.

```python
query = """ 

SELECT  pp.product_category,ROUND((SUM(p.payment_value)) /(SELECT sum(payment_value) FROM payments)*100,2) AS SALES_PERCENTAGE
FROM products pp
INNER JOIN order_items oi ON pp.product_id = oi.product_id
INNER JOIN payments p ON oi.order_id = p.order_id
GROUP BY pp.product_category
ORDER BY 2 DESC;



"""

cur.execute(query)

data = cur.fetchall()

df = pd.DataFrame(data, columns=['CATEGORY','SALES_PERCENTAGE'])

df
```
## Identify the correlation between product price and the number of times a product has been purchased.

```python
query = """ 


select products.product_category, count(order_items.product_id) as order_count , round(avg(order_items.price),2) as price
from products
inner join order_items
on products.product_id = order_items.product_id
group by 1;



"""

cur.execute(query)

data = cur.fetchall()

df = pd.DataFrame(data, columns=['CATEGORY','ORDER_COUNT','PRICE'])

df
```
# # Calculate the total revenue generated by each seller, and rank them by revenue.

```python
query = """
WITH REVENUEGENERATED AS (
    SELECT 
        OI.SELLER_ID, 
        ROUND(SUM(PY.PAYMENT_VALUE), 2) AS REVENUE
    FROM
        ORDER_ITEMS OI
    JOIN
        PAYMENTS PY ON OI.ORDER_ID = PY.ORDER_ID
    GROUP BY 1
)
SELECT *,
    DENSE_RANK() OVER (ORDER BY REVENUE DESC) AS RANK_REVENUE
FROM REVENUEGENERATED;
"""

cur.execute(query)
data = cur.fetchall()

df = pd.DataFrame(data, columns=['SELLER_ID', 'REVENUE', 'RANK_REVENUE'])


df
```


# # Calculate the moving average of order values for each customer over their order history.
```python
query = """

WITH PaymentData AS (
    SELECT DISTINCT
        orders.customer_id, 
        orders.order_purchase_timestamp, 
        payments.payment_value AS payment
    FROM 
        payments
    JOIN 
        orders
    ON 
        payments.order_id = orders.order_id
)

SELECT 
    customer_id, 
    order_purchase_timestamp, 
    payment,
    ROUND(AVG(payment) OVER (
        PARTITION BY customer_id 
        ORDER BY order_purchase_timestamp
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ),2)AS mov_avg
FROM 
    PaymentData
ORDER BY 
    order_purchase_timestamp;


"""

cur.execute(query)
data = cur.fetchall()

df = pd.DataFrame(data, columns=['CUSTOMER_ID', 'ORDER_PURCHASE_TIMESTAMP', 'PAYMENT', 'MOVING_AVERAGE'])
df
```
## Calculate the cumulative sales per month for each year.
```python
query = """
WITH MonthlyPayment AS (
    SELECT 
        MONTH(OO.ORDER_PURCHASE_TIMESTAMP) AS MONTH,
        YEAR(OO.ORDER_PURCHASE_TIMESTAMP) AS YEAR,
        ROUND(SUM(PY.PAYMENT_VALUE), 2) AS PAYMENT
    FROM
        ORDERS OO
    JOIN
        PAYMENTS PY ON OO.ORDER_ID = PY.ORDER_ID
    GROUP BY 
        MONTH, YEAR
    ORDER BY 
        YEAR, MONTH
)

SELECT 
    MONTH,
    YEAR, 
    PAYMENT, 
    ROUND(SUM(PAYMENT) OVER (ORDER BY YEAR, MONTH), 3) AS CUMULATIVE_SALES
FROM 
    MonthlyPayment;


"""

cur.execute(query)
data = cur.fetchall()

df = pd.DataFrame(data, columns=['MONTH', 'YEAR', 'PAYMENT', 'CUMULATIVE_SALES'])
df
```
## Calculate the year-over-year growth rate of total sales.
```
query = """

WITH YearlySales AS (
    SELECT 
        YEAR(OO.ORDER_PURCHASE_TIMESTAMP) AS YEAR,
        ROUND(SUM(PY.PAYMENT_VALUE), 2) AS PAYMENT
    FROM
        ORDERS OO
    JOIN
        PAYMENTS PY ON OO.ORDER_ID = PY.ORDER_ID
    GROUP BY 
        YEAR
    ORDER BY 
        YEAR
),

SalesComparison AS (
    SELECT 
        YEAR, 
        PAYMENT AS current_sales, 
        LAG(PAYMENT, 1) OVER (ORDER BY YEAR) AS Previous_year_sales
    FROM 
        YearlySales
)

SELECT 
    YEAR, 
    ROUND((current_sales - Previous_year_sales) / Previous_year_sales, 2) * 100 AS year_over_year_growth
FROM 
    SalesComparison;

"""

cur.execute(query)
data = cur.fetchall()

df = pd.DataFrame(data, columns=['YEAR','YEAR_OVER_YEAR_GROWTH'])
df
```

## Calculate the retention rate of customers, defined as the percentage of customers who make another purchase within 6 months of their first purchase.

```python
query = """
WITH FirstPurchase AS (
    -- Step 1: Find the first purchase date for each customer
    SELECT 
        CC.CUSTOMER_ID,
        MIN(OO.order_purchase_timestamp) AS FIRST_PURCHASE
    FROM 
        CUSTOMERS CC
    JOIN 
        ORDERS OO ON CC.CUSTOMER_ID = OO.CUSTOMER_ID
    GROUP BY 
        CC.CUSTOMER_ID
),
SixMonthActivity AS (
    -- Step 2: Calculate the end of the 6-month period after the first purchase
    SELECT 
        FP.CUSTOMER_ID,
        FP.FIRST_PURCHASE,
        DATE_ADD(FP.FIRST_PURCHASE, INTERVAL 6 MONTH) AS SIX_MONTH_END_DATE
    FROM 
        FirstPurchase FP
),
Retention AS (
    -- Step 3: Identify customers who made a purchase within 6 months after their first purchase
    SELECT 
        SMA.CUSTOMER_ID,
        COUNT(DISTINCT OO.order_purchase_timestamp) AS NEXT_PURCHASE
    FROM 
        SixMonthActivity SMA
    JOIN 
        ORDERS OO ON OO.CUSTOMER_ID = SMA.CUSTOMER_ID
    WHERE 
        OO.order_purchase_timestamp > SMA.FIRST_PURCHASE
        AND OO.order_purchase_timestamp < SMA.SIX_MONTH_END_DATE
    GROUP BY 
        SMA.CUSTOMER_ID
)
-- Step 4: Calculate the 6-month retention rate
SELECT 
    100* (COUNT(DISTINCT R.CUSTOMER_ID)  / COUNT(DISTINCT FP.CUSTOMER_ID)) AS SIX_MONTH_RETENTION_RATE
FROM 
    FirstPurchase FP
LEFT JOIN 
    Retention R ON FP.CUSTOMER_ID = R.CUSTOMER_ID;
"""

cur.execute(query)
data = cur.fetchall()

df = pd.DataFrame(data, columns=['SIX_MONTH_RETENTION_RATE'])
df
```
## Identify the top 3 customers who spent the most money in each year.

```python
query = """
WITH CustomerYearlyPayments AS (
    SELECT 
        orders.customer_id,
        YEAR(orders.order_purchase_timestamp) AS YEARS,
        ROUND(SUM(payments.PAYMENT_VALUE), 2) AS PAYMENT,
        DENSE_RANK() OVER (
            PARTITION BY YEAR(orders.order_purchase_timestamp)
            ORDER BY SUM(payments.PAYMENT_VALUE) DESC
        ) AS PAYMENT_RANK
    FROM 
        orders
    JOIN 
        payments ON orders.order_id = payments.order_id
    GROUP BY 
        orders.customer_id, YEAR(orders.order_purchase_timestamp)
)

SELECT 
    CUSTOMER_ID, 
    YEARS, 
    PAYMENT, 
    PAYMENT_RANK
FROM 
    CustomerYearlyPayments
WHERE 
    PAYMENT_RANK <= 3;
"""

# Execute the query
cur.execute(query)

# Fetch the results
data = cur.fetchall()

# Convert to DataFrame
df = pd.DataFrame(data, columns=['CUSTOMER_ID', 'YEARS', 'PAYMENT', 'PAYMENT_RANK'])

print(df)
```



