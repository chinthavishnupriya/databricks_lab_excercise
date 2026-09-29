# Databricks Lab 8 – Medallion Silver to Gold & SCD Type 2

## Objective
Build a curated Gold daily-revenue table and implement Slowly Changing Dimension (SCD) Type 2 history tracking using Delta Lake.

## Environment
- Databricks Free Edition / Serverless
- Catalog: `workspace`
- Schema: `lab_db`
- Silver: `workspace.lab_db.silver_orders`
- Gold revenue: `workspace.lab_db.gold_daily_revenue`
- Gold customer dimension: `workspace.lab_db.gold_dim_customers`

## Part 1 – Silver Verification
The Lab 7 Silver table was verified before starting Lab 8:
- 513 rows
- 513 distinct order IDs
- Minimum order ID: 1001
- Maximum order ID: 3012

## Part 2 – Gold Daily Revenue
Created `workspace.lab_db.gold_daily_revenue` from Silver using:
- `DATE(order_ts)` as `revenue_date`
- `customer_id`
- `SUM(amount_num)` as `total_revenue`

Verification:
- Gold rows: 142
- Customers: 21
- Overall revenue: 368023

## Part 3 – SCD Type 2
Created the initial `gold_dim_customers` table with:
- `customer_id`
- `name`
- `email`
- `effective_date`
- `end_date`
- `is_current`

Initial state:
- 13 total records
- 13 current records
- 0 historical records

A staging update was then created for customer 102 (Bob Jones):
- Old email: `bob_new@example.com`
- New email: `bob_updated@example.com`

The guide's MERGE pattern expired the existing current record. During verification, its `NULL` merge-key branch produced an incorrect NULL-key record, so that test artifact was removed and the new current Bob version was explicitly inserted with customer_id 102. This preserves the intended SCD Type 2 result described by the guide.

Final SCD state:
- 14 total records
- 13 unique customers
- 13 current records
- 1 historical record

Bob has two versions:
- `bob_new@example.com` → historical, `is_current = false`
- `bob_updated@example.com` → current, `is_current = true`

## Screenshot Evidence
1. Silver verification
2. Gold table creation
3. Gold aggregation verification
4. Customer source verification
5. Initial SCD dimension
6. Initial SCD verification
7. Staging update
8. SCD MERGE result
9. Bob SCD history
10. Final SCD verification
