-- Negative values check
SELECT *
FROM covid_country_daily_stats
WHERE confirmed < 0
   OR deaths < 0;

-- Missing regions
SELECT *
FROM covid_country_daily_stats
WHERE who_region IS NULL;
