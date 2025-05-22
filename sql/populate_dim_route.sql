-- Populate dim_route
INSERT INTO `t100-analysis.t100_analytics.dim_route`
(route_id, origin, destination)
SELECT DISTINCT
  CONCAT(ORIGIN, '-', DEST) AS route_id,
  ORIGIN                    AS origin,
  DEST                      AS destination
FROM   `t100-analysis.t100_analytics.flights_staging`
WHERE  ORIGIN IS NOT NULL
  AND  DEST   IS NOT NULL;
