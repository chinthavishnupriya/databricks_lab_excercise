# Databricks Lab 9 — Declarative Medallion Pipeline with Delta Live Tables

## Overview
Completed DLT lab implementing a managed Medallion pipeline with Bronze ingestion, Silver cleansing, Gold aggregation, and data-quality expectations.

## Objective
- Define a Bronze DLT streaming table with Auto Loader.
- Define a Silver DLT table with expectations.
- Create the Gold analytical output.
- Verify the dependency graph and pipeline run.

## Architecture
Landing JSON → dlt_bronze_orders → dlt_silver_orders → dlt_gold_daily_sales.

## Bronze
Auto Loader reads JSON files from /Volumes/workspace/lab_db/lab6_landing/orders/.

The guide uses /tmp/lab_landing/orders/, but the Free Edition environment used the Unity Catalog Volume path because of the storage restrictions encountered earlier.

## Silver
The Silver stage:
- Casts amount to double.
- Converts order_timestamp to timestamp.
- Removes duplicate order_id values.
- Applies valid_amount with dlt.expect_or_drop.
- Applies valid_customer with dlt.expect_or_drop.

## Gold
The supplied implementation uses @dlt.view and aggregates amount_num by customer_id into total_spent.

## Results
- Bronze records: 501
- Silver records: 501
- valid_amount failures: 0
- valid_customer failures: 0
- Gold view: created successfully
- Pipeline DAG: generated successfully
- Pipeline run: successful

## Evidence
Screenshots document settings, Bronze/Silver code, Silver/Gold code, successful execution, DAG, expectations, and final tables.

## Source Alignment
The guide describes the Gold step as a materialized view while its supplied PySpark example uses @dlt.view. This repository follows the supplied implementation and therefore documents a DLT view.

## Learning Outcome
Lab 9 shows how the earlier individual transformations can be combined into a declarative managed pipeline with dependencies and built-in quality checks.
