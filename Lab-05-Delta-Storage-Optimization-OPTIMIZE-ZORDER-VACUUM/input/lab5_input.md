# Lab 5 Input / Starting Conditions

## Source Table

Lab 5 operates on the existing Delta table:

`lab_db.customers`

No external CSV or JSON input file is required.

## Starting State

Before Lab 5, the table contained the three customer records produced by the earlier labs:

- 101 — Alice Smith
- 102 — Bob Jones
- 103 — Charlie Brown

The table includes the `membership_tier` column introduced during Lab 3.

## Lab 5 Input Process

The Lab 5 guide requires simulating small-file fragmentation through 10 micro-appends. Ten additional customer rows (IDs 201–210) were appended individually to create the fragmented workload used for optimization.

This file documents the execution starting condition; it is not an external dataset supplied by the practice guide.
