
{{
  config(
    materialized='view',
  )
}}

WITH src_users AS (
    SELECT
    *
    FROM {{ source('sql_server_dbo','users') }}
)

SELECT
    USER_ID,
    FIRST_NAME,
    LAST_NAME,
    ADDRESS_ID,
    CAST(CONVERT_TIMEZONE('UTC', CREATED_AT) AS TIMESTAMP_NTZ) AS CREATED_AT,
    CAST(CONVERT_TIMEZONE('UTC', UPDATED_AT) AS TIMESTAMP_NTZ) AS UPDATED_AT,
    TOTAL_ORDERS,
    _FIVETRAN_DELETED,
    _FIVETRAN_SYNCED
    FROM src_users

{% if is_incremental() %}

  where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }})

{% endif %}

