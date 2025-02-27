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
