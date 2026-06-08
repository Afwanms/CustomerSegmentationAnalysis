-- Who are our most valuable customers?
SELECT *
FROM customer_segment
WHERE segment = 'Champions'
ORDER BY monetary DESC
LIMIT 10;

-- How can customers be grouped?
SELECT
    segment,
    COUNT(*) AS customers
FROM customer_segment
GROUP BY segment;

-- Which segments contribute the most revenue?
SELECT
    cs.segment,
    ROUND(SUM(cs.monetary)::numeric) AS revenue
FROM customer_segment cs
GROUP BY cs.segment
ORDER BY revenue DESC;