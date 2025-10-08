{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'append',
    properties= {
      "format": "'PARQUET'",
      "partitioning": "ARRAY['update_date']",
    }
)}}
select 
  booking_id, 
  booking_ref, 
  booking_name, 
  account_id, 
  email, 
  phone, 
  update_ts, 
  price,CAST(update_ts AS date) AS update_date
from 
  {{ source('air-2024', 'booking') }}
{% if is_incremental() %}
  where cast('0x' || booking_ref as bigint) > (select max(cast('0x' || booking_ref as bigint)) from {{ this }})
{% endif %}