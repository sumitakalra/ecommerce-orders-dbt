# E-commerce Orders Analytics — dbt Project

## Overview
An end-to-end dbt project transforming raw e-commerce orders into a tested analytics mart.

## Tech Stack
- SQL
- dbt Core
- DuckDB
- Python
- Google Colab

## Data Pipeline
raw_orders (seed) -> stg_orders (view) -> int_order_profit (view) -> fct_orders (table)

## Models
- stg_orders: Standardizes data types and order status.
- int_order_profit: Calculates profit as amount minus cost.
- fct_orders: Filters to delivered orders for analytics.

## Data Quality
Five tests cover unique IDs, non-null IDs, and accepted status values.

## Verified Results
- Delivered orders: 7
- Total revenue: 12,750
- Total cost: 7,700
- Total profit: 5,050

## Commands
- dbt debug
- dbt seed
- dbt run
- dbt test
- dbt build

## Notes
This is a learning project using sample data. Currency units were not specified.
