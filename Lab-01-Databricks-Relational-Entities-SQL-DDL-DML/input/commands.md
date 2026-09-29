# Lab 1 Inputs / Execution Commands

## DDL
```sql
CREATE SCHEMA IF NOT EXISTS lab_db;
USE lab_db;

CREATE OR REPLACE TABLE customers (
    customer_id INT,
    name STRING,
    email STRING,
    signup_date DATE,
    status STRING
) USING DELTA;
```

## Verification
```sql
DESCRIBE customers;
SELECT * FROM customers;
```

## DML Insert
```sql
INSERT INTO customers VALUES
(101, 'Alice Smith', 'alice@example.com', '2024-01-15', 'Active'),
(102, 'Bob Jones', 'bob@example.com', '2024-02-01', 'Pending');
```

## MERGE / Upsert
```sql
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
```

## Final Verification
```sql
SELECT *
FROM customers
ORDER BY customer_id;
```
