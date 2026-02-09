/*
Date dimensional table
Faster time-based analytics
Avoid repeated date functions
 */

CREATE TABLE dim_date (
    date_id        DATE PRIMARY KEY,
    year           INTEGER,
    month          INTEGER,
    day            INTEGER,
    week           INTEGER,
    day_of_week    INTEGER
);

--Country dimensional table
CREATE TABLE dim_country (
    country_id     SERIAL PRIMARY KEY,
    country_name   TEXT UNIQUE,
    population     BIGINT,
    continent      TEXT
);

--region dimensional table
CREATE TABLE dim_region (
    region_id      SERIAL PRIMARY KEY,
    who_region     TEXT UNIQUE
);

