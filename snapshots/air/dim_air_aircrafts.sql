{% snapshot dim_air_aircrafts %}

{{
   config(
       target_schema='snapshot',
       unique_key= 'model',
       strategy='check',
       check_cols = ['class', 'code'],
       dbt_valid_to_current = "cast('9999-01-01' as date)"
   )
}}

select
    "model", class, code
from
{{ ref('stg_air__aircraft') }}
{% endsnapshot %}