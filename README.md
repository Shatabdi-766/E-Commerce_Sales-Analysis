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
#### Order Status Summary

This table provides a breakdown of order statuses and their corresponding counts.

| **Order Status**  | **Number of Orders** |
|-------------------|----------------------|
| Delivered        | 578,868              |
| Invoiced         | 1,884                |
| Shipped          | 6,642                |
| Processing       | 1,806                |
| Unavailable      | 3,654                |
| Canceled         | 3,750                |
| Created          | 30                   |
| Approved         | 12                   |

---
## Key Insights:
- **Majority of orders (578,868) were successfully delivered**, indicating an efficient order fulfillment process.
- **6,642 orders were shipped but not yet delivered**, suggesting possible transit delays.
- **3,750 orders were canceled**, highlighting potential customer dissatisfaction or stock issues.
- **3654 orders were marked as "unavailable"**, requiring further investigation into supply chain or inventory issues.
- **Only 12 orders were in the "approved" stage**, meaning most orders move quickly beyond initial approval.
---
---
## Actionable Recommendations:
- **Analyze cancellation reasons** to reduce lost sales.
- **Investigate "unavailable" orders** to optimize stock management.
- **Monitor shipping delays** to improve logistics efficiency.
---

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
#### Product Details Summary

This table provides an overview of product attributes, including category, description length, photo quantity, and dimensions.

| **Product ID**                        | **Category**     | **Name Length** | **Description Length** | **Photos Qty** | **Weight (g)** | **Length (cm)** | **Height (cm)** | **Width (cm)** |
|---------------------------------------|-----------------|----------------|----------------------|---------------|--------------|-------------|-------------|------------|
| 1e9e8ef04dbcff4541ed26657ea517e5      | Perfumery       | 40             | 287                  | 1             | 225          | 16          | 10          | 14         |
| 3aa071139cb16b67ca9e5dea641aaa2f      | Art            | 44             | 276                  | 1             | 1000         | 30          | 18          | 20         |
| 96bd76ec8810374ed1b65e291975717f      | Sport Leisure  | 46             | 250                  | 1             | 154          | 18          | 9           | 15         |
| cef67bcfe19066a932b7673e239eb23d      | Babies         | 27             | 261                  | 1             | 371          | 26          | 4           | 26         |

---
## Key Insights:
- **Product name length varies**, with sport leisure items having the longest names (46 characters).
- **Product descriptions range from 250 to 287 characters**, which could impact customer engagement.
- **All products listed have a single photo**, suggesting potential for improvement in visual presentation.
- **Weight differences** are notable, with art products being the heaviest at **1,000g**.
- **Size variations** highlight different storage and shipping requirements.
---
---
## Actionable Recommendations:
- **Optimize product descriptions** for SEO and customer engagement.
- **Consider adding more product images** to enhance visual appeal.
- **Review packaging strategies** for heavier or bulkier products.
---

## Number of Product Category
```sql
SELECT product_category,
count(product_category) number_of_product_category 
FROM products
group by 1
order by 2 desc;
```
#### Product Category Distribution

| Product Category                                           | Number of Products |
|------------------------------------------------------------|--------------------|
| Bed Table Bath                                            | 18,174            |
| Sport Leisure                                            | 17,202            |
| Furniture Decoration                                      | 15,942            |
| Health Beauty                                            | 14,664            |
| Housewares                                               | 14,010            |
| Automotive                                               | 11,400            |
| Computer Accessories                                     | 9,834             |
| Toys                                                    | 8,466             |
| Watches Present                                         | 7,974             |
| Telephony                                               | 6,804             |
| Babies                                                 | 5,514             |
| Perfumery                                              | 5,208             |
| Fashion Bags and Accessories                           | 5,094             |
| Stationary Store                                       | 5,094             |
| Cool Stuff                                             | 4,734             |
| Garden Tools                                           | 4,518             |
| Pet Shop                                              | 4,314             |
| Electronics                                           | 3,102             |
| Construction Tools Construction                        | 2,400             |
| Home Appliances                                       | 2,220             |
| Bags Accessories                                      | 2,094             |
| Games Consoles                                        | 1,902             |
| Furniture Office                                      | 1,854             |
| Musical Instruments                                   | 1,734             |
| Electrostile                                         | 1,386             |
| Casa Construcao                                      | 1,350             |
| General Interest Books                               | 1,296             |
| Fashion Calcados                                     | 1,038             |
| Room Furniture                                       | 936               |
| Climatization                                        | 744               |
| Technical Books                                      | 738               |
| Fixed Telephony                                      | 696               |
| House Comfort                                        | 666               |
| Market Place                                         | 624               |
| Drink Foods                                          | 624               |
| Fashion Men's Clothing                               | 570               |
| Furniture Kitchen Service Area Dinner and Garden    | 564               |
| Signalization and Safety                            | 558               |
| Construction Security Tools                         | 546               |
| Electrices 2                                         | 540               |
| Construction Tools Garden                           | 528               |
| Foods                                               | 492               |
| Drinks                                              | 486               |
| Construction Tools Illumination                     | 468               |
| Agro Industria e Comercio                           | 444               |
| Industry Commerce and Business                      | 408               |
| Christmas Articles                                  | 390               |
| Audio                                               | 348               |
| Art                                                 | 330               |
| Fashion Underwear and Beach Fashion                 | 318               |
| Blu Ray DVDs                                        | 288               |
| Furniture                                           | 270               |
| Construction Tools Tools                            | 234               |
| Imported Books                                      | 186               |
| House Pastals Oven and Cafe                         | 186               |
| PCs                                                 | 180               |
| Cine Photo                                          | 168               |
| Fashion Women's Clothing                            | 162               |
| Song                                                | 162               |
| Party Articles                                      | 156               |
| Fashion Sport                                       | 114               |
| Arts and Crafts                                     | 114               |
| Flowers                                            | 84                |
| Hygiene Diapers                                     | 72                |
| La Cuisine                                         | 60                |
| Kitchen Portable and Food Coach                    | 60                |
| CITTE and Uphack Furniture                         | 60                |
| Image Import Tablets                               | 54                |
| Fashion Children's Clothing                        | 30                |
| House Comfort 2                                     | 30                |
| PC Gamer                                           | 18                |
| Insurance and Services                             | 12                |
| CDs, Music, DVDs                                   | 6                 |
| NULL                                               | 0                 |

