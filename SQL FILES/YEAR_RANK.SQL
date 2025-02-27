
SELECT orders.customer_id,
YEAR(orders.order_purchase_timestamp) AS YEAR,
ROUND(sum(payments.PAYMENT_VALUE),2) AS PAYMENT,
dense_rank() OVER( partition by(YEAR(orders.order_purchase_timestamp))
 ORDER BY sum(payments.PAYMENT_VALUE) DESC) AS D_RANK
FROM orders
JOIN payments
ON orders.order_id = payments.order_id
GROUP BY 1,2;