-- Lab 3: Delta Lake ACID, Schema Enforcement & Schema Evolution

USE lab_db;

-- 1. Inspect Delta transaction history
DESCRIBE HISTORY lab_db.customers;

-- 2. Schema verification before evolution
DESCRIBE lab_db.customers;

-- 3. Schema-enforcement test
-- This intentionally uses an invalid STRING value for customer_id INT.
-- Do NOT rerun unless you want to reproduce the documented error.
INSERT INTO lab_db.customers
VALUES
(
  'INVALID_ID',
  'Schema Test',
  'schema_test@example.com',
  DATE '2024-03-10',
  'Active'
);

-- 4. Final verification
SELECT
    customer_id,
    name,
    email,
    signup_date,
    status,
    membership_tier
FROM lab_db.customers
ORDER BY customer_id;

-- 5. Verify evolved schema
DESCRIBE lab_db.customers;
