{{
  config(
    materialized='table'
  )
}}

SELECT
    product_id,
    product_name,
    price,
    inventory

FROM {{ ref('stage_postgres_products') }} 