WITH src_order_items AS (
    SELECT * FROM {{ source('postgres', 'order_items') }}
)

, renamed_recast AS (
    SELECT
        order_id,
        product_id,
        quantity
    FROM src_order_items
)

SELECT * FROM renamed_recast