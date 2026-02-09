--Populate the fact table
INSERT INTO fact_covid_country_daily (
    date_id,
    country_id,
    confirmed,
    deaths,
    recovered,
    active,
    new_cases,
    new_deaths,
    new_recovered
)
SELECT
    r.report_date AS date_id,
    c.country_id,
    r.confirmed,
    r.deaths,
    r.recovered,
    r.active,
    r.new_cases,
    r.new_deaths,
    r.new_recovered
FROM covid_country_daily_stats r
JOIN dim_country c
    ON r.country_region = c.country_name;

-----Validation Checks---------
--row count comparison
SELECT COUNT(*) FROM covid_country_daily_stats;
SELECT COUNT(*) FROM fact_covid_country_daily;

--missing country check
SELECT DISTINCT country_region
FROM covid_country_daily_stats r
LEFT JOIN dim_country c
    ON r.country_region = c.country_name
WHERE c.country_id IS NULL;
