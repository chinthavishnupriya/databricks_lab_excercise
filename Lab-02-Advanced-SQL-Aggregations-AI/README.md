# Databricks Lab 2 — Advanced SQL Querying, Aggregations & AI Functions

## Overview
Completed advanced SQL lab using grouped aggregations, window functions, and Databricks AI sentiment analysis.

## Objective
Practice:
- GROUP BY aggregation.
- COUNT and AVG.
- DENSE_RANK window functions.
- AI sentiment analysis with ai_analyze_sentiment.
- Combining analytical SQL and AI output.

## Environment
- Databricks Free Edition
- Databricks SQL Editor
- SQL Warehouse
- Schema: lab_db
- Table: review_logs

## Execution Flow
Create review_logs → insert source data → verify records → calculate rating aggregates → rank reviews with DENSE_RANK → analyze sentiment → combine results.

## Data
The Practice Guide supplied two original review records. Six additional practice records were added during execution so that the analytical queries produced a more useful multi-row result.

Final analysis: 8 rows.

## Result
The final query successfully returned review data together with rating rank and sentiment category.

## Evidence
Screenshots cover schema selection, table structure, review data, aggregation, DENSE_RANK, and the final analysis.

## Repository Contents
queries/lab2.sql, input/review_data.sql, output/results.md, and screenshots preserve the work.

## Learning Outcome
This lab demonstrates the transition from basic SQL operations to analytical workloads that combine aggregation, ranking, and AI-assisted text analysis.

## Scope Note
The guide objective also mentions text summarization. The repository evidence specifically covers sentiment analysis; no separate summarization execution is claimed.
