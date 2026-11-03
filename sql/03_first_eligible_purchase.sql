-- Original source: Products query 2. One selected item per customer, after scope filtering.
WITH CTE AS (
  SELECT
    O.customer_unique_id AS Customer,
    O.is_repeat_customer AS Repeat_customer,
    OI.category_en AS Category_name,
    O.purchase_date AS Date_Assessment,
    O.is_late AS Late_orders,
    ROW_NUMBER() OVER (
      PARTITION BY O.customer_unique_id
      ORDER BY O.order_purchase_timestamp, O.order_id, OI.order_item_id
    ) AS Sort
  FROM `Olist.Orders` AS O
  INNER JOIN `Olist.Order Items` AS OI
    ON O.order_id = OI.order_id
  WHERE O.in_analysis_window = 1
    AND O.order_status = 'delivered'
)
SELECT
  Customer, Repeat_customer, Category_name, Date_Assessment, Late_orders
FROM CTE
WHERE Sort = 1;
