-- Original source: Delivery Query. One aggregate row; no date dimension for report filtering.
SELECT
  COUNT(DISTINCT CASE WHEN is_late = 1 THEN order_id END)
    / COUNT(DISTINCT order_id) AS Late_rate,
  AVG(delivery_days) AS delivery_days,
  (SUM(freight_total) / SUM(items_revenue)) AS Freight
FROM `Olist.Orders`
WHERE in_analysis_window = 1
  AND order_status = 'delivered';
