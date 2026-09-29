# Lab 6 Results

## Environment Adaptation
Databricks Free Edition had public DBFS root disabled, so the guide's `/tmp/lab_landing/orders/` path was replaced with a Unity Catalog Volume.

## Initial Ingestion
- JSON landing files: 500
- Records ingested: 500
- Minimum order ID: 1001
- Maximum order ID: 1500
- Rescued records: 0

## Bronze Schema
- amount: string
- customer_id: string
- order_id: string
- order_timestamp: string
- _rescued_data: string

## Incremental Ingestion
A new file, `order_501.json`, was added after the initial ingestion.

- New order ID: 1501
- Customer ID: 121
- Amount: 1750.00
- Order timestamp: 2026-09-29T18:00:00
- Final Bronze records: 501
- Latest order ID: 1501
- Rescued data: NULL

## Final Status
Lab 6 Auto Loader incremental ingestion was completed successfully.
