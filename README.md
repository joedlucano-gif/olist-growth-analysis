# Olist — What Is Limiting Growth?

**BigQuery SQL · Looker Studio · Business analytics**

An independent analysis of **96,211 delivered orders** to investigate a growth plateau through acquisition, repeat purchasing and delivery performance.

[Interactive dashboard](https://datastudio.google.com/reporting/f9d0ac1b-739d-459d-9ea8-8a57cac34915) · [Case study & report](https://app.notion.com/p/40b00e5930d981889457f36e038e3c22)

## Findings

| Finding | Decision to test |
| --- | --- |
| January–August 2018 sales averaged **902K/month**, with **6,598 orders/month** | Test acquisition campaigns against incremental customers, cost and margin |
| **3.00%** of customers placed multiple delivered orders in the analysis window | A/B test a post-purchase offer |
| Review scores averaged **4.29 on time vs 2.57 late** | Assess delivery reliability before scaling demand |

These are descriptive associations and proposed experiments, not proven causes or implemented business outcomes.

## My contribution

Six SQL queries, calculated KPIs and an interactive dashboard connecting order, customer and product data. Techniques include joins, CTEs, window functions, conditional aggregation and checks of key uniqueness and sales totals.

## Scope and definitions

- **Period:** January 2017–August 2018.
- **Shared filter:** `order_status = 'delivered' AND in_analysis_window = 1`.
- **Sales:** gross item values excluding freight; **13,181,027.13** reconciled between order and item data. The source currency is not explicitly identified.
- **Repeat purchasing:** 2,789 / 93,104 customers = **3.00%** within the filtered period. The dashboard's **3.20%** uses complete-history repeat status, including other dates and statuses.

## Known limitation

The original Customers Query joins on `customer_unique_id`, multiplying rows and inflating that query's summed revenue by **7.04%**. Affected revenue shares and state comparisons are excluded from validated conclusions. The overall sales total above comes from reconciled order and item data.

The published dashboard is preserved. Validation used supplied CSV snapshots, not live tables; recent customers also have less time to return.

## Explore the implementation

- [Growth SQL](sql/06_growth.sql) — joins and aggregation.
- [First eligible purchase SQL](sql/03_first_eligible_purchase.sql) — CTE and window function.
- [All six queries](sql/) · [Selected Looker metrics](docs/looker-metrics.md).
- [Setup, query map and validation](docs/technical-notes.md).

The SQL requires the project's prepared BigQuery tables; raw data and preprocessing scripts are not bundled.

---

**Daniel Lucano** · [Portfolio](https://app.notion.com/p/40b00e5930d980aa8797efb988609163) · [LinkedIn](https://www.linkedin.com/in/daniel-lucano-nieves-109886270)
