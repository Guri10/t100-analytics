CREATE OR REPLACE TABLE `t100-analysis.t100_analytics.dim_airport` (
  airport_code STRING NOT NULL,
  airport_name STRING  -- you can enrich this later if you have a lookup
);
