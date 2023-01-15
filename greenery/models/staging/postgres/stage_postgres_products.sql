WITH src_products AS (
    SELECT * FROM {{ source('postgres', 'products') }}
)

, renamed_recast AS (
    SELECT
        product_id,
        name AS product_name,
        price,
        inventory
    FROM src_products
)

SELECT * FROM renamed_recast