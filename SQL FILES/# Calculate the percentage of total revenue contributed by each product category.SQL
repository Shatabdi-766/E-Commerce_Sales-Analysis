SELECT  pp.product_category,ROUND((SUM(p.payment_value)) /(SELECT sum(payment_value) FROM payments)*100,2) AS SALES_PERCENTAGE
FROM products pp
INNER JOIN order_items oi ON pp.product_id = oi.product_id
INNER JOIN payments p ON oi.order_id = p.order_id
GROUP BY pp.product_category
ORDER BY 2 DESC;
