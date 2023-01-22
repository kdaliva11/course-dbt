{{
    config(
        materialized = 'table'
    )
}}

SELECT
    user_id,
    COUNT(DISTINCT order_id) as total_orders, 
    SUM(order_total) AS total_spend,
    MIN(created_at) AS first_order,
    MAX(created_at) AS most_recent_order

FROM {{ ref('stage_postgres_orders') }}

GROUP BY 1