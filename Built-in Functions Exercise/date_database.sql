-- Problem 16
SELECT 
    product_name,
    order_date,
    ADDDATE(order_date, INTERVAL 3 DAY),
    ADDDATE(order_date, INTERVAL 1 MONTH)
FROM
    orders;