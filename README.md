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
--Output--
| seller_id                          | seller_zip_code_prefix | seller_city    | seller_state |
|------------------------------------|------------------------|----------------|--------------|
| 3442f8959a84dea7ee197c632cb2df15   | 13023                  | campinas       | SP           |
| d1b65fc7debc3361ea86b5f14c68d2e2   | 13844                  | mogi guacu     | SP           |
| ce3ad9de960102d0677a81f5d0bb7b2d   | 20031                  | rio de janeiro | RJ           |
| c0f3eea2e14555b6faeea3dd58c1b1c3   | 4195                   | sao paulo      | SP           |

#### Observation: Seller Distribution and Location Data

Sellers are distributed across a wide range of cities in Brazil, with a particularly strong presence in major metropolitan areas like **São Paulo (SP)** and **Rio de Janeiro (RJ)**.

Each seller is assigned a **unique identifier (`seller_id`)** and is associated with specific location data, such as:
- **seller_zip_code_prefix**
- **seller_city**
- **seller_state**

This enables accurate tracking and regional analysis of seller performance.

---

## Key Insights
1. **Geographic Concentration:**
   - Sellers are concentrated in **major urban centers**, such as São Paulo and Rio de Janeiro, which are likely hubs of economic activity and customer demand.
   - This distribution aligns with population density and market potential in these regions.

2. **Unique Seller Identification:**
   - The `seller_id` allows for precise tracking of individual seller performance, inventory, and sales trends.
   - This data can be used to identify top-performing sellers and those needing support.

3. **Regional Analysis:**
   - Location data (`seller_zip_code_prefix`, `seller_city`, `seller_state`) enables detailed regional analysis, such as:
     - Identifying high-demand areas.
     - Assessing regional sales performance.
     - Tailoring marketing and logistics strategies.

---

```sql
SELECT * FROM customers;
```
#### Customer Location Data 

Below is a sample of **customer information**, including their unique ID, zip code prefix, city, and state:

| customer_id                        | customer_unique_id                   | customer_zip_code_prefix | customer_city             | customer_state |
|------------------------------------|--------------------------------------|--------------------------|---------------------------|----------------|
| 06b8999e2fba1a1fbc88172c00ba8bc7   | 861eff4711a542e4b93843c6dd7febb0     | 14409                    | franca                    | SP             |
| 18955e83d337fd6b2def6b18a428ac77   | 290c77bc529b7ac935b93aa66c333dc3     | 9790                     | sao bernardo do campo     | SP             |
| 4e7b3e00288586ebd08712fdd0374a03   | 060e732b5b29e8181a18229c7b0b2b5e     | 1151                     | sao paulo                 | SP             |
| b2b6027bc5c5109e529d4dc6358b12c3   | 259dac757896d24d7702b9acbbff3f3c     | 8775                     | mogi das cruzes           | SP             |

---

## Interpretation
- **Geographic Concentration:**
  - All customers in this sample are located in the state of **São Paulo (SP)**, with cities like **São Paulo**, **Franca**, **São Bernardo do Campo**, and **Mogi das Cruzes**.
- **Unique Customer Identification:**
  - Each customer has a unique `customer_id` and `customer_unique_id`, enabling precise tracking of customer behavior and preferences.
- **Regional Insights:**
  - The data suggests a strong customer base in **urban and suburban areas** of São Paulo, which is Brazil's most populous state and a major economic hub.

---

```sql
SELECT * FROM geolocation;
```
#### Geolocation Data

Below is a sample of **geolocation data**, including zip code prefixes, latitude, longitude, city, and state:

| geolocation_zip_code_prefix | geolocation_lat | geolocation_lng | geolocation_city | geolocation_state |
|-----------------------------|-----------------|-----------------|------------------|-------------------|
| 1037                        | -23.5456        | -46.6393        | sao paulo        | SP                |
| 1046                        | -23.5461        | -46.6448        | sao paulo        | SP                |
| 1046                        | -23.5461        | -46.643         | sao paulo        | SP                |
| 1041                        | -23.5444        | -46.6395        | sao paulo        | SP                |
| 1035                        | -23.5416        | -46.6416        | sao paulo        | SP                |

