--gets the sum of the deaths, confirmed, and recovered cases per country per day
CREATE VIEW vw_global_daily_summary AS
SELECT
    report_date,
    SUM(confirmed) AS confirmed,
    SUM(deaths) AS deaths,
    SUM(recovered) AS recovered
FROM covid_country_daily_stats
GROUP BY report_date;

--gets latest date report per distinct country
CREATE VIEW vw_latest_country_snapshot AS
SELECT DISTINCT ON (country_region)
    country_region,
    confirmed,
    deaths,
    recovered,
    active,
    report_date
FROM covid_country_daily_stats
ORDER BY country_region, report_date DESC;
