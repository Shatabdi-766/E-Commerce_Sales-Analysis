-- SELECT COUNT(ORDER_ID) FROM PAYMENTS; -- 519430
-- SELECT COUNT(DISTINCT ORDER_ID) FROM PAYMENTS; -- 99440 

SELECT orders.customer_id,
orders.order_id,
ROUND(sum(payments.PAYMENT_VALUE),2) AS PAYMENT,
dense_rank() OVER(ORDER BY sum(payments.PAYMENT_VALUE) DESC) AS RANK_PAYMENT
FROM orders
JOIN payments
ON orders.order_id = payments.order_id
GROUP BY 1,2;