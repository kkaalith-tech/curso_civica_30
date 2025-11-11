
{{
  config(
    materialized='view'
  )
}}

WITH src_zipcodes AS (
    SELECT
    *
    FROM {{ source('sql_server_dbo','addresses') }}
)

SELECT
    MD5(ZIPCODE) AS ZIPCODE_ID,
    ZIPCODE::VARCHAR(20) AS ZIPCODE,
    MD5(STATE) AS STATE_ID
FROM src_zipcodes
WHERE ZIPCODE IS NOT NULL
GROUP BY ZIPCODE, STATE