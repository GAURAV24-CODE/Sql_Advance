-- DAY 10 - TOPIC 8
-- TO_CHAR

-- Regular Example 1
SELECT
    TO_CHAR(
        DATE '2026-09-29',
        'DD-MM-YYYY'
    ) AS formatted_date;

-- Regular Example 2
SELECT
    TO_CHAR(
        DATE '2026-09-29',
        'YYYY/MM/DD'
    ) AS formatted_date;

-- Regular Example 3
SELECT
    TO_CHAR(
        DATE '2026-09-29',
        'FMDD FMMonth YYYY'
    ) AS formatted_date;

-- Regular Example 4
SELECT
    TO_CHAR(
        TIMESTAMP '2026-09-29 17:35:42',
        'DD-MM-YYYY HH24:MI:SS'
    ) AS formatted_timestamp;

-- Regular Example 5
SELECT
    TO_CHAR(
        TIMESTAMP '2026-09-29 17:35:42',
        'DD-MM-YYYY HH12:MI:SS AM'
    ) AS formatted_timestamp;

-- TCS NQT / LeetCode 1
-- Format order date
SELECT
    order_id,
    TO_CHAR(
        order_date,
        'DD-MM-YYYY'
    ) AS formatted_date
FROM orders;

-- TCS NQT / LeetCode 2
-- Display month and year
SELECT
    TO_CHAR(
        order_date,
        'Mon YYYY'
    ) AS month_year,
    COUNT(*) AS total_orders
FROM orders
GROUP BY TO_CHAR(order_date, 'Mon YYYY')
ORDER BY MIN(order_date);

-- TCS NQT / LeetCode 3
-- Display weekday
SELECT
    order_id,
    order_date,
    TO_CHAR(
        order_date,
        'FMDay'
    ) AS day_name
FROM orders;

-- Hard SQL 1
-- Monthly formatted sales report
SELECT
    TO_CHAR(
        DATE_TRUNC('month', order_date),
        'FMMonth YYYY'
    ) AS sales_month,
    SUM(amount) AS total_sales
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date);

-- Hard SQL 2
-- Quarter label with formatted year
SELECT
    TO_CHAR(order_date, 'YYYY')
    || '-Q'
    || TO_CHAR(order_date, 'Q') AS quarter_label,
    SUM(amount) AS total_sales
FROM orders
GROUP BY
    TO_CHAR(order_date, 'YYYY'),
    TO_CHAR(order_date, 'Q')
ORDER BY quarter_label;