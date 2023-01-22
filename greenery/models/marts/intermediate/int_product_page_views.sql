{{
    config(
        materialized = 'table'
    )
}}

SELECT
    product_id, 
    COUNT(DISTINCT event_guid) AS cnt_events, 
    COUNT(DISTINCT session_id) as cnt_sessions,
    COUNT(DISTINCT page_url) AS cnt_pages

FROM {{ ref('stage_postgres_events')}}

GROUP BY 1