## Distribute Categories
```sql
WITH cte AS (
    SELECT product_category,
           COUNT(product_category) AS number_of_product_category  
    FROM products 
    GROUP BY product_category
),  

cte2 AS (
    SELECT product_category, 
           number_of_product_category, 
           CASE  
               WHEN number_of_product_category >= 6000 THEN 'Top Product Categories'  
               WHEN number_of_product_category >= 1000 THEN 'Mid-Tier Product Categories'  
               WHEN number_of_product_category >= 115 THEN 'Niche Product Categories'  
               ELSE 'Rare Product Categories'  
           END AS Categories  
    FROM cte   
)  

SELECT * FROM cte2  
ORDER BY number_of_product_category DESC;
```
#### Product Category Distribution

| Product Category                                           | Number of Products | Category Type                  |
|------------------------------------------------------------|--------------------|--------------------------------|
| Bed Table Bath                                            | 18,174            | Top Product Categories        |
| Sport Leisure                                            | 17,202            | Top Product Categories        |
| Furniture Decoration                                      | 15,942            | Top Product Categories        |
| Health Beauty                                            | 14,664            | Top Product Categories        |
| Housewares                                               | 14,010            | Top Product Categories        |
| Automotive                                               | 11,400            | Top Product Categories        |
| Computer Accessories                                     | 9,834             | Top Product Categories        |
| Toys                                                    | 8,466             | Top Product Categories        |
| Watches Present                                         | 7,974             | Top Product Categories        |
| Telephony                                               | 6,804             | Top Product Categories        |
| Babies                                                 | 5,514             | Mid-Tier Product Categories   |
| Perfumery                                              | 5,208             | Mid-Tier Product Categories   |
| Fashion Bags and Accessories                           | 5,094             | Mid-Tier Product Categories   |
| Stationary Store                                       | 5,094             | Mid-Tier Product Categories   |
| Cool Stuff                                             | 4,734             | Mid-Tier Product Categories   |
| Garden Tools                                           | 4,518             | Mid-Tier Product Categories   |
| Pet Shop                                              | 4,314             | Mid-Tier Product Categories   |
| Electronics                                           | 3,102             | Mid-Tier Product Categories   |
| Construction Tools Construction                        | 2,400             | Mid-Tier Product Categories   |
| Home Appliances                                       | 2,220             | Mid-Tier Product Categories   |
| Bags Accessories                                      | 2,094             | Mid-Tier Product Categories   |
| Games Consoles                                        | 1,902             | Mid-Tier Product Categories   |
| Furniture Office                                      | 1,854             | Mid-Tier Product Categories   |
| Musical Instruments                                   | 1,734             | Mid-Tier Product Categories   |
| Electrostile                                         | 1,386             | Mid-Tier Product Categories   |
| Casa Construcao                                      | 1,350             | Mid-Tier Product Categories   |
| General Interest Books                               | 1,296             | Mid-Tier Product Categories   |
| Fashion Calcados                                     | 1,038             | Mid-Tier Product Categories   |
| Room Furniture                                       | 936               | Niche Product Categories      |
| Climatization                                        | 744               | Niche Product Categories      |
| Technical Books                                      | 738               | Niche Product Categories      |
| Fixed Telephony                                      | 696               | Niche Product Categories      |
| House Comfort                                        | 666               | Niche Product Categories      |
| Market Place                                         | 624               | Niche Product Categories      |
| Drink Foods                                          | 624               | Niche Product Categories      |
| Fashion Men's Clothing                               | 570               | Niche Product Categories      |
| Furniture Kitchen Service Area Dinner and Garden    | 564               | Niche Product Categories      |
| Signalization and Safety                            | 558               | Niche Product Categories      |
| Construction Security Tools                         | 546               | Niche Product Categories      |
| Electrices 2                                         | 540               | Niche Product Categories      |
| Construction Tools Garden                           | 528               | Niche Product Categories      |
| Foods                                               | 492               | Niche Product Categories      |
| Drinks                                              | 486               | Niche Product Categories      |
| Construction Tools Illumination                     | 468               | Niche Product Categories      |
| Agro Industria e Comercio                           | 444               | Niche Product Categories      |
| Industry Commerce and Business                      | 408               | Niche Product Categories      |
| Christmas Articles                                  | 390               | Niche Product Categories      |
| Audio                                               | 348               | Niche Product Categories      |
| Art                                                 | 330               | Niche Product Categories      |
| Fashion Underwear and Beach Fashion                 | 318               | Niche Product Categories      |
| Blu Ray DVDs                                        | 288               | Niche Product Categories      |
| Furniture                                           | 270               | Niche Product Categories      |
| Construction Tools Tools                            | 234               | Niche Product Categories      |
| Imported Books                                      | 186               | Niche Product Categories      |
| House Pastals Oven and Cafe                         | 186               | Niche Product Categories      |
| PCs                                                 | 180               | Niche Product Categories      |
| Cine Photo                                          | 168               | Niche Product Categories      |
| Fashion Women's Clothing                            | 162               | Niche Product Categories      |
| Song                                                | 162               | Niche Product Categories      |
| Party Articles                                      | 156               | Niche Product Categories      |
| Fashion Sport                                       | 114               | Rare Product Categories       |
| Arts and Crafts                                     | 114               | Rare Product Categories       |
| Flowers                                            | 84                | Rare Product Categories       |
| Hygiene Diapers                                     | 72                | Rare Product Categories       |
| La Cuisine                                         | 60                | Rare Product Categories       |
| Kitchen Portable and Food Coach                    | 60                | Rare Product Categories       |
| CITTE and Uphack Furniture                         | 60                | Rare Product Categories       |
| Image Import Tablets                               | 54                | Rare Product Categories       |
| Fashion Children's Clothing                        | 30                | Rare Product Categories       |
| House Comfort 2                                     | 30                | Rare Product Categories       |
| PC Gamer                                           | 18                | Rare Product Categories       |
| Insurance and Services                             | 12                | Rare Product Categories       |
| CDs, Music, DVDs                                   | 6                 | Rare Product Categories       |
| NULL                                               | 0                 | Rare Product Categories       |

