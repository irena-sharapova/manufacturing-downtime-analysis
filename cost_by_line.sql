SELECT
  d.line,
  l.product_line_value_per_hour_usd,
  COUNT(*) AS num_events,
  ROUND(SUM(d.downtime_minutes)/60, 1) AS total_hours,
  ROUND(SUM(d.est_cost_impact_usd), 0) AS total_cost_usd,
  ROUND(SUM(d.est_cost_impact_usd) / COUNT(*), 0) AS avg_cost_per_event
FROM `secret-bay-485814-a6.manufacture.downtimeevents` d
LEFT JOIN `secret-bay-485814-a6.manufacture.lines lookup` l
  ON d.line = l.line
GROUP BY d.line, l.product_line_value_per_hour_usd
ORDER BY total_cost_usd DESC;
