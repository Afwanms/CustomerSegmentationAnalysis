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

-- Top Customers
SELECT 
    customer_id, 
    round(SUM(revenue)) AS total_revenue
FROM cust_segment
GROUP BY customer_id
ORDER BY total_revenue DESC;