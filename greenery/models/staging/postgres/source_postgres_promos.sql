WITH src_promos AS (
    SELECT * FROM {{ source('postgres', 'promos') }}
)

, renamed_recast AS (
    SELECT
        promo_id,
        discount,
        status
    FROM src_promos
)

SELECT * FROM renamed_recast