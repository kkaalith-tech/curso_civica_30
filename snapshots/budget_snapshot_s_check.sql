{% snapshot budget_snapshot_s_check %}

{{
    config(
      target_schema='snapshots',
      unique_key='_fivetran_synced',
      strategy='check',
      check_cols=['quantity'],
        )
}}

select * from {{ source('GOOGLE_SHEETS', 'BUDGET') }}

{% endsnapshot %}