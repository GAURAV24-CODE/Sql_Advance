-- DAY 10 - TOPIC 3
-- EXTRACT

-- Regular Example 1
SELECT
    EXTRACT(YEAR FROM DATE '2026-09-29') AS year;

-- Regular Example 2
SELECT
    EXTRACT(MONTH FROM DATE '2026-09-29') AS month;

-- Regular Example 3
SELECT
    EXTRACT(DAY FROM DATE '2026-09-29') AS day;

-- Regular Example 4
SELECT
    order_id,
    EXTRACT(YEAR FROM order_date) AS order_year
FROM orders;

-- Regular Example 5
SELECT
    order_id,
    EXTRACT(MONTH FROM order_date) AS order_month
FROM orders;

-- TCS NQT / LeetCode 1
-- Find orders from September
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE EXTRACT(MONTH FROM order_date) = 9;

-- TCS NQT / LeetCode 2
-- Find orders from 2026
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2026;

-- TCS NQT / LeetCode 3
-- Count orders by month
SELECT
    EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY order_month;

-- Hard SQL 1
-- Monthly revenue
SELECT
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY order_month;

-- Hard SQL 2
-- Weekend orders
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE EXTRACT(DOW FROM order_date) IN (0, 6);