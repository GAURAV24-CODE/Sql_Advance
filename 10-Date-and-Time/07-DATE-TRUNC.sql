-- DAY 10 - TOPIC 7
-- DATE_TRUNC

-- Regular Example 1
SELECT
    DATE_TRUNC(
        'month',
        TIMESTAMP '2026-09-29 10:35:45'
    );

-- Regular Example 2
SELECT
    DATE_TRUNC(
        'year',
        TIMESTAMP '2026-09-29 10:35:45'
    );

-- Regular Example 3
SELECT
    DATE_TRUNC(
        'day',
        TIMESTAMP '2026-09-29 10:35:45'
    );

-- Regular Example 4
SELECT
    DATE_TRUNC(
        'hour',
        TIMESTAMP '2026-09-29 10:35:45'
    );

-- Regular Example 5
SELECT
    DATE_TRUNC(
        'quarter',
        TIMESTAMP '2026-09-29 10:35:45'
    );

-- TCS NQT / LeetCode 1
-- Count orders by month
SELECT
    DATE_TRUNC('month', order_date) AS sales_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;

-- TCS NQT / LeetCode 2
-- Revenue by month
SELECT
    DATE_TRUNC('month', order_date) AS sales_month,
    SUM(amount) AS total_sales
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;

-- TCS NQT / LeetCode 3
-- Orders by year
SELECT
    DATE_TRUNC('year', order_date) AS sales_year,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATE_TRUNC('year', order_date)
ORDER BY sales_year;

-- Hard SQL 1
-- Monthly revenue with ranking
SELECT
    DATE_TRUNC('month', order_date) AS sales_month,
    SUM(amount) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(amount) DESC
    ) AS revenue_rank
FROM orders
GROUP BY DATE_TRUNC('month', order_date);

-- Hard SQL 2
-- Current month revenue
SELECT
    SUM(amount) AS current_month_revenue
FROM orders
WHERE order_date >= DATE_TRUNC('month', CURRENT_DATE)
  AND order_date <
      DATE_TRUNC('month', CURRENT_DATE)
      + INTERVAL '1 month';