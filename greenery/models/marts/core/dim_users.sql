{{
  config(
    materialized='table'
  )
}}

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    a.address,
    a.zipcode,
    a.state,
    a.country, 
    u.created_at,
    u.updated_at

FROM {{ ref('stage_postgres_users') }} u
LEFT JOIN {{ ref('stage_postgres_addresses') }} a
ON u.address_id = a.address_id

LEFT JOIN {{ ref('stage_postgres_orders') }} o 
ON u.user_id = o.user_id