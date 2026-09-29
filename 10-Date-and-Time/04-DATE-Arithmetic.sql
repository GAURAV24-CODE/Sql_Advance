-- DAY 10 - TOPIC 4
-- DATE ARITHMETIC

-- Regular Example 1
SELECT
    DATE '2026-09-29' + 7 AS next_date;

-- Regular Example 2
SELECT
    DATE '2026-09-29' - 7 AS previous_date;

-- Regular Example 3
SELECT
    DATE '2026-09-29' - DATE '2026-09-20'
    AS days_difference;

-- Regular Example 4
SELECT
    order_id,
    order_date,
    order_date + 7 AS expected_followup_date
FROM orders;

-- Regular Example 5
SELECT
    order_id,
    order_date,
    order_date - 7 AS previous_week_date
FROM orders;

-- TCS NQT / LeetCode 1
-- Orders from the last 30 days
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE order_date >= CURRENT_DATE - 30;

-- TCS NQT / LeetCode 2
-- Orders from the next 7 days
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE order_date >= CURRENT_DATE
  AND order_date < CURRENT_DATE + 7;

-- TCS NQT / LeetCode 3
-- Calculate days since each order
SELECT
    order_id,
    customer_name,
    CURRENT_DATE - order_date AS days_since_order
FROM orders;

-- Hard SQL 1
-- Find orders older than 30 days
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE CURRENT_DATE - order_date > 30;

-- Hard SQL 2
-- Average days since orders
SELECT
    AVG(CURRENT_DATE - order_date)
        AS average_days_since_order
FROM orders;