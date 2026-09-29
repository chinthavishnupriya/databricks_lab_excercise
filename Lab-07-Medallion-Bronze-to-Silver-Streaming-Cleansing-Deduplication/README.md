# Databricks Lab 7 – Medallion Architecture: Bronze to Silver

## Objective
Build the Silver layer by streaming from Bronze, applying a 10-minute watermark, removing duplicate events, and enforcing data quality.

## Environment
- Databricks Free Edition / Serverless
- Catalog: `workspace`
- Schema: `lab_db`
- Bronze: `workspace.lab_db.bronze_orders`
- Silver: `workspace.lab_db.silver_orders`

## Execution
The Lab 6 Bronze table initially contained 501 records. For Lab 7 testing, 12 duplicate event groups (24 physical rows) and 5 invalid records with `customer_id = NULL` were added.

Prepared Bronze state:
- 530 total rows
- 518 distinct order IDs

The Silver stream:
- Cast `amount` to `double`.
- Converted `order_timestamp` to timestamp.
- Filtered null customer IDs.
- Filtered non-positive amounts and invalid timestamps.
- Applied a 10-minute watermark.
- Deduplicated on `order_id` and timestamp.
- Wrote to `workspace.lab_db.silver_orders`.

## Checkpoint Environment Note
The guide's `/tmp/checkpoints/...` path failed because public DBFS is disabled in this Serverless environment. A Unity Catalog Volume checkpoint was therefore used:

`/Volumes/workspace/lab_db/lab6_landing/lab7_checkpoints/silver_orders/`

## Final Results
- Silver rows: **513**
- Distinct order IDs: **513**
- Null customer IDs: **0**
- Invalid amounts: **0**
- Minimum order ID: **1001**
- Maximum order ID: **3012**

Therefore, the pipeline removed 12 duplicate events and filtered 5 invalid records successfully.
