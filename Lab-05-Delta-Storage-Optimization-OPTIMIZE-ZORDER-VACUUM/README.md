# Databricks Lab 5 — Delta Storage Optimization with OPTIMIZE, Z-ORDER & VACUUM

## Overview
Completed Delta storage-maintenance lab using repeated small writes, OPTIMIZE, Z-ORDER, and VACUUM.

## Objective
- Simulate small-file fragmentation.
- Compact Delta files with OPTIMIZE.
- Apply Z-ORDER using customer_id and signup_date.
- Remove obsolete files with VACUUM.
- Record environment-specific configuration limits.

## Execution
Ten individual micro-appends were performed against lab_db.customers. The table was then optimized with Z-ORDER and cleaned with VACUUM RETAIN 168 HOURS.

## Results
- Micro-appends: 10
- Files removed by OPTIMIZE: 13
- Optimized files added: 1
- Final row count: 13
- Customer ID range: 101–210
- VACUUM: successful

## Environment Limitation
The guide specifies spark.databricks.delta.vacuum.parallelDelete.enabled = true. The Free Serverless environment returned CONFIG_NOT_AVAILABLE_WITHOUT_SUGGESTION for this setting, so it was not used. Normal VACUUM still completed successfully.

## Evidence
The screenshots document the micro-appends, optimization, Z-ORDER, unsupported configuration, VACUUM, and final verification.

## Learning Outcome
This lab demonstrates practical Delta maintenance after repeated writes and shows how platform capabilities can differ between environments.
