{% snapshot dim_air_account %}

{{
   config(
       target_schema='snapshot',
       unique_key='account_id',
       strategy='check',   
       check_cols = ['login', 'first_name', 'last_name', 'frequent_flyer_id'],
       dbt_valid_to_current = "cast('9999-01-01' as date)"
   )
}}
select
    account_id, 
    login, 
    first_name, 
    last_name, 
    frequent_flyer_id
from {{ ref('stg_air__account') }}

{% endsnapshot %}