with stg_countries as (
  select distinct
    country_name,
    country_code
  from {{source('corona', 'cases')}}
)

select * from stg_countries
