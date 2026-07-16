SELECT
  d.operator_caused,
  COUNT(*) AS num_events,
  ROUND(SUM(d.est_cost_impact_usd), 0) AS total_cost_usd,
  ROUND(100 * SUM(d.est_cost_impact_usd) / SUM(SUM(d.est_cost_impact_usd)) OVER (), 1) AS pct_of_total_cost
FROM `secret-bay-485814-a6.manufacture.downtimeevents` d
GROUP BY d.operator_caused;
