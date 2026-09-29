# Lab 5 Results

## Starting State

The existing `lab_db.customers` table contained 3 rows before the Lab 5 micro-appends.

## Micro-Appends

Ten individual INSERT operations were completed successfully:

- 201
- 202
- 203
- 204
- 205
- 206
- 207
- 208
- 209
- 210

## OPTIMIZE + Z-ORDER

Command:

`OPTIMIZE lab_db.customers ZORDER BY (customer_id, signup_date);`

Successful result:

- `numFilesAdded`: 1
- `numFilesRemoved`: 13
- `totalFiles`: 1
- `totalSize`: 3242

The fragmented files were compacted into one data file.

## VACUUM Configuration

The guide's parallel-delete setting was attempted:

`SET spark.databricks.delta.vacuum.parallelDelete.enabled = true;`

The Databricks Free Serverless environment returned `CONFIG_NOT_AVAILABLE_WITHOUT_SUGGESTION`. This is documented as an environment limitation.

## VACUUM

Command:

`VACUUM lab_db.customers RETAIN 168 HOURS;`

Completed successfully.

## Final Verification

The final query returned:

- `total_customers`: 13
- `min_customer_id`: 101
- `max_customer_id`: 210

Therefore, the Lab 5 optimization workflow was completed successfully.
