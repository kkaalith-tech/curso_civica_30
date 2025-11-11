{% snapshot budget_snapshot_hard_deletes_ignore %}

{{
    config(
      target_schema='snapshots',
      unique_key='_fivetran_synced',
      strategy='timestamp',
      updated_at='_fivetran_synced',
      hard_deletes='ignore',
    )
}}

select * from {{ source('GOOGLE_SHEETS', 'BUDGET') }}

{% endsnapshot %}