
{{
  config(
    materialized='view'
  )
}}

WITH src_events_event_page_url AS (
    SELECT
    *
    FROM {{ source('sql_server_dbo','events') }}
)



SELECT
    MD5(PAGE_URL) AS EVENT_PAGE_URL_ID,
    PAGE_URL
FROM src_events_event_page_url
GROUP BY PAGE_URL