-- Populate dim_carrier from UNIQUE_CARRIER
INSERT INTO `t100-analysis.t100_analytics.dim_carrier`
(carrier_code)
SELECT DISTINCT UNIQUE_CARRIER AS carrier_code
FROM   `t100-analysis.t100_analytics.flights_staging`
WHERE  UNIQUE_CARRIER IS NOT NULL;