This table provides a breakdown of the number of products available in each category.

## Top Product Categories
| **Product Category**                  | **Number of Products** |
|---------------------------------------|----------------------|
| Bed Table Bath                        | 18,174              |
| Sport Leisure                          | 17,202              |
| Furniture Decoration                   | 15,942              |
| Health Beauty                          | 14,664              |
| Housewares                             | 14,010              |
| Automotive                             | 11,400              |
| Computer Accessories                   | 9,834               |
| Toys                                   | 8,466               |
| Watches Present                        | 7,974               |
| Telephony                              | 6,804               |

## Mid-Tier Product Categories
| **Product Category**                  | **Number of Products** |
|---------------------------------------|----------------------|
| Babies                                | 5,514               |
| Perfumery                             | 5,208               |
| Fashion Bags and Accessories          | 5,094               |
| Stationary Store                      | 5,094               |
| Cool Stuff                            | 4,734               |
| Garden Tools                          | 4,518               |
| Pet Shop                              | 4,314               |
| Electronics                           | 3,102               |
| Construction Tools (General)          | 2,400               |
| Home Appliances                       | 2,220               |

## Niche Product Categories
| **Product Category**                  | **Number of Products** |
|---------------------------------------|----------------------|
| Christmas Articles                    | 390                 |
| Audio                                 | 348                 |
| Art                                   | 330                 |
| Fashion Underwear & Beachwear         | 318                 |
| Blu-ray & DVDs                        | 288                 |
| Furniture                              | 270                 |
| Imported Books                         | 186                 |
| PCs                                   | 180                 |
| Cine & Photo                          | 168                 |
| Fashion Women’s Clothing              | 162                 |

## Rare Product Categories
| **Product Category**                  | **Number of Products** |
|---------------------------------------|----------------------|
| Fashion Sport                         | 114                 |
| Arts and Crafts                       | 114                 |
| Flowers                               | 84                  |
| Hygiene Diapers                       | 72                  |
| La Cuisine                            | 60                  |
| Kitchen Portable & Food Coach         | 60                  |
| PC Gamer                              | 18                  |
| Insurance & Services                  | 12                  |
| CDs, Music & DVDs                     | 6                   |
| NULL (No Category)                    | 0                   |

---
## Key Insights:
- **Bed, Table, and Bath** is the largest category with **18,174 products**.
- **Sport Leisure, Furniture Decoration, and Health Beauty** are other major categories.
- **Niche categories like "PC Gamer" and "Insurance & Services"** have very few products.
- **NULL category** suggests possible data gaps or missing product classifications.
---
---
## Actionable Recommendations:
- **Optimize inventory management** for high-volume categories to ensure stock availability.
- **Enhance visibility of niche categories** through marketing or bundling strategies.
- **Investigate the NULL category** to correct potential data inconsistencies.
---
## Total Categories :
```sql
WITH cte AS (
    SELECT product_category,
           COUNT(product_category) AS number_of_product_category  
    FROM products 
    GROUP BY product_category
),  

cte2 AS (
    SELECT product_category, 
           number_of_product_category, 
           CASE  
               WHEN number_of_product_category >= 6000 THEN 'Top Product Categories'  
               WHEN number_of_product_category >= 1000 THEN 'Mid-Tier Product Categories'  
               WHEN number_of_product_category >= 115 THEN 'Niche Product Categories'  
               ELSE 'Rare Product Categories'  
           END AS Categories  
    FROM cte   
)  

SELECT Categories,         
       COUNT(product_category) AS Total_Categories 
FROM (  
    SELECT product_category, 
           number_of_product_category, 
           CASE  
               WHEN number_of_product_category >= 6000 THEN 'Top Product Categories'  
               WHEN number_of_product_category >= 1000 THEN 'Mid-Tier Product Categories'  
               WHEN number_of_product_category >= 115 THEN 'Niche Product Categories'  
               ELSE 'Rare Product Categories'  
           END AS Categories  
    FROM cte   
) AS cte2
GROUP BY Categories 
ORDER BY Total_Categories DESC;
```
#### Product Category Summary

