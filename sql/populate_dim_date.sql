INSERT INTO `t100-analysis.t100_analytics.dim_date`
  (date_id, year, month, day, quarter, weekday)
SELECT DISTINCT
  DATE(YEAR, MONTH, 1)                             AS date_id,
  YEAR                                             AS year,
  MONTH                                            AS month,
  1                                                AS day,
  EXTRACT(QUARTER FROM DATE(YEAR, MONTH, 1))       AS quarter,
  FORMAT_DATE('%A', DATE(YEAR, MONTH, 1))          AS weekday
FROM
  `t100-analysis.t100_analytics.flights_staging`;
