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