| Category Type                | Total Categories |
|------------------------------|------------------|
| Niche Product Categories     | 32               |
| Mid-Tier Product Categories  | 18               |
| Rare Product Categories      | 13               |
| Top Product Categories       | 10               |

**Top Product Categories** (10 categories) are the highest performing, driving most sales and customer engagement.
- **Mid-Tier Product Categories** (18 categories) have a moderate presence and contribute consistently but not as significantly as top categories.
- **Niche Product Categories** (32 categories) cover specialized items, but may represent smaller sales volumes.
- **Rare Product Categories** (13 categories) represent unique or low-demand items with minimal sales impact.

**Key Takeaway**: Focus efforts on **Top** and **Mid-Tier Product Categories** for higher sales, while maintaining a strategic offering for **Niche** and **Rare Product Categories**.


## List all unique cities where customers are located :
```python
query = """ SELECT distinct CUSTOMER_CITY FROM CUSTOMERS """

cur.execute(query)

data = cur.fetchall()

df = pd.DataFrame(data,columns=['UNINIQUE CUSTOMER CITY'])

df.head()
```
### Unique Customer Cities

| City                        |
|-----------------------------|
| Franca                      |
| Sao Bernardo do Campo       |
| Sao Paulo                   |
| Mogi das Cruzes             |
| Campinas                    |

### Unique Customer Cities Analysis

The dataset includes customer locations from several key cities, primarily in the São Paulo region:

- **Franca**: A mid-sized city with a notable customer base.
- **Sao Bernardo do Campo**: One of the largest cities in the region, contributing to a significant number of customers.
- **Sao Paulo**: The largest and most populous city in Brazil, likely reflecting the highest concentration of customers.
- **Mogi das Cruzes**: Another important city in the São Paulo state, contributing to the customer pool.
- **Campinas**: A key economic hub, also showing a notable presence of customers.

These cities likely represent core markets for the business, with São Paulo being the dominant region.

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
| Total Orders Placed |
|---------------------|
| 270,606             |

- In 2017, a total of 270,606 orders were placed. This data highlights the volume of transactions made during the year, providing a baseline for sales performance, trend analysis, and business growth. Comparing this with other years or customer engagement metrics could offer further insights into the company's performance over time.

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
| CATEGORY            | SALES         |
|---------------------|---------------|
| perfumery           | 76,010,799.0  |
| Furniture Decoration| 214,526,459.0 |
| telephony           | 73,032,308.0  |
| bed table bath      | 256,883,051.0 |
| automotive          | 127,844,150.0 |

- The sales data reveals that bed table bath has the highest sales at $256.88 million, followed by Furniture Decoration with $214.53 million. The automotive category also has significant sales at $127.84 million. Telephony and perfumery categories have the lowest sales among the listed categories, with $73.03 million and $76.01 million, respectively. This suggests that home and furniture-related products generate the highest sales, while categories like telephony and perfumery contribute less to total sales.


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
--Output--
| PERCENTAGE_INSTALLMENTS |
|-------------------------|
| 99.9981                 |

## Percentage of Installments

The **percentage of transactions using installments** is **99.9981%**.

---

## Interpretation
- Nearly **100%** of transactions are processed using installment payments.
- This indicates that installment payments are the **dominant payment method** for customers.

---

## Actionable Insight
- **Promote Installment Options:**
  - Highlight the availability and benefits of installment payments in marketing campaigns.
  - Offer flexible installment plans to attract budget-conscious customers.
- **Customer Education:**
  - Educate customers about the advantages of using installments, such as spreading out payments over time.
- **Fraud Prevention:**
  - Monitor installment transactions for potential fraud or payment defaults.
- **Payment Experience:**
  - Ensure a seamless and user-friendly installment payment process to improve customer satisfaction.
 

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
--Output--
| CUSTOMER_STATE | CUSTOMER_COUNT |
|----------------|----------------|
| AC             | 77             |
| AL             | 401            |
| AM             | 143            |
| AP             | 67             |
| BA             | 3277           |
| CE             | 1313           |
| DF             | 2075           |
| ES             | 1964           |
| GO             | 1952           |
| MA             | 726            |
| MG             | 11259          |
| MS             | 694            |
| MT             | 876            |
| PA             | 949            |
| PB             | 519            |
| PE             | 1609           |
| PI             | 482            |
| PR             | 4882           |
| RJ             | 12384          |
| RN             | 474            |
| RO             | 240            |
| RR             | 45             |
| RS             | 5277           |
| SC             | 3534           |
| SE             | 342            |
| SP             | 40302          |
| TO             | 273            |

