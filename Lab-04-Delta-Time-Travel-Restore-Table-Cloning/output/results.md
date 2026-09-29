# Lab 4 Results

## Time Travel

### Version 2
Version 2 contained:
- Alice Smith — Active
- Bob Jones — `bob_new@example.com` — Active

### Version 1
Version 1 contained:
- Alice Smith — Active
- Bob Jones — `bob@example.com` — Pending

This demonstrated retrieval of different historical table states.

## Shallow Clone

Table created:
`lab_db.customers_dev_shallow`

Creation result:
- source_num_files: 3
- num_copied_files: 0

The clone was then queried successfully and returned the three current customer records.

## Deep Clone

Table created:
`lab_db.customers_backup_deep`

Creation result:
- source_num_files: 3
- num_copied_files: 3
- copied_files_size: 6627

The clone was then queried successfully and returned the three current customer records.

## Final Verification

`SHOW TABLES IN lab_db` confirmed:
- customers
- customers_backup_deep
- customers_dev_shallow
- review_logs
