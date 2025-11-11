
{{
  config(
    materialized='view'
  )
}}

WITH src_addresses AS (
    SELECT
    *
    FROM {{ source('sql_server_dbo','addresses') }}
)

SELECT
    ADDRESS_ID,
    ADDRESS AS ADDRESS_COMPLETED,
    REGEXP_REPLACE(ADDRESS, '[0-9]+', '') AS ADDRESS_STREET,
    MD5(ZIPCODE) AS ZIPCODE_ID,
    _FIVETRAN_DELETED,
    _FIVETRAN_SYNCED
FROM src_addresses