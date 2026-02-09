--Populate the dimensional date table
INSERT INTO dim_date (
    date_id,
    year,
    month,
    day,
    week,
    day_of_week
)
SELECT DISTINCT
    report_date AS date_id,
    EXTRACT(YEAR FROM report_date)::INT,
    EXTRACT(MONTH FROM report_date)::INT,
    EXTRACT(DAY FROM report_date)::INT,
    EXTRACT(WEEK FROM report_date)::INT,
    EXTRACT(DOW FROM report_date)::INT
FROM covid_country_daily_stats
ON CONFLICT (date_id) DO NOTHING;

--Populate the dimensional country table
INSERT INTO dim_country (
    country_name
)
SELECT DISTINCT
    country_region
FROM covid_country_daily_stats
WHERE country_region IS NOT NULL
ON CONFLICT (country_name) DO NOTHING;
--add population from the covid_country_snapshot
UPDATE dim_country c
SET
    population = s.population,
    continent  = s.continent
FROM covid_country_snapshot s
WHERE c.country_name = s.country_region
  AND (c.population IS NULL OR c.continent IS NULL);



--Populate the dimensional region table
INSERT INTO dim_region (
    who_region
)
SELECT DISTINCT
    who_region
FROM covid_country_daily_stats
WHERE who_region IS NOT NULL
ON CONFLICT (who_region) DO NOTHING;


