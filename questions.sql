
select * from dim_date
select * from dim_cities
select * from dim_plan
select * from fact_atliqo_metrics
select * from fact_market_share
select * from fact_plan_revenue


-- 1. Total Revenue

SELECT 
    SUM(atliqo_revenue_crores) as Total_Revenue
FROM
    fact_atliqo_metrics
    
-- 2. Avg Revenue 
SELECT 
    Avg(atliqo_revenue_crores) as Avg_Revenue
FROM
    fact_atliqo_metrics
    
-- 3. Average Revenue Per User
SELECT 
    Avg(arpu) as ARPU
FROM
    fact_atliqo_metrics

-- 4. Total Active Users 
SELECT 
    SUM(active_users_lakhs) as Active_Users
FROM
    fact_atliqo_metrics
    
-- 5. Total Unsubscribed Users
SELECT 
    SUM(unsubscribed_users_lakhs) as Unsubscribed_Users
FROM
    fact_atliqo_metrics

-- 6. Monthly active users
SELECT 
    ROUND(Avg(active_users_lakhs),2) as  Monthly_active_users
FROM
    fact_atliqo_metrics


-- 7. Market Share %
SELECT 
    ROUND(Avg(ms_pct),2) as Market_Share
FROM
    fact_market_share
    
-- 8. Revenue Before 5G and After 5G
SELECT 
    SUM(atliqo_revenue_crores) AS Revenue,
    before_after_5g
FROM
    dim_date
        JOIN
    fact_atliqo_metrics ON dim_date.date = fact_atliqo_metrics.date
GROUP BY before_after_5g
 

-- 9. ARPU Before 5G and After 5G
SELECT 
    Avg(arpu) AS ARPU,
    before_after_5g
FROM
    dim_date
        JOIN
    fact_atliqo_metrics ON dim_date.date = fact_atliqo_metrics.date
GROUP BY before_after_5g



-- 10. Active Users Before 5G and After 5G
SELECT 
    SUM(active_users_lakhs) AS Active_Users,
    before_after_5g
FROM
    dim_date
        JOIN
    fact_atliqo_metrics ON dim_date.date = fact_atliqo_metrics.date
GROUP BY before_after_5g



-- 11. Unsubscribed users Before 5G and After 5G
SELECT 
    SUM(unsubscribed_users_lakhs) AS Unsubscribed_users,
    before_after_5g
FROM
    dim_date
        JOIN
    fact_atliqo_metrics ON dim_date.date = fact_atliqo_metrics.date
GROUP BY before_after_5g



