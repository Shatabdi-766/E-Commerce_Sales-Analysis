WITH FirstPurchase AS (
    -- Step 1: Find the first purchase date for each customer
    SELECT 
        CC.CUSTOMER_ID,
        MIN(OO.order_purchase_timestamp) AS FIRST_PURCHASE
    FROM 
        CUSTOMERS CC
    JOIN 
        ORDERS OO ON CC.CUSTOMER_ID = OO.CUSTOMER_ID
    GROUP BY 
        CC.CUSTOMER_ID
)

-- Step 2: Calculate the end of the 6-month period after the first purchase
    SELECT 
        FP.CUSTOMER_ID,
        FP.FIRST_PURCHASE,
        DATE_ADD(FP.FIRST_PURCHASE, INTERVAL 6 MONTH) AS SIX_MONTH_END_DATE
    FROM 
        FirstPurchase FP;