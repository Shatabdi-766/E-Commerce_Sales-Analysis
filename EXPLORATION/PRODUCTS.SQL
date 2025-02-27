SELECT * FROM products;

SELECT product_category,
count(product_category) number_of_product_category 
FROM products
group by 1
order by 2 desc;

-- Top/Mid-Tier/Niche/Rare Product Categories

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


