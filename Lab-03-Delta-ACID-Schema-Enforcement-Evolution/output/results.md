# Lab 3 Results

## 1. Transaction History
`DESCRIBE HISTORY lab_db.customers` was used to inspect Delta transaction history.

## 2. Schema Enforcement
An incompatible insert was attempted using:

`'INVALID_ID'` for the `customer_id INT` column.

Databricks rejected the write with a `CAST_INVALID_ID_INPUT` error because the
STRING value could not be cast to INT.

## 3. Schema Evolution
A PySpark DataFrame containing the new `membership_tier` column was appended using:

`.option("mergeSchema", "true")`

The operation completed successfully.

## 4. Final Schema
The table contains six columns:

| Column | Type |
|---|---|
| customer_id | int |
| name | string |
| email | string |
| signup_date | date |
| status | string |
| membership_tier | string |

## 5. Final Data
The final verified data contains three customers:

| customer_id | name | status | membership_tier |
|---:|---|---|---|
| 101 | Alice Smith | Active | NULL |
| 102 | Bob Jones | Active | NULL |
| 103 | Charlie Brown | Active | Tier-1 |

## Environment Note
A direct attempt to inspect the physical `/_delta_log` path through DBFS produced
`[DBFS_DISABLED] Public DBFS root is disabled` in the current environment.
