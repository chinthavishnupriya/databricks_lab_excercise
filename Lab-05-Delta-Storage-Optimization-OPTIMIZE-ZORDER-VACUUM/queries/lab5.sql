-- Lab 5: Delta Storage Optimization – OPTIMIZE, Z-ORDER, & VACUUM

-- Step 1: Verify starting state
SELECT *
FROM lab_db.customers
ORDER BY customer_id;

-- Step 2: Ten micro-appends
INSERT INTO lab_db.customers
(customer_id, name, email, signup_date, status, membership_tier)
VALUES (201, 'Customer 201', 'customer201@example.com', '2024-04-01', 'Active', 'Tier-1');

INSERT INTO lab_db.customers
(customer_id, name, email, signup_date, status, membership_tier)
VALUES (202, 'Customer 202', 'customer202@example.com', '2024-04-02', 'Active', 'Tier-1');

INSERT INTO lab_db.customers
(customer_id, name, email, signup_date, status, membership_tier)
VALUES (203, 'Customer 203', 'customer203@example.com', '2024-04-03', 'Active', 'Tier-1');

INSERT INTO lab_db.customers
(customer_id, name, email, signup_date, status, membership_tier)
VALUES (204, 'Customer 204', 'customer204@example.com', '2024-04-04', 'Active', 'Tier-1');

INSERT INTO lab_db.customers
(customer_id, name, email, signup_date, status, membership_tier)
VALUES (205, 'Customer 205', 'customer205@example.com', '2024-04-05', 'Active', 'Tier-1');

INSERT INTO lab_db.customers
(customer_id, name, email, signup_date, status, membership_tier)
VALUES (206, 'Customer 206', 'customer206@example.com', '2024-04-06', 'Active', 'Tier-1');

INSERT INTO lab_db.customers
(customer_id, name, email, signup_date, status, membership_tier)
VALUES (207, 'Customer 207', 'customer207@example.com', '2024-04-07', 'Active', 'Tier-1');

INSERT INTO lab_db.customers
(customer_id, name, email, signup_date, status, membership_tier)
VALUES (208, 'Customer 208', 'customer208@example.com', '2024-04-08', 'Active', 'Tier-1');

INSERT INTO lab_db.customers
(customer_id, name, email, signup_date, status, membership_tier)
VALUES (209, 'Customer 209', 'customer209@example.com', '2024-04-09', 'Active', 'Tier-1');

INSERT INTO lab_db.customers
(customer_id, name, email, signup_date, status, membership_tier)
VALUES (210, 'Customer 210', 'customer210@example.com', '2024-04-10', 'Active', 'Tier-1');

-- Step 3: Compact files and Z-Order
OPTIMIZE lab_db.customers
ZORDER BY (customer_id, signup_date);

-- Step 4: Environment-specific setting from the guide
-- This was attempted but is unsupported in the Databricks Free Serverless environment:
-- SET spark.databricks.delta.vacuum.parallelDelete.enabled = true;

-- Step 5: Vacuum unreferenced files
VACUUM lab_db.customers RETAIN 168 HOURS;

-- Step 6: Final verification
SELECT
    COUNT(*) AS total_customers,
    MIN(customer_id) AS min_customer_id,
    MAX(customer_id) AS max_customer_id
FROM lab_db.customers;
