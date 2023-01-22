{{
    config(
        materialized = 'table'
    )
}}

SELECT 
    p.product_id, 
    p.product_name, 
    p.inventory,
    p.price, 
    v.cnt_events, 
    v.cnt_sessions,
    v.cnt_pages

FROM {{ ref('stage_postgres_products')}} p 
LEFT JOIN {{ ref('int_product_page_views')}} v
ON p.product_id = v.product_id