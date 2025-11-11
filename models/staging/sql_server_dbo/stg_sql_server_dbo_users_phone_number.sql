
{{
  config(
    materialized='view'
  )
}}

WITH src_users_phone_number AS (
    SELECT
    *
    FROM {{ source('sql_server_dbo','users') }}
)

SELECT
    USER_ID AS USER_PHONE_ID,
    PHONE_NUMBER,
    _FIVETRAN_DELETED,
    _FIVETRAN_SYNCED
    FROM src_users_phone_number

