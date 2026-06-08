-- Total rows
SELECT COUNT(*) AS total_transactions
FROM cust_segment;

-- Data range
SELECT 
    MIN(invoice_date) AS start_date, 
    MAX(invoice_date) AS end_date

-- Total customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM cust_segment;

-- Total revenues
SELECT round(SUM(revenue)) AS total_revenues
FROM cust_segment;

-- Revenue by Country
SELECT 
    country, 
    round(SUM(revenue)) AS total_revenue
FROM cust_segment
GROUP BY country;

-- Monthly revenue
SELECT 
    DATE_TRUNC('month', invoice_date) AS month, 
    round(SUM(revenue)) AS total_revenue
FROM cust_segment
GROUP BY month;