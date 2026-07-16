SELECT
  d.shift,
  COUNT(*) AS num_events,
  ROUND(SUM(d.est_cost_impact_usd), 0) AS total_cost_usd,
  ROUND(AVG(d.downtime_minutes), 1) AS avg_minutes_per_event
FROM `secret-bay-485814-a6.manufacture.downtimeevents` d
GROUP BY d.shift
ORDER BY total_cost_usd DESC;
