-- Lab 7 verification queries

SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT order_id) AS distinct_order_ids
FROM workspace.lab_db.bronze_orders;

SELECT COUNT(*) AS silver_rows,
       SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_ids,
       SUM(CASE WHEN CAST(amount AS DOUBLE) <= 0 THEN 1 ELSE 0 END) AS invalid_amounts,
       COUNT(DISTINCT order_id) AS distinct_order_ids
FROM workspace.lab_db.silver_orders;

SELECT COUNT(*) AS silver_rows,
       MIN(order_id) AS min_order_id,
       MAX(order_id) AS max_order_id
FROM workspace.lab_db.silver_orders;

SELECT order_id, customer_id, amount, order_timestamp
FROM workspace.lab_db.silver_orders
ORDER BY order_id
LIMIT 20;
