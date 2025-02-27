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