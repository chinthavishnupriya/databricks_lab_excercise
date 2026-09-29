# Lab 4 Results

## 1. Delta History
`DESCRIBE HISTORY lab_db.customers` showed versions 0 through 6.

## 2. Time Travel

### Version 0
`VERSION AS OF 0` returned zero rows. This is consistent with the actual table history because Version 0 is the table creation state before the first data write.

### Version 1
Version 1 showed:
- Alice Smith — Active
- Bob Jones — `bob@example.com` — Pending

### Version 2
Version 2 showed:
- Alice Smith — Active
- Bob Jones — `bob_new@example.com` — Active

## 3. Shallow Clone
Created:
`lab_db.customers_dev_shallow`

Creation result:
- source_num_files: 3
- num_copied_files: 0

The clone was queried successfully and contained the current three customer records.

## 4. Deep Clone
Created:
`lab_db.customers_backup_deep`

Creation result:
- source_num_files: 3
- num_copied_files: 3
- copied_files_size: 6627

The clone was queried successfully and contained the current three customer records.

## 5. Restore Demonstration
The main table was restored from Version 6 to Version 2.

Restore result included:
- table_size_after_restore: 4524
- num_files_after_restore: 2
- num_removed_files: 1

Verification showed only Alice and Bob and the Version 2 schema.

The main table was then restored from Version 2 back to Version 6.

Restore result included:
- table_size_after_restore: 6627
- num_files_after_restore: 3
- num_restored_files: 1

Final verification showed:
- 101 — Alice Smith — Active — NULL
- 102 — Bob Jones — Active — NULL
- 103 — Charlie Brown — Active — Tier-1

## 6. Final Lab 4 Status
Time Travel: PASS
Restore: PASS
Shallow Clone: PASS
Deep Clone: PASS
Final state restored: PASS
