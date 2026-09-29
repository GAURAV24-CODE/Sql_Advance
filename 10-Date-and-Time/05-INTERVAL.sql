-- DAY 10 - TOPIC 5
-- INTERVAL

-- Regular Example 1
SELECT
    CURRENT_DATE + INTERVAL '7 days'
    AS next_week;

-- Regular Example 2
SELECT
    CURRENT_DATE - INTERVAL '30 days'
    AS previous_30_days;

-- Regular Example 3
SELECT
    CURRENT_TIMESTAMP + INTERVAL '2 hours'
    AS future_time;

-- Regular Example 4
SELECT
    CURRENT_TIMESTAMP - INTERVAL '15 minutes'
    AS previous_time;

-- Regular Example 5
SELECT
    CURRENT_DATE + INTERVAL '1 month'
    AS next_month;

-- TCS NQT / LeetCode 1
-- Orders from last 7 days
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '7 days';

-- TCS NQT / LeetCode 2
-- Orders from last 30 days
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '30 days';

-- TCS NQT / LeetCode 3
-- Orders expected within next 7 days
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE order_date >= CURRENT_DATE
  AND order_date < CURRENT_DATE + INTERVAL '7 days';

-- Hard SQL 1
-- Classify recent orders
SELECT
    order_id,
    order_date,
    CASE
        WHEN order_date >= CURRENT_DATE - INTERVAL '7 days'
            THEN 'Recent'
        WHEN order_date >= CURRENT_DATE - INTERVAL '30 days'
            THEN 'Medium'
        ELSE 'Old'
    END AS order_category
FROM orders;

-- Hard SQL 2
-- Monthly orders for previous month
SELECT
    COUNT(*) AS previous_month_orders
FROM orders
WHERE order_date >=
      DATE_TRUNC('month', CURRENT_DATE - INTERVAL '1 month')
  AND order_date <
      DATE_TRUNC('month', CURRENT_DATE);