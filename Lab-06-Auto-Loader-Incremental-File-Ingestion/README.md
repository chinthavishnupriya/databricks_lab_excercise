# Databricks Lab 6 — Incremental File Ingestion with Auto Loader

## Overview
Completed Auto Loader lab using cloudFiles to incrementally ingest JSON files into a Bronze Delta table.

## Objective
- Use a Unity Catalog Volume as the landing area.
- Configure Auto Loader for JSON.
- Infer the input schema.
- Process files incrementally.
- Verify the Bronze Delta table.
- Demonstrate a later incremental file arrival.

## Architecture
JSON landing files → Databricks Auto Loader → Bronze Delta table workspace.lab_db.bronze_orders.

## Environment
- Databricks Free Edition
- Serverless compute
- Landing path: /Volumes/workspace/lab_db/lab6_landing/orders/
- Bronze table: workspace.lab_db.bronze_orders

Public DBFS root was disabled, so the Unity Catalog Volume path was used.

## Execution
500 JSON files were created and ingested with availableNow=True. Then order_501.json was added and Auto Loader was run again using the existing checkpoint.

## Results
- Initial records: 500
- Incremental records: 1
- Final Bronze records: 501
- Latest order ID verified: 1501
- Initial rescued records: 0

## Learning Outcome
This lab establishes the ingestion layer used by the later Bronze-to-Silver and DLT labs and demonstrates why checkpoints are important for incremental processing.
