{{
    config(
        materialized = 'table'
    )
}}

WITH src_events AS (
    SELECT * FROM {{ source('postgres', 'events') }}
)

, renamed_recast AS (
    SELECT
        event_id AS event_guid,
        session_id,
        user_id,
        event_type,
        page_url,
        created_at,
        order_id,
        product_id
    FROM src_events
)

SELECT * FROM renamed_recast