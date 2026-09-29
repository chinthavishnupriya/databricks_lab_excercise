# Lab 6 – Incremental File Ingestion with Auto Loader

## Objective
Configure Databricks Auto Loader (`cloudFiles`) to incrementally detect and ingest JSON files into a Bronze Delta table.

## Architecture
JSON Landing Files
→ Databricks Auto Loader
→ Bronze Delta Table (`workspace.lab_db.bronze_orders`)

## Environment
Databricks Free Edition with Serverless compute.

Public DBFS root was disabled, so a Unity Catalog Volume was used:
`/Volumes/workspace/lab_db/lab6_landing/orders/`

## Execution Summary
1. Created a Unity Catalog Volume.
2. Created 500 JSON order files.
3. Configured Auto Loader with `cloudFiles` and JSON schema inference.
4. Used `availableNow=True`.
5. Wrote data to the Bronze Delta table.
6. Verified 500 initial records and 0 rescued records.
7. Added `order_501.json`.
8. Ran Auto Loader again with the same checkpoint.
9. Verified 501 total records and latest order ID 1501.

## Final Result
Initial ingestion: 500 records.
Incremental ingestion: +1 record.
Final Bronze table: 501 records.