## State Customer Category 
```sql
with cte as (

SELECT CUSTOMER_STATE , COUNT(distinct CUSTOMER_UNIQUE_ID) AS CUSTOMER_COUNT
FROM CUSTOMERS
GROUP BY 1
)

SELECT CUSTOMER_STATE , 
CUSTOMER_COUNT,
case 
when CUSTOMER_COUNT>=11000 then 'Top-State-Customer'
when CUSTOMER_COUNT>=3000 then 'Mid-Range-State-Customer'
else 'Low-State-Customer-Category'
end as State_Customer_Category
from cte
order by CUSTOMER_COUNT desc;
```
--Output--
| CUSTOMER_STATE | CUSTOMER_COUNT | State_Customer_Category       |
|----------------|----------------|------------------------------|
| SP             | 40302          | Top-State-Customer           |
| RJ             | 12384          | Top-State-Customer           |
| MG             | 11259          | Top-State-Customer           |
| RS             | 5277           | Mid-Range-State-Customer     |
| PR             | 4882           | Mid-Range-State-Customer     |
| SC             | 3534           | Mid-Range-State-Customer     |
| BA             | 3277           | Mid-Range-State-Customer     |
| DF             | 2075           | Low-State-Customer-Category  |
| ES             | 1964           | Low-State-Customer-Category  |
| GO             | 1952           | Low-State-Customer-Category  |
| PE             | 1609           | Low-State-Customer-Category  |
| CE             | 1313           | Low-State-Customer-Category  |
| PA             | 949            | Low-State-Customer-Category  |
| MT             | 876            | Low-State-Customer-Category  |
| MA             | 726            | Low-State-Customer-Category  |
| MS             | 694            | Low-State-Customer-Category  |
| PB             | 519            | Low-State-Customer-Category  |
| PI             | 482            | Low-State-Customer-Category  |
| RN             | 474            | Low-State-Customer-Category  |
| AL             | 401            | Low-State-Customer-Category  |
| SE             | 342            | Low-State-Customer-Category  |
| TO             | 273            | Low-State-Customer-Category  |
| RO             | 240            | Low-State-Customer-Category  |
| AM             | 143            | Low-State-Customer-Category  |
| AC             | 77             | Low-State-Customer-Category  |
| AP             | 67             | Low-State-Customer-Category  |
| RR             | 45             | Low-State-Customer-Category  |

