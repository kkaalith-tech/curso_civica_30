
{{
  config(
    materialized='view'
  )
}}

WITH src_country AS (
    SELECT
    *
    FROM {{ source('sql_server_dbo','addresses') }}
)

SELECT
    MD5(COUNTRY) AS COUNTRY_ID,
    COUNTRY
FROM src_country
WHERE COUNTRY IS NOT NULL
GROUP BY COUNTRY