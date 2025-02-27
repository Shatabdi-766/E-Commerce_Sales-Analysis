with cte as (

SELECT CUSTOMER_STATE , COUNT(distinct CUSTOMER_UNIQUE_ID) AS CUSTOMER_COUNT
FROM CUSTOMERS
GROUP BY 1
)

SELECT CUSTOMER_STATE , 
CUSTOMER_COUNT,
case 
when CUSTOMER_COUNT>=11000 then 'Top-State-Customer'
when CUSTOMER_COUNT>=3000 then 'Mid-Range-State-Customer'
else 'Low-State-Customer-Category'
end as State_Customer_Category
from cte
order by CUSTOMER_COUNT desc;
