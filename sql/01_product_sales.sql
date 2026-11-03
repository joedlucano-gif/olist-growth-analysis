-- Original source: Products query. Grain: order item.
SELECT
  OI.category_en AS Category_name,
  O.purchase_date AS Date_assessment,
  OI.price AS Revenue
FROM `Olist.Order Items` AS OI
INNER JOIN `Olist.Orders` AS O
  ON OI.order_id = O.order_id
WHERE O.in_analysis_window = 1
  AND O.order_status = 'delivered';
