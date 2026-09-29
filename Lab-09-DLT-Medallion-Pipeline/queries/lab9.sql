-- Lab 09 — Validation queries / reference SQL
-- These queries are for documenting the resulting objects after the DLT pipeline run.

SHOW TABLES IN workspace.lab_db;

SELECT COUNT(*) AS bronze_count
FROM workspace.lab_db.dlt_bronze_orders;

SELECT COUNT(*) AS silver_count
FROM workspace.lab_db.dlt_silver_orders;

SELECT
    COUNT(*) AS silver_count,
    COUNT(DISTINCT order_id) AS distinct_order_ids,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customers,
    SUM(CASE WHEN amount_num <= 0 OR amount_num IS NULL THEN 1 ELSE 0 END) AS invalid_amounts
FROM workspace.lab_db.dlt_silver_orders;

-- Gold is a DLT view in this implementation.
SELECT *
FROM workspace.lab_db.dlt_gold_daily_sales
ORDER BY customer_id;
