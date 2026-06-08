-- Which customers purchase most frequently?
SELECT 
    customer_id, 
    COUNT(DISTINCT invoice_no) AS purchase_frequency
FROM cust_segment
GROUP BY customer_id
ORDER BY purchase_frequency DESC
LIMIT 10;

-- Which customers generate the highest revenue?
SELECT 
    customer_id, 
    SUM(revenue) AS total_revenue
FROM cust_segment
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Which customers have not purchased recently?
SELECT
    customer_id,
    MAX(invoice_date) AS last_purchase
FROM cust_segment
GROUP BY customer_id
ORDER BY last_purchase ASC;