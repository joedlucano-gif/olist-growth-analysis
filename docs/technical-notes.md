# Technical notes

## Query map

| Source | Grain | File |
| --- | --- | --- |
| Products query | Order item | [Product sales](../sql/01_product_sales.sql) |
| delivery query 2 | Order | [Delivery and reviews](../sql/02_delivery_reviews.sql) |
| Products query 2 | One selected item per customer | [First eligible purchase](../sql/03_first_eligible_purchase.sql) |
| Delivery Query | One aggregate row | [Delivery summary](../sql/04_delivery_summary.sql) |
| Customers Query | Intended order level; join duplicates rows | [Original customer query](../sql/05_customers_original.sql) |
| Query General Growth | Purchase-date group | [Growth](../sql/06_growth.sql) |

## Running the SQL

Use GoogleSQL in BigQuery with the project's prepared tables: `Olist.Orders`, `Olist.Order Items` and `Olist.Customers`. Each file is an independent dashboard source, not a sequential pipeline.

The SQL expects derived columns such as `in_analysis_window`, `is_repeat_customer`, `items_revenue`, `is_late` and `category_en`. Raw Olist tables alone are insufficient. Prepared data and preprocessing scripts are not included; these files document the submitted dashboard logic, not a complete reproducible pipeline.

Original names and calculations are retained. Formatting and explanatory comments were added; the live dashboard was not changed. SQL was not executed against BigQuery during this GitHub publication.

## Validation evidence

Checks previously performed on four supplied CSV snapshots:

- Order IDs, order-item pairs and product IDs were unique at their expected grain.
- All **96,211** delivered orders in scope matched items; order and item sales reconciled to **13,181,027.13**.
- Joining customers on `customer_unique_id` expanded these orders to **103,758 rows**, increasing that query's summed revenue by **7.04%**. The original query remains explicitly marked.
- Joining on `customer_id` matched one record per eligible order in those files; that change was not applied to the published dashboard.

## Interpretation

**Repeat rate:** 3.20% uses complete-history status (2,976 / 93,104 customers); 3.00% requires multiple delivered orders within the window (2,789 / 93,104). The latter is a separate validation result, not the output of the original flag formula.

**First purchase:** ranking occurs after filtering. The selected category belongs to the lowest item ID in the earliest eligible order, not necessarily the first-ever purchase or the whole basket.

**Date filters:** the aggregate delivery query cannot respond to a downstream date dimension. Fixed eight-month averages require the full January–August 2018 interval.

**Delivery fields:** the submitted SQL alias `Revie_score` differs from the supplied formula's `Review_score`; the definition of `Category of delivery` was not supplied. Live chart mappings were not fully verified.

**Inference:** findings are historical and descriptive. Different customer follow-up times limit direct retention comparisons.

[Business summary](../README.md) · [Selected Looker formulas](looker-metrics.md)
