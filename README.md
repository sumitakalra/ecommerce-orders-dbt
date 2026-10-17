E-Commerce Orders Analytics — dbt Project

Overview

An end-to-end data transformation project that converts raw e-commerce order data into a tested analytics mart using dbt Core, SQL, and DuckDB.

Tech Stack

- SQL
- dbt Core
- DuckDB
- Python
- Git and GitHub

Data Pipeline

"raw_orders" → "stg_orders" → "int_order_profit" → "fct_orders"

Data Models

- stg_orders: Standardizes raw order data and prepares it for downstream transformations.
- int_order_profit: Calculates order-level profit as "amount - cost".
- fct_orders: Contains delivered orders for analytics and reporting.

Data Quality

Five automated data tests validate:

- Order IDs are unique.
- Order IDs are not null.
- Final fact-table status values are restricted to "delivered".

Verified Results

Based on the sample dataset:

- Delivered orders: 7
- Total revenue: 12,750
- Total cost: 7,700
- Total profit: 5,050

Currency units are unspecified in the sample data.

How to Run

After installing dbt Core and the DuckDB adapter and configuring the dbt profile:

dbt debug
dbt build

"dbt build" loads the seed, builds the models, and runs the configured data tests.

Project Scope

This is a portfolio learning project using sample e-commerce order data. The results demonstrate SQL transformations, modular dbt models, and automated data quality checks.
