-- Original source: delivery query 2. Grain: order. Original Revie_score alias preserved.
SELECT
  purchase_date AS Date_assessment,
  review_score AS Revie_score,
  is_late AS late_delivery,
  order_id AS order_id
FROM `Olist.Orders`
WHERE in_analysis_window = 1
  AND order_status = 'delivered';
