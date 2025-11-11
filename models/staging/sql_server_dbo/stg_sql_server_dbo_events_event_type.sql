
{{
  config(
    materialized='view'
  )
}}

WITH src_events_event_type AS (
    SELECT
    *
    FROM {{ source('sql_server_dbo','events') }}
)



SELECT
    MD5(EVENT_TYPE) AS EVENT_TYPE_ID,
    EVENT_TYPE
FROM src_events_event_type
GROUP BY EVENT_TYPE