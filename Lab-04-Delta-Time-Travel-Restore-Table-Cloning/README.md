# Lab 4 — Delta Time Travel, Restore & Table Cloning

## Objective
Query historical Delta table snapshots, restore a previous state, and create Shallow and Deep Clones.

## Databricks Tables
- `lab_db.customers`
- `lab_db.customers_dev_shallow`
- `lab_db.customers_backup_deep`

## Executed Activities
1. Inspected Delta history with `DESCRIBE HISTORY`.
2. Queried required historical Version 0 using `VERSION AS OF 0`.
3. Queried Versions 1 and 2 for additional time-travel comparison.
4. Created and verified a Shallow Clone.
5. Created and verified a Deep Clone.
6. Verified the final Lab 4 tables.
7. Restored `lab_db.customers` to Version 2.
8. Verified the restored Version 2 state.
9. Restored `lab_db.customers` back to Version 6.
10. Verified the final Version 6 state, including `membership_tier`.

## Key Results
- Version 0 returned no rows because it represents the table immediately after creation and before the initial customer insert.
- Version 1 contained Alice and Bob with Bob in `Pending` status.
- Version 2 contained Alice and Bob with Bob updated to `bob_new@example.com` and `Active`.
- The Shallow Clone creation reported `num_copied_files = 0`.
- The Deep Clone creation reported `num_copied_files = 3`.
- RESTORE to Version 2 successfully returned the main table to its historical two-row state.
- RESTORE back to Version 6 successfully returned Alice, Bob, and Charlie with the evolved `membership_tier` column.

## Final State
The main table was restored to Version 6 after the restore demonstration, so the original Lab 3 data remains intact.

## Source Guide Note
The practice guide identifies Lab 4 as Delta Time Travel, Restore & Table Cloning and explicitly provides history inspection, time travel, Shallow Clone, and Deep Clone commands. The RESTORE demonstration was added to fulfill the guide's stated restore objective; the guide's code section did not provide a specific RESTORE command.
