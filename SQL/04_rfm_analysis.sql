-- Top Revenue Customers
SELECT *
FROM rfm_analysis
ORDER BY monetary DESC
LIMIT 10;

-- Top Frequent Customers
SELECT *
FROM rfm_analysis
ORDER BY frequency DESC
LIMIT 10;

-- Top Recent Customers
SELECT *
FROM rfm_analysis
ORDER BY recency ASC
LIMIT 10;