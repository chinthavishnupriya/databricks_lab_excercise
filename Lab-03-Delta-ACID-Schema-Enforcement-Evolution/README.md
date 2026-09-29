# Databricks Lab 3 — Delta Lake ACID, Schema Enforcement & Schema Evolution

## Overview
Completed Delta Lake lab covering transaction history, schema enforcement, and controlled schema evolution.

## Objective
- Inspect Delta transaction history.
- Demonstrate schema enforcement.
- Perform schema evolution with mergeSchema.
- Verify the evolved schema and data.

## Environment
- Databricks Free Edition
- Serverless compute
- Table: lab_db.customers
- Format: Delta

## Execution Flow
Inspect history → attempt incompatible write → observe schema enforcement → enable mergeSchema → write evolved data → verify schema and records.

## Final Schema
customer_id INT, name STRING, email STRING, signup_date DATE, status STRING, membership_tier STRING.

The evolved record was customer 103, Charlie Brown, with membership_tier Tier-1.

## Environment Limitation
Direct access to the Delta _delta_log through DBFS produced a DBFS-disabled error in the Free/Serverless environment. This was recorded as an environment limitation; the Delta table operations themselves completed successfully.

## Evidence
The query, output, and screenshots folders preserve the execution and verification results.

## Learning Outcome
This lab shows how Delta tables provide versioned data management together with schema controls and controlled evolution.
