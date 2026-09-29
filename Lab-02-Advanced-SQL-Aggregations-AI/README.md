# Lab 2 — Advanced SQL Querying, Aggregations & AI Functions

## Objective

Practice advanced SQL querying in Databricks using aggregations, window functions, and a Databricks built-in AI sentiment function.

## Environment

- Databricks SQL Editor
- SQL Warehouse
- Database: `lab_db`
- Table: `review_logs`
- Delta/Databricks SQL table

## Tasks completed

1. Switched to `lab_db`.
2. Created the `review_logs` table.
3. Verified the table schema.
4. Inserted review data.
5. Verified all input rows.
6. Performed `GROUP BY`, `COUNT`, and `AVG` aggregation.
7. Applied `DENSE_RANK()` over review ratings.
8. Applied `ai_analyze_sentiment(review_text)`.
9. Combined ranking and sentiment analysis in the final query.

## Source data vs additional practice

The practice guide provides two original review records. This lab execution uses those two records plus six additional practice records so that the aggregation, ranking, and sentiment analysis produce a more useful multi-row result set.

## Folder structure

```text
Lab-02-Advanced-SQL-Aggregations-AI/
├── README.md
├── queries/
│   └── lab2.sql
├── input/
│   └── review_data.sql
├── output/
│   └── results.md
└── screenshots/
    ├── 01_use_lab_db.png
    ├── 02_table_structure.png
    ├── 03_review_input_data.png
    ├── 04_rating_aggregation.png
    ├── 05_dense_rank.png
    └── 06_final_analysis.png
```

## Result

Lab 2 was executed successfully in Databricks SQL Editor. The final analysis returned 8 rows with rating rank and sentiment category.
