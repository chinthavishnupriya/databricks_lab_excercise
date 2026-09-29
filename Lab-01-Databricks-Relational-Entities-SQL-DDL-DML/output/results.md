# Lab 1 Output Summary

## Schema
`lab_db` created successfully. Databricks returned `OK`.

## Table
`customers` Delta table created successfully.

## Table Structure
Verified with `DESCRIBE customers`:

1. customer_id — int
2. name — string
3. email — string
4. signup_date — date
5. status — string

## Initial State
`SELECT * FROM customers` returned no rows before insertion.

## Insert
Two customer records were inserted:
- 101 — Alice Smith — alice@example.com — 2024-01-15 — Active
- 102 — Bob Jones — bob@example.com — 2024-02-01 — Pending

## MERGE
MERGE matched customer_id 102 and updated:
- email → bob_new@example.com
- status → Active

Databricks execution output showed 1 affected row and 1 updated row.

## Final Expected/Observed Data
- 101 — Alice Smith — alice@example.com — 2024-01-15 — Active
- 102 — Bob Jones — bob_new@example.com — 2024-02-01 — Active

Screenshots in `screenshots/` provide the execution evidence.