---

## Interpretation
- **Geographic Concentration:**
  - All geolocation data points are concentrated in **São Paulo (SP)**, Brazil's largest city and economic hub.
- **Precision:**
  - The latitude and longitude coordinates provide precise locations within São Paulo, enabling detailed geographic analysis.
- **Zip Code Prefixes:**
  - The zip code prefixes (e.g., 1037, 1046) indicate specific neighborhoods or districts within São Paulo.

---
```sql
SELECT * FROM order_items;
```
#### Order Item Details

Below is a sample of **order item details**, including order ID, product ID, seller ID, shipping limit date, price, and freight value:

| order_id                        | order_item_id | product_id                        | seller_id                        | shipping_limit_date   | price  | freight_value |
|---------------------------------|---------------|------------------------------------|----------------------------------|-----------------------|--------|---------------|
| 00010242fe8c5a6d1ba2dd792cb16214 | 1             | 4244733e06e7ecb4970a6e2683c13e61   | 48436dade18ac8b2bce089ec2a041202 | 9/19/2017 9:45       | 58.9   | 13.29         |
| 00018f77f2f0320c557190d7a144bdd3 | 1             | e5f2d52b802189ee658865ca93d83a8f   | dd7ddc04e1b6c2c614352b383efe2d36 | 5/3/2017 11:05       | 239.9  | 19.93         |
| 000229ec398224ef6ca0657da4fc703e | 1             | c777355d18b72b67abbeef9df44fd0fd   | 5b51032eddd242adc84c38acab88f23d | 1/18/2018 14:48      | 199    | 17.87         |
| 00024acbcdf0a6daa1e931b038114c75 | 1             | 7634da152a4610f1595efa32f14722fc   | 9d7a1d34a5052409006425275ba1c2b4 | 8/15/2018 10:10      | 12.99  | 12.79         |

---

## Short Analysis
- **Order Details:**
  - Each order item is associated with a unique `order_id`, `product_id`, and `seller_id`.
  - The `shipping_limit_date` indicates the deadline for shipping the item.
- **Price and Freight:**
  - Prices range from **$12.99** to **$239.9**, while freight values range from **$12.79** to **$19.93**.
  - Higher-priced items tend to have higher freight costs, but this is not always the case (e.g., the item priced at **$199** has a freight cost of **$17.87**).

---

```sql
SELECT * FROM ORDERS;
```
#### Order Timeline Analysis

Below is a sample of **order timeline data**, including order status, timestamps, and delivery dates:

| order_id                        | customer_id                        | order_status | order_purchase_timestamp | order_approved_at | order_delivered_carrier_date | order_delivered_customer_date | order_estimated_delivery_date |
|---------------------------------|------------------------------------|--------------|--------------------------|-------------------|------------------------------|-------------------------------|-------------------------------|
| e481f51cbdc54678b7cc49136f2d6af7 | 9ef432eb6251297304e76186b10a928d | delivered    | 10/2/2017 10:56         | 10/2/2017 11:07   | 10/4/2017 19:55             | 10/10/2017 21:25             | 10/18/2017 0:00              |
| 53cdb2fc8bc7dce0b6741e2150273451 | b0830fb4747a6c6d20dea0b8c802d7ef | delivered    | 7/24/2018 20:41         | 7/26/2018 3:24    | 7/26/2018 14:31             | 8/7/2018 15:27              | 8/13/2018 0:00              |
| 47770eb9100c2d0c44946d9cf07ec65d | 41ce2a54c0b03bf3443c3d931a367089 | delivered    | 8/8/2018 8:38           | 8/8/2018 8:55     | 8/8/2018 13:50             | 8/17/2018 18:06             | 9/4/2018 0:00               |
| 949d5b44dbf5de918fe9c16f97b45f8a | f88197465ea7920adcdbec7375364d82 | delivered    | 11/18/2017 19:28        | 11/18/2017 19:45  | 11/22/2017 13:39           | 12/2/2017 0:28              | 12/15/2017 0:00             |
| ad21c59c0840e6cb83a9ceb5573f8159 | 8ab97904e6daea8866dbdbc4fb7aad2c | delivered    | 2/13/2018 21:18         | 2/13/2018 22:20   | 2/14/2018 19:46            | 2/16/2018 18:17             | 2/26/2018 0:00              |
| a4591c265e18cb1dcee52889e2d8acc3 | 503740e9ca751ccdda7ba28e9ab8f608 | delivered    | 7/9/2017 21:57          | 7/9/2017 22:10    | 7/11/2017 14:58            | 7/26/2017 10:57             | 8/1/2017 0:00               |
| 136cce7faa42fdb2cefd53fdc79a6098 | ed0271e0b7da060a393796590e7b737a | invoiced     | 4/11/2017 12:22         | 4/13/2017 13:25   | NULL                        | NULL                         | 5/9/2017 0:00               |
| 6514b8ad8028c9f2cc2374ded245783f | 9bdf08b4b3b52b5526ff42d37d47f222 | delivered    | 5/16/2017 13:10         | 5/16/2017 13:22   | 5/22/2017 10:07            | 5/26/2017 12:55             | 6/7/2017 0:00               |

