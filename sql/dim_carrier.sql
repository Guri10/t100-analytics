CREATE OR REPLACE TABLE `t100-analysis.t100_analytics.dim_carrier` (
  carrier_code STRING NOT NULL,
  carrier_name STRING  -- optional, can fill via a static mapping
);
