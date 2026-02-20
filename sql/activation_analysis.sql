-- Conversion globale (signup -> paid)
CREATE OR REPLACE TABLE main.conversion_global AS
SELECT
  COUNT(DISTINCT u.user_id) AS total_signups,
  COUNT(DISTINCT s.user_id) AS total_paid,
  ROUND(
    100.0 * COUNT(DISTINCT s.user_id) / COUNT(DISTINCT u.user_id),
    2
  ) AS conversion_rate_pct
FROM main.users u
LEFT JOIN main.subscriptions s
  ON u.user_id = s.user_id
 AND s.plan <> 'free';

-- Activation rate (first_value)
CREATE OR REPLACE TABLE main.activation_rate AS
SELECT
  COUNT(DISTINCT u.user_id) AS total_users,
  COUNT(DISTINCT a.user_id) AS activated_users,
  ROUND(
    100.0 * COUNT(DISTINCT a.user_id) / COUNT(DISTINCT u.user_id),
    2
  ) AS activation_rate_pct
FROM main.users u
LEFT JOIN (
  SELECT DISTINCT user_id
  FROM main.events
  WHERE event_name = 'first_value'
) a
ON u.user_id = a.user_id;

-- Conversion selon activation
CREATE OR REPLACE TABLE main.conversion_by_activation AS
WITH activated AS (
  SELECT DISTINCT user_id
  FROM main.events
  WHERE event_name = 'first_value'
),
paid AS (
  SELECT DISTINCT user_id
  FROM main.subscriptions
  WHERE plan <> 'free'
)
SELECT
  CASE WHEN a.user_id IS NOT NULL THEN 'Activated' ELSE 'Not Activated' END AS activation_status,
  COUNT(DISTINCT u.user_id) AS total_users,
  COUNT(DISTINCT p.user_id) AS paid_users,
  ROUND(
    100.0 * COUNT(DISTINCT p.user_id) / NULLIF(COUNT(DISTINCT u.user_id), 0),
    2
  ) AS conversion_pct
FROM main.users u
LEFT JOIN activated a ON u.user_id = a.user_id
LEFT JOIN paid p ON u.user_id = p.user_id
GROUP BY 1;

-- Funnel (Signup -> Activated -> Paid)
CREATE OR REPLACE TABLE main.funnel_numbers AS
WITH activated AS (
  SELECT DISTINCT user_id
  FROM main.events
  WHERE event_name='first_value'
),
paid AS (
  SELECT DISTINCT user_id
  FROM main.subscriptions
  WHERE plan <> 'free'
)
SELECT 'Signup' AS step, COUNT(*) AS users FROM main.users
UNION ALL
SELECT 'Activated', COUNT(*) FROM activated
UNION ALL
SELECT 'Paid', COUNT(*) FROM paid;
