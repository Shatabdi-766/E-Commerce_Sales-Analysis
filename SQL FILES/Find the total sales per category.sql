SELECT  upper(pp.product_category), round(SUM(p.payment_value),2) AS total_sales
FROM products pp
INNER JOIN order_items oi ON pp.product_id = oi.product_id
INNER JOIN payments p ON oi.order_id = p.order_id
GROUP BY pp.product_category;