---

## Short Analysis
- **Order Status:**
  - Most orders in this sample are **delivered**, with one order marked as **invoiced**.
- **Timeline:**
  - The time between **order purchase** and **order approval** is relatively short (e.g., minutes to hours).
  - The time between **order approval** and **delivery to the carrier** varies (e.g., hours to days).
  - The time between **delivery to the carrier** and **delivery to the customer** can range from a few days to over a week.
- **Estimated vs. Actual Delivery:**
  - Most orders are delivered **before the estimated delivery date**, indicating efficient logistics.

---

---

## Actionable Insight
- **Delivery Efficiency:**
  - Monitor the time between **order approval** and **delivery to the carrier** to identify bottlenecks.
  - Optimize logistics to reduce the time between **delivery to the carrier** and **delivery to the customer**.
- **Customer Communication:**
  - Provide customers with real-time updates on their order status to improve transparency and satisfaction.
- **Invoiced Orders:**
  - Investigate and resolve **invoiced** orders to ensure they are processed and delivered promptly.
- **Performance Benchmarking:**
  - Use the **estimated delivery date** as a benchmark to evaluate and improve delivery performance.
- **Customer Feedback:**
  - Gather feedback from customers about their delivery experience to identify areas for improvement.
 
---
## Number Of Status 
```sql
SELECT order_status,
count(order_status) as Number_of_Status
 FROM ORDERS
 group by 1;
```

```sql
SELECT * FROM PAYMENTS;
```
#### Payment Details

Below is a sample of **payment details**, including order ID, payment type, installment count, and payment value:

| order_id                        | payment_sequential | payment_type | payment_installments | payment_value |
|---------------------------------|--------------------|--------------|-----------------------|---------------|
| 55e2d723733c45033e71cb4d44690234 | 1                  | UPI          | 1                     | 89.63         |
| 947e9c6bfd83a06953c420ef92d3da6e | 1                  | voucher      | 1                     | 69.46         |
| 60e43c5f5ba559d9dd19357ed72cb2f2 | 1                  | credit_card  | 2                     | 78.3          |
| e3e9e3295f4e1512167c232a0aaae8a5 | 1                  | voucher      | 1                     | 50.8          |
| 460d57443ffdcaeba240360239747cf7 | 1                  | credit_card  | 1                     | 34            |
| 4cb51127f19f7254b320efe1718477dd | 1                  | UPI          | 1                     | 77.1          |
| 110d9355d6338eab0a65a0cacdde5434 | 1                  | credit_card  | 5                     | 566.4         |
| 42f5954cda381bd032934ee38c453711 | 1                  | credit_card  | 8                     | 402.42        |
| 3689194c14ad4e2e7361ebd1df0e77b0 | 2                  | voucher      | 1                     | 57.53         |
| 97c111c4f22dfa1089a9c0b5338dcc79 | 1                  | credit_card  | 3                     | 44.01         |
| 4b2d035932915aa9c2a0d4d84cd6d3b0 | 1                  | credit_card  | 3                     | 187.51        |
| e1b4ee0e390fbac1dec439d72b45a115 | 1                  | credit_card  | 3                     | 77.7          |
| fee72a68ce935ebf2939fe72f27d3d9b | 1                  | credit_card  | 1                     | 48.68         |
| 4d3bfdf4c7d6578ea445d588371ae10e | 1                  | credit_card  | 1                     | 77.29         |
| 4c2e1a95586c815795a324d1599e7b5a | 1                  | credit_card  | 8                     | 117.71        |

