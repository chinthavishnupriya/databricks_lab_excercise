# Databricks Lab 4 — Delta Time Travel, Restore & Table Cloning

## Overview
Completed Delta Lake history and cloning lab. Previous table versions were queried, shallow and deep clones were created, and the main table was restored between historical versions.

## Objective
- Inspect DESCRIBE HISTORY.
- Query historical versions with VERSION AS OF.
- Create a Shallow Clone.
- Create a Deep Clone.
- Restore a table to a historical version.
- Verify the final state.

## Tables
- lab_db.customers
- lab_db.customers_dev_shallow
- lab_db.customers_backup_deep

## Historical Results
Version 0 contained no rows because it represented the table before the initial customer insert.
Version 1 contained Alice and Bob with Bob in Pending status.
Version 2 contained Alice and Bob with Bob updated to bob_new@example.com and Active status.

## Clone Results
- Shallow Clone: num_copied_files = 0
- Deep Clone: num_copied_files = 3

## Restore Demonstration
The main table was restored to Version 2, verified, and then restored back to Version 6. The final Version 6 state retained the evolved membership_tier column and the Lab 3 data.

## Evidence
The repository contains the SQL/query material, results, and screenshots for history, time travel, cloning, restore, and final verification.

## Learning Outcome
This lab demonstrates how Delta history can support auditing, historical analysis, recovery, and cloning workflows.
