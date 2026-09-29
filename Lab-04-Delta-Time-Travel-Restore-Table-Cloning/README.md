# Lab 4 — Delta Time Travel, Restore & Table Cloning

## Objective
Query historical Delta table snapshots using time travel and create Shallow and Deep Clones for development/testing and backup.

## Databricks Tables
- `lab_db.customers`
- `lab_db.customers_dev_shallow`
- `lab_db.customers_backup_deep`

## Executed Activities
1. Inspected Delta table history with `DESCRIBE HISTORY`.
2. Queried historical Version 2 using `VERSION AS OF 2`.
3. Queried historical Version 1 using `VERSION AS OF 1`.
4. Created a Shallow Clone:
   `lab_db.customers_dev_shallow`
5. Verified the Shallow Clone data.
6. Created a Deep Clone:
   `lab_db.customers_backup_deep`
7. Verified the Deep Clone data.
8. Verified the final tables in `lab_db`.

## Important Results
- Version 1 showed Bob with `bob@example.com` and status `Pending`.
- Version 2 showed Bob with `bob_new@example.com` and status `Active`.
- The Shallow Clone creation reported `num_copied_files = 0`.
- The Deep Clone creation reported `num_copied_files = 3`.
- Both clone tables contained the current three customer records.

## Source Guide Note
The practice guide describes Lab 4 as Delta Time Travel, Restore & Table Cloning. Its hands-on implementation explicitly provides history inspection, time travel queries, Shallow Clone, and Deep Clone. A separate `RESTORE` command was not provided in the guide's code section and was therefore not executed in this lab run.
