-- RFM Analysis Queries
-- These simulate what you'd run in a production environment

-- Calculate RFM metrics per customer
WITH customer_metrics AS (
    SELECT 
        customer_id,
        MAX(invoice_date) as last_purchase_date,
        COUNT(DISTINCT invoice_id) as frequency,
        SUM(quantity * unit_price) as monetary,
        COUNT(DISTINCT stock_code) as product_diversity,
        AVG(quantity * unit_price) as avg_order_value
    FROM transactions
    GROUP BY customer_id
),
reference_date AS (
    SELECT MAX(invoice_date) + INTERVAL '1 day' as ref_date
    FROM transactions
)
SELECT 
    cm.customer_id,
    EXTRACT(DAY FROM (rd.ref_date - cm.last_purchase_date)) as recency,
    cm.frequency,
    cm.monetary,
    cm.product_diversity,
    cm.avg_order_value
FROM customer_metrics cm
CROSS JOIN reference_date rd
WHERE cm.monetary > 0;

-- Get customer country distribution
SELECT 
    country,
    COUNT(DISTINCT customer_id) as customer_count,
    SUM(quantity * unit_price) as total_revenue
FROM transactions
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 10;

-- Monthly revenue trends
SELECT 
    DATE_TRUNC('month', invoice_date) as month,
    COUNT(DISTINCT customer_id) as active_customers,
    COUNT(DISTINCT invoice_id) as order_count,
    SUM(quantity * unit_price) as revenue
FROM transactions
GROUP BY DATE_TRUNC('month', invoice_date)
ORDER BY month;
