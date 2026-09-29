# Databricks Lab 8 — Medallion Silver to Gold & SCD Type 2

## Overview
Completed Gold-layer and SCD Type 2 lab using the Silver data produced by Lab 7.

## Objective
- Build a Gold daily-revenue table.
- Implement customer history tracking.
- Use Delta MERGE logic for SCD Type 2.
- Verify current and historical records.

## Environment
- Catalog: workspace
- Schema: lab_db
- Silver: workspace.lab_db.silver_orders
- Gold revenue: workspace.lab_db.gold_daily_revenue
- Gold dimension: workspace.lab_db.gold_dim_customers

## Gold Revenue
The daily-revenue table uses DATE(order_ts), customer_id, and SUM(amount_num) as total_revenue.

Verification:
- Gold rows: 142
- Customers: 21
- Overall revenue: 368023

## SCD Type 2
The customer dimension tracks customer_id, name, email, effective_date, end_date, and is_current.

Customer 102, Bob Jones, was updated from bob_new@example.com to bob_updated@example.com.

## MERGE Verification Note
The supplied guide MERGE pattern contains a NULL merge-key branch. During execution this produced an unintended NULL-key test record. That artifact was removed, and the intended new Bob version was explicitly inserted with customer_id 102.

## Final SCD Result
- Total records: 14
- Unique customers: 13
- Current records: 13
- Historical records: 1

Bob's old email is historical and the new email is current.

## Evidence
Screenshots cover Silver verification, Gold creation, aggregation results, source data, initial SCD state, staging update, MERGE result, Bob history, and final verification.

## Learning Outcome
Lab 8 demonstrates how cleaned Silver data becomes business-oriented Gold data and how SCD Type 2 preserves historical customer changes.
