-- DAY 10 - TOPIC 9
-- DATE FILTERING AND RANGES

-- Regular Example 1
SELECT *
FROM orders
WHERE order_date >= DATE '2026-01-01';

-- Regular Example 2
SELECT *
FROM orders
WHERE order_date <= DATE '2026-03-31';

-- Regular Example 3
SELECT *
FROM orders
WHERE order_date
BETWEEN DATE '2026-01-01'
    AND DATE '2026-01-31';

-- Regular Example 4
SELECT *
FROM orders
WHERE order_date >= DATE '2026-01-01'
  AND order_date < DATE '2026-02-01';

-- Regular Example 5
SELECT *
FROM orders
WHERE order_date >= DATE '2026-01-01'
  AND order_date < DATE '2027-01-01';

-- TCS NQT / LeetCode 1
-- Find Q1 orders
SELECT
    order_id,
    customer_name,
    order_date
FROM orders
WHERE order_date >= DATE '2026-01-01'
  AND order_date < DATE '2026-04-01';

-- TCS NQT / LeetCode 2
-- Count January orders
SELECT
    COUNT(*) AS january_orders
FROM orders
WHERE order_date >= DATE '2026-01-01'
  AND order_date < DATE '2026-02-01';

-- TCS NQT / LeetCode 3
-- January revenue
SELECT
    SUM(amount) AS january_revenue
FROM orders
WHERE order_date >= DATE '2026-01-01'
  AND order_date < DATE '2026-02-01';

-- Hard SQL 1
-- Monthly revenue for 2026
SELECT
    DATE_TRUNC('month', order_date) AS sales_month,
    SUM(amount) AS total_sales
FROM orders
WHERE order_date >= DATE '2026-01-01'
  AND order_date < DATE '2027-01-01'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;

-- Hard SQL 2
-- Find the highest-revenue month
SELECT
    DATE_TRUNC('month', order_date) AS sales_month,
    SUM(amount) AS total_sales
FROM orders
WHERE order_date >= DATE '2026-01-01'
  AND order_date < DATE '2027-01-01'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY total_sales DESC
LIMIT 1;