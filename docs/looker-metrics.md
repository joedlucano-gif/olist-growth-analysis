# Selected Looker Studio metrics

Representative formulas from the original report. Names below identify their source; SQL output and Looker display names must be mapped consistently.

## Average order value
Source: Query General Growth. Uses totals, not an unweighted average of daily ratios.

```text
SUM(Total_Revenue) / SUM(Total_Orders)
```

## Late delivery rate
Source: delivery query 2. Format as a percentage. The SQL outputs `late_delivery`; the supplied Looker formula uses `Late_delivery`.

```text
COUNT_DISTINCT(CASE WHEN Late_delivery = 1 THEN order_id END)
/
COUNT_DISTINCT(order_id)
```

## Historical repeat-customer share
Source: Products query 2. **3.20%**, based on multiple orders anywhere in the complete source history; this is not the separately calculated 3.00% within-window delivered-repeat rate.

```text
COUNT_DISTINCT(CASE WHEN Repeat_customer = 1 THEN Customer END)
/
COUNT_DISTINCT(Customer)
```

## Average monthly sales, January–August 2018
Source: Query General Growth. Keep all eight months in the chart scope.

```text
ROUND(
  SUM(
    CASE
      WHEN Date_Assessment >= DATE(2018,01,01)
        AND Date_Assessment <= DATE(2018,08,31)
      THEN Total_Revenue
    END
  ) / 8,
  2
)
```

[Definitions and limitations](technical-notes.md) · [Business summary](../README.md)
