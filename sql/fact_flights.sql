-- sql/fact_flights.sql
CREATE OR REPLACE TABLE `t100-analysis.t100_analytics.fact_flights` (
  date_id     DATE    NOT NULL,
  origin      STRING  NOT NULL,
  destination STRING  NOT NULL,
  carrier     STRING  NOT NULL,
  passengers  FLOAT64,
  freight     FLOAT64,
  mail        FLOAT64
)
PARTITION BY date_id
CLUSTER BY origin, destination, carrier;
