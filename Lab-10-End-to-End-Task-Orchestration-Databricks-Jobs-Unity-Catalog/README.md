# Databricks Lab 10 — End-to-End Task Orchestration with Databricks Jobs & Unity Catalog

## Overview
Completed the final orchestration lab by connecting a Databricks notebook ingestion task to the Lab 9 DLT pipeline through a multi-task Job.

## Objective
- Create a multi-task Databricks Job.
- Configure task dependencies.
- Configure retries and timeouts.
- Configure failure email notification.
- Configure Job permissions.
- Execute and verify the complete workflow.

## Job
Name: Lab-10-End-to-End-Medallion-Job.

## Workflow
Ingest_AutoLoader → Run_DLT_Pipeline.

Task 1 uses the workspace notebook Lab-10-Ingest-AutoLoader.
Task 2 runs the Lab-09-DLT-Medallion-Pipeline.
Task 2 runs only after Task 1 succeeds.

## Reliability Configuration
- Maximum retries: 2
- Total possible attempts: 3
- Retry wait: 0 hours
- Retry on timeout: disabled
- Warning threshold: 10 minutes
- Timeout: 15 minutes
- Failure notification: email configured
- Compute: Serverless
- Performance optimized mode: enabled

## Permissions
The Job permissions page showed the user account as Owner and admins as Can Manage.

The Practice Guide also provides SQL GRANT examples for Unity Catalog. The executed lab documents the Job UI permissions configuration and does not claim that the example data_analysts GRANT statements were executed.

## Execution Result
| Task | Result | Duration |
|---|---|---:|
| Ingest_AutoLoader | Succeeded | 1m 30s |
| Run_DLT_Pipeline | Succeeded | 1m 21s |
| Overall Job | Succeeded | 2m 52s |

Launch mode: Manual. Compute: Serverless.

## Dependency Evidence
During the run, Run_DLT_Pipeline remained blocked while Ingest_AutoLoader was queued/running. After the ingestion task succeeded, the DLT task executed and also succeeded.

## Evidence
The seven screenshots document the Job DAG, retry policy, failure notification, dependency, trigger, queued/blocked state, and final successful run.

## Learning Outcome
Lab 10 connects the previous labs into an operational workflow. It demonstrates not only data processing but also orchestration controls needed to run dependent workloads reliably.
