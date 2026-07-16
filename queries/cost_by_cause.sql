SELECT
  d.downtime_cause,
  c.category,
  COUNT(*) AS num_events,
  ROUND(SUM(d.downtime_minutes)/60, 1) AS total_hours,
  ROUND(SUM(d.est_cost_impact_usd), 0) AS total_cost_usd,
  ROUND(AVG(d.downtime_minutes), 1) AS avg_minutes_per_event
FROM `secret-bay-485814-a6.manufacture.downtimeevents` d
LEFT JOIN `secret-bay-485814-a6.manufacture.causes lookup` c
  ON d.downtime_cause = c.downtime_cause
GROUP BY d.downtime_cause, c.category
ORDER BY total_cost_usd DESC;
