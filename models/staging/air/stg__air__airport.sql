{{
  config(
    materialized = 'table',
    tags = 'stg_air'
    )
}}
select
    airport_code, airport_name, city, airport_tz, continent, iso_country, iso_region, intnl
from {{ source('air-2024', 'airport') }}

