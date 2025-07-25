CREATE DATABASE atliqo_5g_analysis


CREATE TABLE dim_cities (
    city_code INT PRIMARY KEY,
    city_name VARCHAR(50)
);


CREATE TABLE dim_date (
    date DATE PRIMARY KEY,
    month_name VARCHAR(3),
    before_after_5g VARCHAR(10),
    time_period INT
);

CREATE TABLE dim_plan (
    plan VARCHAR(10) PRIMARY KEY,
    plan_description VARCHAR(255)
);

CREATE TABLE fact_atliqo_metrics (
    date DATE,
    city_code INT,
    company VARCHAR(50),
    atliqo_revenue_crores DECIMAL(10, 2),
    arpu DECIMAL(10, 2),
    active_users_lakhs DECIMAL(10, 2),
    unsubscribed_users_lakhs DECIMAL(10, 2),
    PRIMARY KEY (date, city_code, company),
    FOREIGN KEY (city_code) REFERENCES dim_cities(city_code),
    FOREIGN KEY (date) REFERENCES dim_date(date)
);


CREATE TABLE fact_market_share (
    date DATE,
    city_code INT,
    tmv_city_crores DECIMAL(10, 2),
    company VARCHAR(50),
    ms_pct DECIMAL(5, 2),
    PRIMARY KEY (date, city_code, company),
    FOREIGN KEY (city_code) REFERENCES dim_cities(city_code),
    FOREIGN KEY (date) REFERENCES dim_date(date)
);


CREATE TABLE fact_plan_revenue (
    date DATE,
    city_code INT,
    plans VARCHAR(10),
    plan_revenue_crores DECIMAL(10, 2),
    PRIMARY KEY (date, city_code, plans),
    FOREIGN KEY (city_code) REFERENCES dim_cities(city_code),
    FOREIGN KEY (date) REFERENCES dim_date(date),
    FOREIGN KEY (plans) REFERENCES dim_plan(plan)
);


select * from dim_date
select * from dim_cities
select * from dim_plan
select * from fact_atliqo_metrics
select * from fact_market_share
select * from fact_plan_revenue

