CREATE OR REPLACE TABLE `t100-analysis.t100_analytics.dim_route` (
  route_id    STRING NOT NULL,  -- e.g. CONCAT(origin,'-',destination)
  origin      STRING NOT NULL,
  destination STRING NOT NULL
);
