--Daily case growth per country
SELECT
    country_region,
    report_date,
    confirmed,
    confirmed
      - LAG(confirmed) OVER ( --Gets the result from the previous row and reports the difference
            PARTITION BY country_region
            ORDER BY report_date ASC
        ) AS daily_increase
FROM covid_country_daily_stats;

--Rolling 7-day average
SELECT
    country_region,
    report_date,
    AVG(new_cases) OVER (
        PARTITION BY country_region
        ORDER BY report_date ASC
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS rolling_7_day_avg --calculates avg of current row and 6 rows before it 
FROM covid_country_daily_stats;
