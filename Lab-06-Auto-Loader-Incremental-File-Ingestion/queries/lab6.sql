-- Lab 6: Incremental File Ingestion with Auto Loader

SELECT COUNT(*) AS total_orders,
       MIN(order_id) AS min_order_id,
       MAX(order_id) AS max_order_id
FROM workspace.lab_db.bronze_orders;

SELECT *
FROM workspace.lab_db.bronze_orders
ORDER BY order_id
LIMIT 10;

DESCRIBE workspace.lab_db.bronze_orders;

SELECT COUNT(*) AS total_orders,
       COUNT(_rescued_data) AS rescued_records
FROM workspace.lab_db.bronze_orders;

SELECT COUNT(*) AS total_orders,
       MAX(order_id) AS latest_order_id
FROM workspace.lab_db.bronze_orders;

SELECT *
FROM workspace.lab_db.bronze_orders
WHERE order_id = '1501';
