-- Time To First Value buckets for Tableau
CREATE OR REPLACE TABLE main.ttfv_buckets AS
WITH first_value AS (
  SELECT user_id, MIN(event_time) AS first_value_time
  FROM main.events
  WHERE event_name='first_value'
  GROUP BY 1
),
ttfv AS (
  SELECT
    u.user_id,
    DATE_DIFF('day', u.signup_date, f.first_value_time) AS days_to_value
  FROM main.users u
  JOIN first_value f USING(user_id)
)
SELECT
  CASE
    WHEN days_to_value BETWEEN 0 AND 3 THEN '0-3 days'
    WHEN days_to_value BETWEEN 4 AND 7 THEN '4-7 days'
    WHEN days_to_value BETWEEN 8 AND 14 THEN '8-14 days'
    ELSE '14+ days'
  END AS bucket,
  COUNT(*) AS users
FROM ttfv
GROUP BY 1;
