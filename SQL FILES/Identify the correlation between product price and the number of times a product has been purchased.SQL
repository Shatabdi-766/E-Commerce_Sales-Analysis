
select products.product_category, count(order_items.product_id) as order_count , round(avg(order_items.price),2) as price
from products
inner join order_items
on products.product_id = order_items.product_id
group by 1;
