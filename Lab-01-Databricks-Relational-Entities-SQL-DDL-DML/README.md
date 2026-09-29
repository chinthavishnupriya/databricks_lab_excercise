# Databricks Lab 1 — Relational Entities & SQL DDL/DML

## Lab status
**Completed**

## Objective
Create and manage a Databricks schema and Delta customer table, then perform SQL DML including `INSERT` and `MERGE INTO`.

## Environment
- Platform: Databricks Free Edition
- Interface: Databricks SQL Editor
- Warehouse: SQL Warehouse selected in the SQL Editor
- Storage format: Delta

## Lab workflow
1. Create `lab_db` schema.
2. Select `lab_db`.
3. Create `customers` as a Delta table.
4. Verify the schema with `DESCRIBE customers`.
5. Verify the empty table.
6. Insert Alice and Bob.
7. Verify the inserted records.
8. Run `MERGE INTO` to update Bob.
9. Run the final verification query.

## Final table
| customer_id | name | email | signup_date | status |
|---:|---|---|---|---|
| 101 | Alice Smith | alice@example.com | 2024-01-15 | Active |
| 102 | Bob Jones | bob_new@example.com | 2024-02-01 | Active |

## Repository contents
```text
Lab-01-Databricks-Relational-Entities-SQL-DDL-DML/
├── README.md
├── queries/
│   └── lab1.sql
├── input/
│   └── commands.md
├── output/
│   └── results.md
└── screenshots/
    ├── 01_schema_created.png
    ├── 02_table_structure.png
    ├── 03_initial_table_empty.png
    ├── 04_merge_execution.png
    └── 05_final_customer_output.png
```

## Evidence
The screenshots document schema creation, table structure, initial empty state, MERGE execution, and final customer output.

## Notes
The lab guide's implementation explicitly demonstrates `INSERT` and `MERGE INTO`. Separate `UPDATE` and `DELETE` commands are mentioned in the hands-on description but are not supplied as separate code examples in the guide, so they are not added to this lab folder.
