WITH A AS (
SELECT 
    YEAR(OO.ORDER_PURCHASE_TIMESTAMP) AS YEAR,
    ROUND(SUM(PY.PAYMENT_VALUE),2) AS PAYMENT
FROM
    ORDERS OO
        JOIN
    PAYMENTS PY ON OO.ORDER_ID = PY.ORDER_ID
    GROUP BY YEAR
    ORDER BY YEAR)
    
    SELECT 
    
    YEAR, 
    PAYMENT as current_sales, 
    lag(payment , 1) over(order by year) as Previous_year_sales
    FROM A;
