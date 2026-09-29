-- DAY 10 - TOPIC 1
-- DATE BASICS

-- Regular Example 1
SELECT DATE '2026-09-29' AS today_date;

-- Regular Example 2
SELECT
    DATE '2026-09-29' AS start_date,
    DATE '2026-10-05' AS end_date;

-- Regular Example 3
SELECT
    DATE '2026-09-29' AS order_date,
    DATE '2026-10-06' AS delivery_date;

-- Regular Example 4
SELECT
    order_id,
    order_date
FROM orders;

-- Regular Example 5
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
ORDER BY order_date;

-- TCS NQT / LeetCode 1
-- Find orders placed after 2026-06-01
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE order_date > DATE '2026-06-01';

-- TCS NQT / LeetCode 2
-- Find orders placed before 2026-04-01
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE order_date < DATE '2026-04-01';

-- TCS NQT / LeetCode 3
-- Find orders placed on or after 2026-01-01
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE order_date >= DATE '2026-01-01';

-- Hard SQL 1
-- Find earliest order date
SELECT
    MIN(order_date) AS earliest_order_date
FROM orders;

-- Hard SQL 2
-- Find latest order date
SELECT
    MAX(order_date) AS latest_order_date
FROM orders;