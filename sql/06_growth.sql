-- Original source: Query General Growth. Grain: purchase_date group.
SELECT
  SUM(OI.price) AS Total_Revenue,
  COUNT(DISTINCT O.order_id) AS Total_Orders,
  O.purchase_date AS Date_Assessment
FROM `Olist.Order Items` AS OI
INNER JOIN `Olist.Orders` AS O
  ON OI.order_id = O.order_id
WHERE O.in_analysis_window = 1
  AND O.order_status = 'delivered'
GROUP BY O.purchase_date;
