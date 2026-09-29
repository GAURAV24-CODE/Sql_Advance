-- DAY 10 - TOPIC 2
-- CURRENT_DATE AND CURRENT_TIMESTAMP

-- Regular Example 1
SELECT CURRENT_DATE AS today;

-- Regular Example 2
SELECT CURRENT_TIMESTAMP AS current_timestamp;

-- Regular Example 3
SELECT NOW() AS current_time;

-- Regular Example 4
SELECT
    order_id,
    order_date
FROM orders
WHERE order_date <= CURRENT_DATE;

-- Regular Example 5
SELECT
    EXTRACT(YEAR FROM CURRENT_DATE) AS current_year;

-- TCS NQT / LeetCode 1
-- Find orders placed up to today
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE order_date <= CURRENT_DATE;

-- TCS NQT / LeetCode 2
-- Find orders placed in the current year
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE EXTRACT(YEAR FROM order_date)
      = EXTRACT(YEAR FROM CURRENT_DATE);

-- TCS NQT / LeetCode 3
-- Find orders placed today
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE order_date = CURRENT_DATE;

-- Hard SQL 1
-- Count current-year orders
SELECT
    COUNT(*) AS current_year_orders
FROM orders
WHERE order_date >= DATE_TRUNC('year', CURRENT_DATE)
  AND order_date < DATE_TRUNC('year', CURRENT_DATE)
                    + INTERVAL '1 year';

-- Hard SQL 2
-- Calculate current-year revenue
SELECT
    SUM(amount) AS current_year_revenue
FROM orders
WHERE order_date >= DATE_TRUNC('year', CURRENT_DATE)
  AND order_date < DATE_TRUNC('year', CURRENT_DATE)
                    + INTERVAL '1 year';