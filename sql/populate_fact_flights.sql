INSERT INTO `t100-analysis.t100_analytics.fact_flights`
  (date_id, origin, destination, carrier, passengers, freight, mail)
SELECT
  DATE(YEAR, MONTH, 1)     AS date_id,
  ORIGIN                   AS origin,
  DEST                     AS destination,
  UNIQUE_CARRIER           AS carrier,
  SUM(PASSENGERS)    AS passengers,
  SUM(FREIGHT)       AS freight,
  SUM(MAIL)          AS mail
FROM
  `t100-analysis.t100_analytics.flights_staging`
GROUP BY
  date_id, origin, destination, carrier;
