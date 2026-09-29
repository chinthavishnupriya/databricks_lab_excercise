# Lab 2 Results

## Execution status

All Lab 2 SQL operations executed successfully in Databricks SQL Editor.

## Table schema

`review_logs` contains four columns:

| Column | Type |
|---|---|
| review_id | INT |
| customer_id | INT |
| rating | INT |
| review_text | STRING |

## Input data

8 review rows were inserted successfully.

- Rows 1-2: records provided in the practice guide.
- Rows 3-8: additional practice records used for richer aggregation, ranking, and sentiment output.

## Aggregation output

| Rating | Review count | Average rating |
|---:|---:|---:|
| 5 | 2 | 5 |
| 4 | 2 | 4 |
| 3 | 1 | 3 |
| 2 | 1 | 2 |
| 1 | 2 | 1 |

## DENSE_RANK output

| Review ID | Customer ID | Rating | Rating rank |
|---:|---:|---:|---:|
| 1 | 101 | 5 | 1 |
| 5 | 105 | 5 | 1 |
| 3 | 103 | 4 | 2 |
| 8 | 108 | 4 | 2 |
| 6 | 106 | 3 | 3 |
| 4 | 104 | 2 | 4 |
| 2 | 102 | 1 | 5 |
| 7 | 107 | 1 | 5 |

## Final AI sentiment output

| Review ID | Customer ID | Rating | Rating rank | Sentiment |
|---:|---:|---:|---:|---|
| 1 | 101 | 5 | 1 | positive |
| 5 | 105 | 5 | 1 | positive |
| 3 | 103 | 4 | 2 | positive |
| 8 | 108 | 4 | 2 | positive |
| 6 | 106 | 3 | 3 | neutral |
| 4 | 104 | 2 | 4 | mixed |
| 2 | 102 | 1 | 5 | negative |
| 7 | 107 | 1 | 5 | negative |

## Conclusion

Lab 2 demonstrated advanced SQL querying with grouping and aggregation, a `DENSE_RANK()` window function, and Databricks AI sentiment analysis. The final query executed successfully and returned 8 rows.
