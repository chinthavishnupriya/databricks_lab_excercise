-- Lab 4: Delta Time Travel, Restore & Table Cloning

-- Step 1: Inspect Delta history
DESCRIBE HISTORY lab_db.customers;

-- Step 2: Time travel to Version 2
SELECT *
FROM lab_db.customers VERSION AS OF 2
ORDER BY customer_id;

-- Step 3: Time travel to Version 1
SELECT *
FROM lab_db.customers VERSION AS OF 1
ORDER BY customer_id;

-- Step 4: Create Shallow Clone
CREATE TABLE lab_db.customers_dev_shallow
SHALLOW CLONE lab_db.customers;

-- Step 5: Verify Shallow Clone
SELECT *
FROM lab_db.customers_dev_shallow
ORDER BY customer_id;

-- Step 6: Create Deep Clone
CREATE TABLE lab_db.customers_backup_deep
DEEP CLONE lab_db.customers;

-- Step 7: Verify Deep Clone
SELECT *
FROM lab_db.customers_backup_deep
ORDER BY customer_id;

-- Step 8: Final table verification
SHOW TABLES IN lab_db;
