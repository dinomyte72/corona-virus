with facts as (
  select
    to_date(date,'DD/MM/YYYY') as date,
    country_code,
    REGEXP_REPLACE(country_name, '_', ' ', 'g') as country_name,
    cases,
    deaths
  from {{source('corona', 'cases')}}
)

select * from facts
