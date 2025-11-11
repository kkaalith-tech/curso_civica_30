with 

source as (

    select * from {{ source('sql_server_dbo', 'events') }}

),

renamed as (

    select
        event_id,
        MD5(PAGE_URL) AS EVENT_PAGE_URL_ID,
        MD5(EVENT_TYPE) AS EVENT_TYPE_ID,
        user_id,
        product_id,
        session_id,
        CAST(CONVERT_TIMEZONE('UTC', CREATED_AT) AS TIMESTAMP_NTZ) AS CREATED_AT,
        order_id,
        _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed