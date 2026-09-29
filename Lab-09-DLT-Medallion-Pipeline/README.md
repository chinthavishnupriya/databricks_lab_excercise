# Lab 09 — Declarative Pipeline Development with Delta Live Tables (DLT)

## Objective

Construct an automated Medallion pipeline using Delta Live Tables (DLT) with PySpark decorators and data quality expectations.

## Pipeline

```text
dlt_bronze_orders
        ↓
dlt_silver_orders
        ↓
dlt_gold_daily_sales
```

### Bronze
Uses Auto Loader to ingest JSON order files from the Unity Catalog Volume:

`/Volumes/workspace/lab_db/lab6_landing/orders/`

### Silver
Cleanses the Bronze stream by:
- Converting `amount` to `double`
- Converting `order_timestamp` to timestamp
- Removing duplicate `order_id` values
- Applying `valid_amount` with `@dlt.expect_or_drop`
- Applying `valid_customer` with `@dlt.expect_or_drop`

### Gold
Creates `dlt_gold_daily_sales` as a DLT view that aggregates `amount_num` by `customer_id` and exposes the result as `total_spent`.

## Execution Results

- Bronze records written: **501**
- Silver records written: **501**
- `valid_amount`: **0% failures, 0 failed records**
- `valid_customer`: **0% failures, 0 failed records**
- Gold view: **created successfully**
- Pipeline DAG: **successfully generated**
- Pipeline run: **successful**

## Environment Note

The practice guide uses `/tmp/lab_landing/orders/` for the Bronze source. In this Databricks Free Edition workspace, the lab used the Unity Catalog Volume path from the previous Auto Loader lab:

`/Volumes/workspace/lab_db/lab6_landing/orders/`

The guide describes the Gold step as a materialized view, while the supplied PySpark example uses `@dlt.view`. This implementation follows the supplied example and therefore creates `dlt_gold_daily_sales` as a DLT view.

## Evidence

See the `screenshots/` folder for configuration, code, execution, DAG, expectation, and final table evidence.
