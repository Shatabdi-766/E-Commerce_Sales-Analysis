SELECT * FROM ORDERS
limit 1000;

SELECT order_status,
count(order_status) as Number_of_Status
 FROM ORDERS
 group by 1;

