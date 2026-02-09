/*
Why STAR?
Faster queries
Easier to understand
Industry standard for analytics warehouses
Exactly what interviewers expect at junior–mid level
*/

CREATE TABLE fact_covid_country_daily (
    date_id                DATE NOT NULL,
    country_id             INTEGER NOT NULL,
    confirmed              INTEGER,
    deaths                 INTEGER,
    recovered              INTEGER,
    active                 INTEGER,
    new_cases              INTEGER,
    new_deaths             INTEGER,
    new_recovered           INTEGER,

    CONSTRAINT fact_covid_pk
        PRIMARY KEY (date_id, country_id)
);
