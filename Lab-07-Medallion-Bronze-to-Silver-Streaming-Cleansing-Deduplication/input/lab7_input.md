# Lab 7 Input / Setup

Bronze table: `workspace.lab_db.bronze_orders`

Initial Bronze state: 501 records.

Test data:
- 12 duplicate event groups = 24 physical rows
- 5 invalid records with NULL customer_id

Prepared Bronze state:
- 530 rows
- 518 distinct order IDs

Silver rules:
- 10-minute watermark
- Deduplicate on order_id + order timestamp
- customer_id must be non-null
- amount must be greater than zero
