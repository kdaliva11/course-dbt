# Week 1 Questions - queries at end

1. How many users do we have?
# 130 Unique Users

2. On average, how many orders do we receive per hour?
# 7.5

3. On average, how long does an order take from being placed to being delivered?
# 93 hours, or about 4 days

4. How many users have only made one purchase? Two purchases? Three+ purchases?
## 1 - 25, 2 - 28, 3+ - 71

Note: you should consider a purchase to be a single order. In other words, if a user places one order for 3 products, they are considered to have made 1 purchase.

5. On average, how many unique sessions do we have per hour?
## 16 sessions / hr

## Q2 - 
WITH tbl AS (
    SELECT 
    TRUNC(created_at, 'HOUR') AS hour, 
    COUNT(DISTINCT order_id) AS num_orders

FROM stage_postgres_orders
    
    GROUP BY 1
)

SELECT AVG(num_orders)
FROM tbl

## Q3 - 
WITH tbl AS (
    SELECT 
    order_id,
    delivered_at,
    created_at,
    datediff("HOUR",created_at, delivered_at) AS hours_to_delivery

FROM stage_postgres_orders
)

SELECT AVG(hours_to_delivery) AS avg_hours_to_delivery,
AVG(hours_to_delivery) / 24 AS avg_days_to_delivery
FROM tbl

## Q4 - 
WITH tbl AS (
    SELECT
        user_id,
        CASE WHEN COUNT(DISTINCT order_id) = 1 THEN '1'
             WHEN COUNT(DISTINCT order_id) = 2 THEN '2'
             ELSE '3+' END AS num_orders

FROM stage_postgres_orders
GROUP BY 1
)

SELECT
    num_orders,
    COUNT(DISTINCT user_id) AS num_users 
    
FROM tbl
GROUP BY 1
ORDER BY 1 ASC

## Q5 - 
WITH tbl AS (
    SELECT 
    TRUNC(created_at, 'HOUR') AS hour,
    COUNT(DISTINCT session_id) AS num_sessions

FROM stage_postgres_events
GROUP BY 1
)

SELECT
    AVG(num_sessions)
    
FROM tbl