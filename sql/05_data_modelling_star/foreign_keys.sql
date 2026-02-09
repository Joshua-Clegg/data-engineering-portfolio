/*
Linking Dimensions with Foreign Keys
Update the fact table
*/

ALTER TABLE fact_covid_country_daily
ADD CONSTRAINT fk_country
FOREIGN KEY (country_id)
REFERENCES dim_country(country_id);

ALTER TABLE fact_covid_country_daily
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);
