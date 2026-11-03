-- Original source: Customers Query. KNOWN JOIN LIMITATION: customer_unique_id multiplies rows.
-- Summed revenue is inflated by 7.04% in the supplied snapshots. Preserved for traceability.
-- Do not use affected revenue shares or state comparisons as validated findings.
SELECT
  O.order_id,
  O.customer_unique_id AS Id_customer,
  O.is_repeat_customer AS Is_repeat_customer,
  O.items_revenue AS Revenue,
  O.review_score AS Review_score,
  O.purchase_date AS Date_assessment,
  C.customer_state AS State
FROM `Olist.Orders` AS O
INNER JOIN `Olist.Customers` AS C
  ON O.customer_unique_id = C.customer_unique_id
WHERE O.in_analysis_window = 1
  AND O.order_status = 'delivered';
