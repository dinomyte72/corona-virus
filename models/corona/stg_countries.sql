with stg_countries as (
  select
    REGEXP_REPLACE(country_name, '_', ' ', 'g') as country_name,
    country_code
  from {{source('corona', 'cases')}}
)

select distinct * from stg_countries
