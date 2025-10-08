{{
  config(
    materialized = 'table',
    tags = 'stg_air'
    )
}}
SELECT
    account_id, 
    login, 
    first_name, 
    last_name, 
    frequent_flyer_id
FROM
{{ source('air-2024', 'account') }}
