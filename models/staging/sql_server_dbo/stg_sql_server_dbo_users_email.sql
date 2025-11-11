
{{
  config(
    materialized='view'
  )
}}

WITH src_users_email AS (
    SELECT
    *
    FROM {{ source('sql_server_dbo','users') }}
)

SELECT
    USER_ID AS USER_EMAIL_ID,
    EMAIL
    _FIVETRAN_DELETED,
    _FIVETRAN_SYNCED
    FROM src_users_email

