
{{
  config(
    materialized='view'
  )
}}

WITH src_states AS (
    SELECT
    *
    FROM {{ source('sql_server_dbo','addresses') }}
)

SELECT
    MD5(STATE) AS STATE_ID,
    STATE,
    MD5(COUNTRY) AS COUNTRY_ID
FROM src_states
WHERE STATE IS NOT NULL
GROUP BY STATE, COUNTRY