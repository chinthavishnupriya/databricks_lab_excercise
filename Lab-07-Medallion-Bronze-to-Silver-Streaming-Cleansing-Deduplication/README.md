# Databricks Lab 7 — Medallion Architecture: Bronze to Silver

## Overview
Completed Bronze-to-Silver streaming lab. Raw Bronze data was cleaned, validated, watermarked, deduplicated, and written to a Silver Delta table.

## Objective
- Read Bronze data as a stream.
- Apply a 10-minute watermark.
- Remove duplicate events.
- Filter invalid records.
- Use a streaming checkpoint.
- Verify Silver quality.

## Test Data
The Lab 6 Bronze table initially contained 501 records. For Lab 7 testing, 12 duplicate event groups and 5 invalid records with customer_id = NULL were added.

Prepared Bronze state:
- 530 total rows
- 518 distinct order IDs

## Transformation
The Silver stream:
1. Cast amount to double.
2. Convert order_timestamp to timestamp.
3. Filter null customer IDs.
4. Filter non-positive amounts and invalid timestamps.
5. Apply a 10-minute watermark.
6. Deduplicate on order_id and timestamp.
7. Write to workspace.lab_db.silver_orders.

## Checkpoint Note
The guide's /tmp/checkpoints path was unavailable because public DBFS was disabled. The actual checkpoint used was /Volumes/workspace/lab_db/lab6_landing/lab7_checkpoints/silver_orders/.

## Final Results
- Silver rows: 513
- Distinct order IDs: 513
- Null customer IDs: 0
- Invalid amounts: 0
- Minimum order ID: 1001
- Maximum order ID: 3012
- Duplicate events removed: 12
- Invalid records filtered: 5

## Evidence
The screenshots cover Bronze preparation, streaming code, checkpoint configuration, successful execution, row counts, quality checks, and final Silver output.

## Learning Outcome
Lab 7 demonstrates the core purpose of the Silver layer: turning raw ingested data into cleaner, validated, deduplicated data for analytics.
