CREATE OR REPLACE TABLE `t100-analysis.t100_analytics.dim_date` (
  date_id   DATE   NOT NULL,
  year      INT64,
  month     INT64,
  day       INT64,
  quarter   INT64,
  weekday   STRING
)
PARTITION BY date_id;
