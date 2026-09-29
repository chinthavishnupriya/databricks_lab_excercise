-- Databricks Lab 1
-- Relational Entities & Comprehensive SQL DDL/DML

-- 1. Create schema
CREATE SCHEMA IF NOT EXISTS lab_db;

-- 2. Select schema
USE lab_db;

-- 3. Create Delta table
CREATE OR REPLACE TABLE customers (
    customer_id INT,
    name STRING,
    email STRING,
    signup_date DATE,
    status STRING
) USING DELTA;

-- 4. Verify table structure
DESCRIBE customers;

-- 5. Verify initially empty table
SELECT * FROM customers;

-- 6. Insert initial customer records
INSERT INTO customers VALUES
(101, 'Alice Smith', 'alice@example.com', '2024-01-15', 'Active'),
(102, 'Bob Jones', 'bob@example.com', '2024-02-01', 'Pending');

-- 7. Verify inserted records
SELECT * FROM customers
ORDER BY customer_id;

-- 8. MERGE / UPSERT: update Bob's email and status
MERGE INTO customers AS target
USING (
    SELECT
        102 AS customer_id,
        'Bob Jones' AS name,
        'bob_new@example.com' AS email,
        '2024-02-01' AS signup_date,
        'Active' AS status
) AS source
ON target.customer_id = source.customer_id
WHEN MATCHED THEN
    UPDATE SET
        target.email = source.email,
        target.status = source.status
WHEN NOT MATCHED THEN
    INSERT *;

-- 9. Final verification
SELECT *
FROM customers
ORDER BY customer_id;
