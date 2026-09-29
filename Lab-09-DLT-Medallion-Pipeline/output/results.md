# Lab 09 Results

## 1. Pipeline Configuration

- Pipeline name: `Lab-09-DLT-Medallion-Pipeline`
- Pipeline type: ETL pipeline
- Pipeline mode: Triggered
- Compute: Serverless
- Catalog: `workspace`
- Schema: `lab_db`

## 2. Bronze Result

Object: `dlt_bronze_orders`

- Auto Loader JSON ingestion: successful
- Output records: **501**
- Duration shown by Databricks: **13 seconds**

## 3. Silver Result

Object: `dlt_silver_orders`

- Streaming read from Bronze: successful
- Output records: **501**
- Duration shown by Databricks: **17 seconds**
- Expectations met: **2**

### Data Quality Expectations

| Expectation | Action | Failure % | Failed records |
|---|---|---:|---:|
| `valid_amount` | DROP | 0% | 0 |
| `valid_customer` | DROP | 0% | 0 |

## 4. Gold Result

Object: `dlt_gold_daily_sales`

- Gold DLT view created successfully.
- Data preview is not available in the Databricks table panel because previews are not available for views.

## 5. Pipeline Graph

The compiled graph showed:

`dlt_bronze_orders → dlt_silver_orders → dlt_gold_daily_sales`

## 6. Overall Result

The Lab 9 pipeline executed successfully with 501 Bronze records, 501 Silver records, both quality expectations passing with zero failures, and the Gold reporting view created.
