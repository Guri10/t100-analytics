-- Populate dim_airport from ORIGIN and DEST
INSERT INTO `t100-analysis.t100_analytics.dim_airport`
(airport_code)
SELECT DISTINCT ORIGIN AS airport_code
FROM   `t100-analysis.t100_analytics.flights_staging`
WHERE  ORIGIN IS NOT NULL

UNION DISTINCT

SELECT DISTINCT DEST   AS airport_code
FROM   `t100-analysis.t100_analytics.flights_staging`
WHERE  DEST   IS NOT NULL;
