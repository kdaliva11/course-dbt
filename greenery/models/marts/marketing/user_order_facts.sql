{{
    config(
        materialized = 'table'
    )
}}

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.created_at,
    u.updated_at,
    o.total_orders, 
    o.total_spend,
    o.first_order,
    o.most_recent_order

FROM {{ ref('stage_postgres_users')}} u  
LEFT JOIN {{ ref('int_user_level_orders') }} o
ON u.user_id = o.user_id