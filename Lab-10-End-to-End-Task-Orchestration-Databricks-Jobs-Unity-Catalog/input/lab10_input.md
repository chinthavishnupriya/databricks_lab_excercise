# Lab 10 Input / Configuration Notes

Job name: Lab-10-End-to-End-Medallion-Job

Tasks:
1. Ingest_AutoLoader
2. Run_DLT_Pipeline

Dependency:
Run_DLT_Pipeline depends on Ingest_AutoLoader and runs when all dependencies succeed.

Pipeline:
Lab-09-DLT-Medallion-Pipeline

Reliability:
- Retry at most 2 times
- 3 total attempts
- Warning 10 minutes
- Timeout 15 minutes

Notification:
- Failure email configured

Permissions:
- admins: Can Manage
- job owner: Is Owner
