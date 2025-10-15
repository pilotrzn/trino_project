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
  {{ source('air-2024', 'booking') }} as src
{% if is_incremental() %}
  where NOT EXISTS (
  	SELECT 1
  	FROM {{ this }} stg_air
  	WHERE src.booking_id = stg_air.booking_id
  	)
{% endif %}
