# Databricks Lab 1 — Relational Entities & SQL DDL/DML

## Overview
Completed Databricks SQL lab covering schema creation, Delta table creation, data insertion, verification, and MERGE-based upsert behavior.

## Objective
Build the relational foundation used by the later Delta Lake labs:
- Create the lab_db schema.
- Create the customers Delta table.
- Inspect the table structure.
- Insert customer records.
- Use MERGE INTO to update an existing customer.
- Verify the final state.

## Environment
- Databricks Free Edition
- Databricks SQL Editor
- SQL Warehouse
- Schema: lab_db
- Table: customers
- Storage: Delta

## Execution Flow
Create schema → create Delta table → verify schema → insert Alice and Bob → verify rows → execute MERGE → verify final output.

## Final Result
| customer_id | name | email | status |
|---:|---|---|---|
| 101 | Alice Smith | alice@example.com | Active |
| 102 | Bob Jones | bob_new@example.com | Active |

Bob's email and status were successfully changed through MERGE INTO.

## Evidence
The screenshots cover schema creation, table structure, empty-table verification, MERGE execution, and final customer output.

## Repository Contents
queries/lab1.sql, input/commands.md, output/results.md, and the screenshots folder contain the execution material.

## Scope Note
The Practice Guide mentions INSERT, UPDATE, DELETE, and MERGE. The supplied executable example specifically demonstrates INSERT and MERGE, so this README documents only the operations actually evidenced in the lab.

## Learning Outcome
This lab establishes the SQL and Delta-table foundation for the remaining nine labs.