![image](https://github.com/user-attachments/assets/bb54b6a0-6a33-4a01-b346-03f70d1d1e2c)


## Short Analysis
- **Top States:**
  - **São Paulo (SP)** has the highest customer count (**40,302**), followed by **Rio de Janeiro (RJ)** with **12,384** customers and **Minas Gerais (MG)** with **11,259** customers.
- **Mid-Range States:**
  - States like **Rio Grande do Sul (RS)**, **Paraná (PR)**, and **Santa Catarina (SC)** have significant customer counts, ranging from **3,534** to **5,277**.
- **Low-Count States:**
  - States like **Roraima (RR)**, **Amapá (AP)**, and **Acre (AC)** have very low customer counts, indicating limited market penetration.

---

## Actionable Insight
- **Focus on High-Demand States:**
  - Prioritize marketing and logistics efforts in high-demand states like **SP**, **RJ**, and **MG**.
  - Ensure sufficient inventory and resources to meet customer needs in these regions.
- **Expand in Mid-Range States:**
  - Run targeted campaigns in states like **RS**, **PR**, and **SC** to boost customer engagement and sales.
- **Explore Low-Count States:**
  - Investigate opportunities to expand into low-count states like **RR**, **AP**, and **AC**.
  - Tailor marketing strategies to address regional preferences and challenges.
- **Customer Segmentation:**
  - Use state-level data to segment customers and tailor marketing strategies based on regional preferences.
- **Logistics Optimization:**
  - Optimize delivery and logistics operations to serve customers efficiently across all states.
- **Localized Marketing:**
  - Run region-specific campaigns to attract customers in underperforming states.

## Number Of State Customer Category
```sql
select State_Customer_Category, 
COUNT(State_Customer_Category) as Number_of_State_Customer_Category
from cte2
group by State_Customer_Category
order by Number_of_State_Customer_Category desc;
```
--Output--
| State_Customer_Category       | Number_of_State_Customer_Category |
|------------------------------|-----------------------------------|
| Low-State-Customer-Category  | 20                                |
| Mid-Range-State-Customer     | 4                                 |
| Top-State-Customer           | 3                                 |

## Short Analysis
- **Low-State-Customer-Category:**
  - **20 states** fall into this category, indicating limited customer presence in these regions.
- **Mid-Range-State-Customer:**
  - **4 states** have a moderate customer base, suggesting potential for growth.
- **Top-State-Customer:**
  - **3 states** dominate in terms of customer count, representing the highest market penetration.
---

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
--Output--
| ORDER_MONTH | ORDER_COUNT |
|-------------|-------------|
| January     | 43614       |
| March       | 43266       |
| April       | 41634       |
| May         | 41238       |
| February    | 40368       |
| August      | 39072       |
| July        | 37752       |
| June        | 37002       |
| September   | 96          |
| October     | 24          |

![image](https://github.com/user-attachments/assets/c1730b7f-f319-4150-9d07-e8817e3f1750)

## Monthly Order Analysis

Below is the breakdown of **monthly order volumes** and key observations:

---

## Key Observations
1. **Peak Months:**
   - **January:** 43,614 orders
   - **March:** 43,266 orders
   - **April:** 41,634 orders
   - These months saw the **highest order volumes**, indicating strong customer activity in the early months of the year.

2. **Steady Sales:**
   - From **February to August**, there is a **consistent decline** in order count, with **August** still maintaining a high volume of **39,072 orders**.

3. **Low Activity:**
   - **September:** 96 orders
   - **October:** 24 orders
   - These months show **drastically lower orders**, which could be due to:
     - **Incomplete data** for these months.
     - **Seasonal demand shifts** impacting customer behavior.

---

## Business Insight
- **Focus on Peak Months:**
  - Leverage the high customer activity in **January, March, and April** for targeted marketing campaigns and promotions.
  - Ensure sufficient inventory and resources to meet the increased demand during these months.
- **Investigate Low Activity:**
  - Analyze the reasons behind the drop in orders during **September and October**:
    - Check for data collection issues or gaps.
    - Assess whether seasonal factors (e.g., holidays, weather) are influencing customer behavior.
- **Steady Sales Strategy:**
  - Maintain consistent marketing and operational efforts from **February to August** to sustain sales momentum.
  - Identify opportunities to boost sales during months with declining order counts.
- **Seasonal Adjustments:**
  - Plan seasonal promotions or discounts for months with lower activity to attract customers.
  - Adjust inventory and staffing levels based on monthly demand trends.
- **Data-Driven Decisions:**
  - Use monthly order data to forecast demand, optimize inventory, and allocate resources effectively.
  
---

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
## Average Orders by Customer City  

| CUSTOMER_CITY        | AVERAGE_ORDERS |
|----------------------|---------------|
| padre carvalho      | 210.00        |
| celso ramos        | 195.00        |
| datas              | 180.00        |
| candido godoi      | 180.00        |
| matias olimpio     | 150.00        |
| cidelandia        | 120.00        |
| curralinho        | 120.00        |
| picarra          | 120.00        |
| morro de sao paulo | 120.00        |
| teixeira soares   | 120.00        |

- **Padre Carvalho (210.00 orders)** leads in average orders per customer.  
- **Celso Ramos (195.00 orders)** follows closely behind.  
- Several cities, including **Cidelandia, Curralinho, and Teixeira Soares (120.00 orders each)**, share similar order patterns.  
- High average orders suggest **strong customer engagement** in these locations.

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
## Sales Percentage by Category  

| Category                      | Sales Percentage (%) |
|--------------------------------|----------------------|
| Bed Table Bath                | 320.93               |
| Health Beauty                 | 310.59               |
| Computer Accessories          | 297.08               |
| Furniture Decoration          | 268.01               |
| Watches Present               | 267.83               |
| PC Gamer                      | 0.41                 |
| House Comfort 2               | 0.32                 |
| CDs Music DVDs                | 0.22                 |
| Fashion Children's Clothing   | 0.15                 |
| Insurance and Services        | 0.06                 |

  ### **Top Categories (Highest Sales Percentage)**  
- **Bed Table Bath (320.93%)** leads the sales distribution.  
- **Health & Beauty (310.59%)** and **Computer Accessories (297.08%)** follow closely.  
- **Furniture Decoration (268.01%)** and **Watches Present (267.83%)** also show significant sales impact.  

### **Lowest Performing Categories**  
- **PC Gamer (0.41%)**, **House Comfort 2 (0.32%)**, and **CDs Music DVDs (0.22%)** have minimal sales.  
- **Fashion Children's Clothing (0.15%)** and **Insurance & Services (0.06%)** contribute the least.  

**Insight:** The highest-selling categories drive overall revenue, while niche categories have minimal impact.  
---

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
## Order Count and Price by Category  

| Category                      | Order Count | Average Price (USD) |
|--------------------------------|------------|---------------------|
| Health Beauty                 | 290,100    | 130.16              |
| Sport Leisure                 | 259,230    | 114.34              |
| Cool Stuff                    | 113,880    | 167.36              |
| Computer Accessories          | 234,810    | 116.51              |
| Watches Present               | 179,730    | 201.14              |
| CITTE and Uphack Furniture    | 1,140      | 114.95              |
| Hygiene Diapers               | 1,170      | 40.19               |
| Flowers                       | 990        | 33.64               |
| Insurance and Services        | 60        | 141.64              |
| CDs Music DVDs                | 420        | 52.14               |



```python
import numpy as np
arr1 = df['ORDER_COUNT']
arr2 = df['PRICE']
a = np.corrcoef(arr1,arr2)
a
print('The correlation between price and the number of times a product has been purchased ',a[0][1])
```
- The correlation between price and the number of times a product has been purchased  -0.10631514167157564

## Correlation Between Price and Purchase Frequency  

- **Correlation Value:** -0.1063  
  - This indicates a **weak negative correlation** between price and the number of times a product has been purchased.  

### Interpretation:  
- As **price increases, purchase frequency tends to slightly decrease**, but the effect is not strong.  
- The weak correlation suggests that **price is not the primary factor** influencing purchase decisions—other factors like product category, brand, or demand play a significant role.  

### Key Insight:  
- While **lower-priced products** may sell in higher volumes, premium or niche products can still attract buyers at higher prices.  
- Businesses should focus on **pricing strategies per category** rather than assuming a direct relationship between price and sales.


## Calculate the total revenue generated by each seller, and rank them by revenue.

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
![image](https://github.com/user-attachments/assets/197d87db-502d-4cc7-a0b8-3d24ad7fe569)

## Seller Revenue Analysis  

- **Top Seller:** Earned **$12.68M**, significantly higher than others.  
- **Top 5 Sellers:** Generated **over $7M each**, indicating strong dominance in sales.  
- **Revenue Gap:** A major disparity exists between **top-ranked and lowest-ranked sellers**.  
- **Lowest Seller Revenue:** Only **$305.50**, suggesting some sellers struggle with sales.  

### Key Insight:  
- A **small group of sellers drive the majority of revenue**, while many have minimal earnings.  
- Strategies like **seller support, promotions, or improved visibility** could help smaller sellers compete.  


## Calculate the moving average of order values for each customer over their order history.
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
--Output--
| CUSTOMER_ID                        | ORDER_PURCHASE_TIMESTAMP   | PAYMENT  | MOVING_AVERAGE |
|------------------------------------|---------------------------|----------|----------------|
| 08c5351a6aca1c1589a38f244edeee9d   | 2016-09-04 21:15:19       | 136.23   | 136.23         |
| 683c54fc24d40ee9f8a6fc179fd9856c   | 2016-09-05 00:15:34       | 75.06    | 75.06          |
| 622e13439d6b5a0b486c435618b2679e   | 2016-09-13 15:24:19       | 40.95    | 40.95          |
| b106b360fe2ef8849fbbd056f777b4d5   | 2016-10-02 22:07:52       | 109.34   | 109.34         |
| 355077684019f7f60a031656bd7262b8   | 2016-10-03 09:44:50       | 45.46    | 45.46          |
| 2823ffda607a2316375088e0d00005ec   | 2018-09-29 09:13:03       | 137.03   | 137.03         |
| bf6181a85bbb4115736c0a8db1a53be3   | 2018-10-01 15:30:09       | 80.38    | 80.38          |
| 4c2ec60c29d10c34bd49cb88aa85cfc4   | 2018-10-03 18:55:29       | 197.55   | 197.55         |
| 856336203359aa6a61bf3826f7d84c49   | 2018-10-16 20:16:02       | 222.03   | 222.03         |
| a4b417188addbc05b26b72d5e44837a1   | 2018-10-17 17:30:18       | 89.71    | 89.71          |

### Key Insights:
- **Payment Trends:** The payments range from **$40.95 to $222.03**.  
- **Stable Moving Average:** The moving averages match the individual payments, indicating no fluctuations.  
- **Customer Activity:** Payments were made over a span of **2 years** (2016–2018).

![image](https://github.com/user-attachments/assets/605d1f63-a18a-4686-9498-ade00cff95a7)


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
![image](https://github.com/user-attachments/assets/a28e3dfd-7351-4856-8ec8-15cbd741f190)

## Cumulative Sales by Year and Month

The image titled **"Cumulative Sales by Year and Month"** provides a visual representation of sales trends over time. Below is an analysis based on the provided content:

---

## Key Observations
1. **Year-Month Data:**
   - The image likely contains a line or bar chart showing cumulative sales for each month across multiple years.
   - This allows for tracking sales growth and identifying seasonal trends.

2. **Trend Analysis:**
   - **Peak Months:** Identify months with the highest cumulative sales, indicating periods of strong customer activity.
   - **Growth Trends:** Observe whether sales are increasing, decreasing, or remaining stable over time.
   - **Seasonality:** Detect patterns such as higher sales during specific months (e.g., holiday seasons).

---

## Business Insight
- **Focus on Peak Periods:**
  - Leverage high-sales months for targeted marketing campaigns and promotions.
  - Ensure sufficient inventory and resources to meet increased demand during these periods.
- **Address Low-Performing Months:**
  - Investigate reasons for lower sales in specific months and implement strategies to boost performance.
  - Offer discounts or promotions during off-peak months to attract customers.
- **Forecasting and Planning:**
  - Use cumulative sales data to forecast future demand and plan inventory, staffing, and marketing efforts.
- **Seasonal Adjustments:**
  - Adjust strategies based on seasonal trends to maximize revenue throughout the year.
- **Data-Driven Decisions:**
  - Continuously monitor sales trends to identify opportunities for growth and areas for improvement.

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
# Analysis of Year-over-Year Growth Data

The dataset provides the **yearly growth percentage** between consecutive years. Here's a detailed analysis:

---

--Output--

| Year | Year-over-Year Growth (%) |
|------|---------------------------|
| 2016 | NaN                       |
| 2017 | 12113.0                   |
| 2018 | 20.0                      |

---

### Key Insights:

1. **2016**: 
   - The **year-over-year growth is NaN (Not a Number)**. This is expected since there is no previous year to compare to. This could be the starting point of the dataset.

2. **2017**: 
   - The growth rate is **12113%**, which is an extraordinarily high value. This indicates that the sales or whatever metric is being measured grew dramatically compared to 2016. This could indicate a large increase in business activity, perhaps due to a new product launch, a significant marketing push, or an acquisition.

3. **2018**: 
   - The growth rate is **20%**, which is a much more moderate but still healthy increase compared to 2017. This suggests that while growth slowed down, it remained strong. A 20% increase indicates continued success, though at a slower pace.

---

### Possible Implications:

1. **2016-2017 Surge**: 
   - The massive increase in 2017 (12113%) likely signifies an exceptional event. This could be due to a specific business decision or external factors that caused a sharp spike in performance.
   - Such extreme growth is rare, and while it's positive, it could be an anomaly or something that is not sustainable in the long term.

2. **2017-2018 Stabilization**:
   - The decrease in growth rate from 12113% to 20% between 2017 and 2018 is a normal pattern after a huge surge. Often, businesses experience a correction phase where growth stabilizes after a massive rise.
   - However, maintaining a 20% growth rate suggests a healthy business trajectory, though it may require identifying new strategies to boost growth again or maintain this level.

---

### Recommendations:

- **Understand the Causes of the 2017 Surge**: Investigate what happened in 2017 to cause such an extreme increase (e.g., new market entry, strategic changes, external events) and assess whether this can be replicated or leveraged.
  
- **Sustain Growth**: Focus on strategies to maintain or improve the 20% growth rate from 2018 onward. Look for areas of innovation, customer satisfaction, or market expansion to keep momentum going.
  
- **Set Realistic Growth Expectations**: After an exceptional growth year, aim for more gradual, sustainable growth instead of trying to replicate extraordinary jumps. 

This data should be seen in context with other performance metrics to get a fuller picture of the business's health.


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

### Calculate the Retention Rate of Customers

The **Six-Month Retention Rate** is defined as the percentage of customers who make another purchase within **6 months** of their **first purchase**. Below is the analysis for the provided retention data.

---

### Data Overview:

| SIX_MONTH_RETENTION_RATE |
|--------------------------|
| 0.0000                   |

---

### Key Insights:

1. **Retention Rate of 0**: 
   - The **Six-Month Retention Rate** is **0.0000**, indicating that **no customers** returned to make a subsequent purchase within the 6-month window after their first purchase.

---

### Possible Implications:

1. **High Customer Churn**:
   - A **0% retention rate** typically suggests a very high churn rate, where customers do not return for repeat purchases. This could be due to various factors like dissatisfaction, lack of incentives, or poor customer experience.

2. **Lack of Retention Programs**:
   - If no customers are retained, it might imply that the business has no active retention strategies or that these strategies are ineffective.

---

### Recommendations:

1. **Investigate the Causes**: 
   - Perform a deeper analysis of customer feedback, purchase behavior, and reasons for churn to understand why customers are not returning.
   
2. **Develop Retention Strategies**:
   - Implement loyalty programs, targeted offers, personalized marketing, and improved customer service to encourage repeat purchases.

3. **Track Retention Over Time**:
   - Monitor the retention rate regularly to assess the impact of retention efforts and refine strategies as needed.

4. **Data Validation**:
   - Verify the accuracy of the data to ensure that it correctly reflects actual customer retention behavior.

---


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
# Top 3 Customers by Year Based on Payment

Below is the analysis of the **top 3 customers** who spent the most money in each year, based on the provided data.

---

### 2016
| Customer ID                                | Payment   | Payment Rank |
|--------------------------------------------|-----------|--------------|
| a9dc96b027d1252bbac0a9b72d837fc6           | 42,706.5  | 1            |
| 1d34ed25963d5aae4cf3d7f3a4cda173           | 42,022.2  | 2            |
| 4a06381959b6670756de02e07b83815f           | 36,833.4  | 3            |

---

### 2017
| Customer ID                                | Payment   | Payment Rank |
|--------------------------------------------|-----------|--------------|
| 1617b1357756262bfa56ab541c47bc16           | 409,922.4 | 1            |
| c6e2731c5b391845f6800c97401a43a9           | 207,879.3 | 2            |
| 3fd6777bbce08a352fddd04e4a7cc8f6           | 201,799.8 | 3            |

---

### 2018
| Customer ID                                | Payment   | Payment Rank |
|--------------------------------------------|-----------|--------------|
| ec5b2ba62e574342386871631fafd3fc           | 218,246.4 | 1            |
| f48d464a0baaea338cb25f816991ab1f           | 207,666.3 | 2            |
| e0a2412720e9ea4f26c1ac985f6a7358           | 144,283.2 | 3            |

---
![image](https://github.com/user-attachments/assets/ed7fe025-df27-4062-8a49-52894c7dbf96)

### Insights:
- The **top spender** in 2016 was **Customer a9dc96b027d1252bbac0a9b72d837fc6**, with a payment of **42,706.5**.
- The **top spender** in 2017 was **Customer 1617b1357756262bfa56ab541c47bc16**, with a payment of **409,922.4**.
- The **top spender** in 2018 was **Customer ec5b2ba62e574342386871631fafd3fc**, with a payment of **218,246.4**.

These customers were the top 3 spenders in each year, contributing the highest amounts in their respective periods.




