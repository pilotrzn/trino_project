{{
  config(
    materialized = 'table',
    tags = 'stg_air'
    )
}}
 SELECT  
    "model", class, code
 FROM {{ source('air-2024', 'aircraft') }}
