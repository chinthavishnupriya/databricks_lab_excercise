# Databricks Lab 10 — End-to-End Task Orchestration with Databricks Jobs & Unity Catalog

## Objective
Configure and execute a multi-task Databricks Job that connects Auto Loader ingestion to a Delta Live Tables pipeline, with task dependencies, retry policy, timeout thresholds, failure notification, and permissions.

## Job
**Lab-10-End-to-End-Medallion-Job**

## Workflow
`Ingest_AutoLoader` → `Run_DLT_Pipeline`

- Task 1: Workspace notebook `Lab-10-Ingest-AutoLoader`
- Task 2: Pipeline `Lab-09-DLT-Medallion-Pipeline`
- Dependency rule: Run task 2 only when task 1 succeeds
- Compute: Serverless
- Performance optimized mode: enabled

## Reliability configuration
- Retry policy: 2 retries (3 total attempts)
- Retry interval: 0 hours
- Warning threshold: 10 minutes
- Timeout: 15 minutes
- Failure notification: Email configured
- Job owner: user account
- `admins`: Can Manage

## Execution result
Final job run succeeded.

- `Ingest_AutoLoader`: Succeeded — 1m 30s
- `Run_DLT_Pipeline`: Succeeded — 1m 21s
- Overall job: Succeeded
- Total duration: 2m 52s
- Launch mode: Manual
- Compute: Serverless

## Evidence
See the `screenshots/` folder for the important execution and configuration screenshots.

## Source alignment
The Practice Guide specifies Lab 10 as End-to-End Task Orchestration with Databricks Jobs & Unity Catalog and calls for multi-task dependencies, retry policies, timeout limits, failure notifications, and Unity Catalog access controls.
