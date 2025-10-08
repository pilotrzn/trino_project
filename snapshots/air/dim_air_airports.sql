{% snapshot dim_air_airports %}

{{
   config(
       target_schema='snapshot',
       unique_key= 'airport_code',
       strategy='check',
       check_cols = ['city', 'airport_name', 'airport_tz', 'iso_region', 'intnl'],
       dbt_valid_to_current = "cast('9999-01-01' as date"
   )
}}

select
    airport_code, airport_name, city, airport_tz, continent, iso_country, iso_region, intnl
from
{{ ref('stg__air__airport') }}
{% endsnapshot %}