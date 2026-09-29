-- Lab 4: Delta Time Travel, Restore & Table Cloning

-- Step 1: Inspect Delta history
DESCRIBE HISTORY lab_db.customers;

-- Step 2: Required time travel to Version 0
SELECT *
FROM lab_db.customers VERSION AS OF 0
ORDER BY customer_id;

-- Step 3: Additional time travel to Version 2
SELECT *
FROM lab_db.customers VERSION AS OF 2
ORDER BY customer_id;

-- Step 4: Additional time travel to Version 1
SELECT *
FROM lab_db.customers VERSION AS OF 1
ORDER BY customer_id;

-- Step 5: Create Shallow Clone
CREATE TABLE lab_db.customers_dev_shallow
SHALLOW CLONE lab_db.customers;

-- Step 6: Verify Shallow Clone
SELECT *
FROM lab_db.customers_dev_shallow
ORDER BY customer_id;

-- Step 7: Create Deep Clone
CREATE TABLE lab_db.customers_backup_deep
DEEP CLONE lab_db.customers;

-- Step 8: Verify Deep Clone
SELECT *
FROM lab_db.customers_backup_deep
ORDER BY customer_id;

-- Step 9: Verify Lab 4 tables
SHOW TABLES IN lab_db;

-- Step 10: Restore the main table to Version 2 for demonstration
RESTORE TABLE lab_db.customers TO VERSION AS OF 2;

-- Step 11: Verify restored Version 2 state
SELECT
    customer_id,
    name,
    email,
    signup_date,
    status
FROM lab_db.customers
ORDER BY customer_id;

-- Step 12: Restore the main table back to Version 6
RESTORE TABLE lab_db.customers TO VERSION AS OF 6;

-- Step 13: Final verification of the restored current state
SELECT
    customer_id,
    name,
    email,
    signup_date,
    status,
    membership_tier
FROM lab_db.customers
ORDER BY customer_id;
