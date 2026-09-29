# Lab 3 — Delta Lake ACID, Schema Enforcement & Schema Evolution

## Objective
Inspect Delta Lake transaction history, demonstrate schema enforcement, and perform controlled
schema evolution using PySpark `mergeSchema`.

## Databricks Environment
- Catalog/Database: `lab_db`
- Target table: `lab_db.customers`
- Table format: Delta

## Guide-based tasks
1. Inspect Delta transaction history.
2. Attempt an incompatible write to demonstrate schema enforcement.
3. Enable schema evolution with `mergeSchema = true`.
4. Verify the evolved schema and data.

## Final Result
The `customers` table contains:
- `customer_id INT`
- `name STRING`
- `email STRING`
- `signup_date DATE`
- `status STRING`
- `membership_tier STRING`

The evolved row is:
- Customer 103 — Charlie Brown — Tier-1

## Notes
The screenshots document the actual Databricks execution. An attempted direct access to
`/_delta_log` through DBFS produced a DBFS-disabled error in the Free/Serverless environment;
this is recorded as an environment limitation rather than treated as a failed Delta operation.
