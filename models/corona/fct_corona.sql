with facts as (
  select
    to_date(date,'DD/MM/YYYY') as date,
    country_code,
    REGEXP_REPLACE(country_name, '_', ' ', 'g') as country_name,
    population_2018 as population,
    cases,
    deaths
  from {{source('corona', 'cases2')}}
)

select
  date,
  country_code,
  country_name,
  cases as new_cases,
  deaths as new_deaths,
  sum(cases) over (partition by country_code order by date asc) as running_total_cases,
  sum(deaths) over (partition by country_code order by date asc) as running_total_deaths,
  100000.0*sum(deaths) over (partition by country_code order by date asc)/population as deaths_per_100k
from facts
order by 2,1
