# Lab 09 Input

## Source Guide

Lab 9: Declarative Pipeline Development with Delta Live Tables (DLT)

## Source Data

The pipeline reads JSON order files created during Lab 6 from:

`/Volumes/workspace/lab_db/lab6_landing/orders/`

The landing dataset contained **501 order records** at the time of the Lab 9 pipeline run.

## Required Pipeline Layers

1. Bronze DLT streaming table using Auto Loader.
2. Silver DLT table with data quality expectations.
3. Gold reporting view/aggregation.
