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