---

## Short Analysis
- **Payment Types:**
  - The primary payment methods are **credit_card**, **voucher**, and **UPI**.
  - **Credit card** is the most frequently used payment method.
- **Installments:**
  - Installments range from **1** to **8**, with higher installment counts often associated with larger payment values (e.g., **$566.4** over **5 installments**).
- **Payment Values:**
  - Payment values vary widely, from **$34** to **$566.4**, indicating a diverse range of order sizes.

---
---
## Actionable Insight
- **Payment Method Optimization:**
  - Promote the use of **credit cards** and **UPI** for higher-value transactions, as they are widely used and trusted.
  - Encourage the use of **vouchers** for smaller transactions or promotional offers.
- **Installment Options:**
  - Offer flexible installment plans for high-value orders to make them more accessible to customers.
  - Highlight installment options in marketing campaigns to attract budget-conscious customers.
- **Customer Segmentation:**
  - Segment customers based on payment behavior (e.g., high-value credit card users, voucher users) to tailor marketing strategies.
- **Fraud Prevention:**
  - Monitor high-value and high-installment transactions for potential fraud or payment defaults.
- **Payment Experience:**
  - Ensure a seamless payment experience for all payment methods to improve customer satisfaction and reduce cart abandonment.
---
 
## Number Of Payment Types 
```sql
SELECT payment_type, count(payment_type) as number_of_payment_type
 FROM ecommerce.payments
 group by 1;
```
#### Payment Type Distribution

Below is the breakdown of **payment types** and their respective counts:

| payment_type | number_of_payment_type |
|--------------|------------------------|
| credit_card  | 383,975               |
| UPI          | 98,920                |
| voucher      | 28,875                |
| debit_card   | 7,645                 |
| not_defined  | 15                    |

---

## Short Interpretation
- **Dominant Payment Method:**
  - **Credit card** is the most widely used payment method, accounting for **383,975** transactions.
- **Secondary Payment Methods:**
  - **UPI** is the second most popular, with **98,920** transactions.
  - **Voucher** and **debit card** are used less frequently, with **28,875** and **7,645** transactions, respectively.
- **Undefined Payments:**
  - A small number of transactions (**15**) are categorized as **not_defined**, which may require further investigation.

---
---
## Actionable Insight
- **Promote Popular Payment Methods:**
  - Highlight the convenience and security of **credit cards** and **UPI** in marketing campaigns to encourage their use.
  - Offer incentives (e.g., cashback, discounts) for using these preferred payment methods.
- **Encourage Underutilized Methods:**
  - Promote the use of **vouchers** and **debit cards** through targeted campaigns or special offers.
  - Simplify the process for using these payment methods to increase adoption.
- **Fraud Prevention:**
  - Monitor transactions for **credit cards** and **UPI** to detect and prevent fraudulent activities.
- **Data Cleanup:**
  - Investigate and resolve the **not_defined** payment type to ensure accurate data reporting.
- **Customer Education:**
  - Educate customers about the benefits and security features of different payment methods to build trust and encourage usage.
- **Payment Experience:**
  - Ensure a seamless and user-friendly payment experience across all payment types to improve customer satisfaction.
---

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



