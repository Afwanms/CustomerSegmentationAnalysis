-- Create a table named 'cust_segment' with the specified columns and data types
CREATE TABLE cust_segment (
    invoice_no VARCHAR(20),
    stock_code VARCHAR(50),
    description TEXT,
    quantity INT,
    invoice_date TIMESTAMP,
    unit_price NUMERIC(10,2),
    customer_id VARCHAR(20),
    country VARCHAR(100),
    revenue NUMERIC(12,2)
);

-- RFM analysis SQL query
CREATE TABLE rfm_analysis AS
SELECT
    customer_id,
    DATE '2011-12-10' - MAX(invoice_date)::date AS recency,
    COUNT(DISTINCT invoice_no) AS frequency,
    ROUND(SUM(revenue)::numeric,2) AS monetary
FROM cust_segment
GROUP BY customer_id;

-- Customer Segmentation SQL query
CREATE TABLE customer_segment AS
WITH rfm_score AS (
    SELECT
        customer_id,
        recency,
        frequency,
        monetary,

        NTILE(5) OVER (ORDER BY recency DESC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,
        NTILE(5) OVER (ORDER BY monetary ASC) AS m_score

    FROM rfm_analysis
)
SELECT *,
    CASE
        WHEN r_score >= 4
         AND f_score >= 4
         AND m_score >= 4
        THEN 'Champions'

        WHEN r_score >= 3
         AND f_score >= 3
        THEN 'Loyal Customers'

        WHEN r_score <= 2
        THEN 'At Risk'

        ELSE 'Others'
    END AS segment
FROM rfm_score;