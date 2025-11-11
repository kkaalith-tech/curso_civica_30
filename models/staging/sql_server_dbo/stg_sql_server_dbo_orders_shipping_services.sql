{{
  config(
    materialized='view'
  )
}}

WITH src_orders_shipping_services AS (
    SELECT
        *
    FROM {{ source('sql_server_dbo','orders') }}
)

SELECT
    md5(shipping_service) AS id_shipping_service,
    shipping_service
FROM src_orders_shipping_services
GROUP BY shipping_service
