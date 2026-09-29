# Lab 6 Input

## Lab
Lab 6 – Incremental File Ingestion with Auto Loader

## Input Source
JSON files landing in the Auto Loader landing directory.

## Landing Directory
/Volumes/workspace/lab_db/lab6_landing/orders/

## Schema / Checkpoint Directories
/Volumes/workspace/lab_db/lab6_landing/schema/
/Volumes/workspace/lab_db/lab6_landing/checkpoint/

## Target Bronze Table
workspace.lab_db.bronze_orders

## Ingestion Method
Databricks Auto Loader using the `cloudFiles` format.

## Processing Mode
availableNow=True for one-time incremental processing.
