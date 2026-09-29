# Lab 5: Delta Storage Optimization – OPTIMIZE, Z-ORDER, & VACUUM

## Objective

Prevent small-file problems by compacting Delta files with `OPTIMIZE`, applying multi-dimensional clustering with `ZORDER BY`, and cleaning up unreferenced historical files with `VACUUM`.

## Execution

1. Verified the existing `lab_db.customers` Delta table.
2. Performed 10 individual micro-appends to simulate small-file fragmentation.
3. Ran:
   `OPTIMIZE lab_db.customers ZORDER BY (customer_id, signup_date);`
4. Attempted the guide's parallel-delete configuration. The Databricks Free Serverless environment does not expose this configuration, so it was not used.
5. Ran:
   `VACUUM lab_db.customers RETAIN 168 HOURS;`
6. Verified the final table.

## Results

- 10 micro-appends completed.
- OPTIMIZE + ZORDER completed successfully.
- 13 files were removed and 1 optimized file was added.
- VACUUM completed successfully.
- Final row count: 13.
- Customer ID range: 101–210.

## Environment Note

The practice guide specifies `spark.databricks.delta.vacuum.parallelDelete.enabled = true`, but the Free Serverless environment returned `CONFIG_NOT_AVAILABLE_WITHOUT_SUGGESTION`. The actual `VACUUM` command still executed successfully.

## Folder Structure

```text
Lab-05-Delta-Storage-Optimization-OPTIMIZE-ZORDER-VACUUM/
├── README.md
├── input/
│   └── lab5_input.md
├── queries/
│   └── lab5.sql
├── output/
│   └── results.md
└── screenshots/
```
