-- Day 8: UNION ALL
-- 02-UNION-ALL.sql
-- PostgreSQL

-- Example 1: Find all customer names from both years
-- UNION ALL keeps duplicates.

SELECT customer_name
FROM customers_2025

UNION ALL

SELECT customer_name
FROM customers_2026;


-- Example 2: Find all cities from both years

SELECT city
FROM customers_2025

UNION ALL

SELECT city
FROM customers_2026;


-- Example 3: Find all customer and category combinations

SELECT customer_name, category
FROM customers_2025

UNION ALL

SELECT customer_name, category
FROM customers_2026;


-- Example 4: Find all Retail customers from both years

SELECT customer_name
FROM customers_2025
WHERE category = 'Retail'

UNION ALL

SELECT customer_name
FROM customers_2026
WHERE category = 'Retail';


-- Example 5: Combine all online and store orders

SELECT order_id, customer_name, amount
FROM online_orders

UNION ALL

SELECT order_id, customer_name, amount
FROM store_orders;


-- TCS NQT / LeetCode-style Question 1
-- Return every customer record from both years.

SELECT customer_name, city
FROM customers_2025

UNION ALL

SELECT customer_name, city
FROM customers_2026;


-- TCS NQT / LeetCode-style Question 2
-- Return every order from both online and store channels.

SELECT order_id, customer_name, amount
FROM online_orders

UNION ALL

SELECT order_id, customer_name, amount
FROM store_orders;


-- TCS NQT / LeetCode-style Question 3
-- Return all Pune customers from both years.

SELECT customer_name, city
FROM customers_2025
WHERE city = 'Pune'

UNION ALL

SELECT customer_name, city
FROM customers_2026
WHERE city = 'Pune';


-- Hard Question 1
-- Combine online and store orders and identify the source.

SELECT
    order_id,
    customer_name,
    amount,
    'Online' AS source
FROM online_orders

UNION ALL

SELECT
    order_id,
    customer_name,
    amount,
    'Store' AS source
FROM store_orders;


-- Hard Question 2
-- Calculate total revenue from both online and store orders.
-- UNION ALL is used because every order must be retained.

SELECT SUM(amount) AS total_revenue
FROM (
    SELECT amount
    FROM online_orders

    UNION ALL

    SELECT amount
    FROM store_orders
) AS all_orders;next