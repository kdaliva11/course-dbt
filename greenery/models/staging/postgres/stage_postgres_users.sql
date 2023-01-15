WITH src_users AS (
    SELECT * FROM {{ source('postgres', 'users') }}
)

, renamed_recast AS (
    SELECT
        user_id,
        first_name,
        last_name,
        email,
        phone_number,
        created_at,
        updated_at,
        address_id
    FROM src_users
)

SELECT * FROM renamed_recast