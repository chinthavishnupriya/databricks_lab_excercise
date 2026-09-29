-- Lab 8 verification queries

-- 1. Silver verification
SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT order_id) AS distinct_order_ids,
       MIN(order_id) AS min_order_id,
       MAX(order_id) AS max_order_id
FROM workspace.lab_db.silver_orders;

-- 2. Gold daily revenue
CREATE OR REPLACE TABLE workspace.lab_db.gold_daily_revenue
USING DELTA
AS
SELECT DATE(order_ts) AS revenue_date,
       customer_id,
       SUM(amount_num) AS total_revenue
FROM workspace.lab_db.silver_orders
GROUP BY DATE(order_ts), customer_id;

-- 3. Gold verification
SELECT COUNT(*) AS gold_rows,
       COUNT(DISTINCT customer_id) AS customers,
       SUM(total_revenue) AS overall_revenue
FROM workspace.lab_db.gold_daily_revenue;

-- 4. Customer source
SELECT *
FROM workspace.lab_db.customers
ORDER BY customer_id;

-- 5. Initial SCD dimension
CREATE OR REPLACE TABLE workspace.lab_db.gold_dim_customers
USING DELTA
AS
SELECT customer_id, name, email,
       current_date() AS effective_date,
       CAST(NULL AS DATE) AS end_date,
       TRUE AS is_current
FROM workspace.lab_db.customers;

-- 6. SCD staging update
CREATE OR REPLACE TABLE workspace.lab_db.staging_updates
USING DELTA
AS
SELECT 102 AS customer_id,
       'Bob Jones' AS name,
       'bob_updated@example.com' AS email;

-- 7. Final SCD verification
SELECT COUNT(*) AS total_records,
       COUNT(DISTINCT customer_id) AS unique_customers,
       SUM(CASE WHEN is_current = TRUE THEN 1 ELSE 0 END) AS current_records,
       SUM(CASE WHEN is_current = FALSE THEN 1 ELSE 0 END) AS historical_records
FROM workspace.lab_db.gold_dim_customers;
