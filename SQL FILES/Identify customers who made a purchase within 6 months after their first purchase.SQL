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
),
SixMonthActivity AS (
    -- Step 2: Calculate the end of the 6-month period after the first purchase
    SELECT 
        FP.CUSTOMER_ID,
        FP.FIRST_PURCHASE,
        DATE_ADD(FP.FIRST_PURCHASE, INTERVAL 6 MONTH) AS SIX_MONTH_END_DATE
    FROM 
        FirstPurchase FP
)
-- Step 3: Identify customers who made a purchase within 6 months after their first purchase
    SELECT 
        SMA.CUSTOMER_ID,
        COUNT(DISTINCT OO.order_purchase_timestamp) AS NEXT_PURCHASE
    FROM 
        SixMonthActivity SMA
    JOIN 
        ORDERS OO ON OO.CUSTOMER_ID = SMA.CUSTOMER_ID
    WHERE 
        OO.order_purchase_timestamp > SMA.FIRST_PURCHASE
        AND OO.order_purchase_timestamp < SMA.SIX_MONTH_END_DATE
    GROUP BY 
        SMA.CUSTOMER_ID;
