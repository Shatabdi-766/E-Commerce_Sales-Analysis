    -- Step 1: Find the first purchase date for each customer
    SELECT 
        CC.CUSTOMER_ID,
        MIN(OO.order_purchase_timestamp) AS FIRST_PURCHASE
    FROM 
        CUSTOMERS CC
    JOIN 
        ORDERS OO ON CC.CUSTOMER_ID = OO.CUSTOMER_ID
    GROUP BY 
        CC.CUSTOMER_ID;