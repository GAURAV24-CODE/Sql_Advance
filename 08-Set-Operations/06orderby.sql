-- Day 8: Set Operations with ORDER BY
-- 06-Set-Operations-with-ORDER-BY.sql
-- PostgreSQL

-- Example 1: UNION with ascending order

SELECT customer_name
FROM customers_2025

UNION

SELECT customer_name
FROM customers_2026

ORDER BY customer_name ASC;


-- Example 2: UNION ALL with descending order

SELECT customer_name
FROM customers_2025

UNION ALL

SELECT customer_name
FROM customers_2026

ORDER BY customer_name DESC;


-- Example 3: Sort the combined result by city
-- and then by customer name

SELECT customer_name, city
FROM customers_2025

UNION

SELECT customer_name, city
FROM customers_2026

ORDER BY city, customer_name;


-- Example 4: Use an alias from the first SELECT

SELECT customer_name AS name, city
FROM customers_2025

UNION

SELECT customer_name, city
FROM customers_2026

ORDER BY name;


-- Example 5: ORDER BY with LIMIT
-- LIMIT applies to the final combined result

SELECT customer_name
FROM customers_2025

UNION

SELECT customer_name
FROM customers_2026

ORDER BY customer_name

LIMIT 5;


-- TCS NQT / LeetCode-style Question 1
-- Find unique customers from both years
-- and sort them alphabetically.

SELECT customer_name
FROM customers_2025

UNION

SELECT customer_name
FROM customers_2026

ORDER BY customer_name;


-- TCS NQT / LeetCode-style Question 2
-- Find all customers including duplicates
-- and sort them in descending order.

SELECT customer_name
FROM customers_2025

UNION ALL

SELECT customer_name
FROM customers_2026

ORDER BY customer_name DESC;


-- TCS NQT / LeetCode-style Question 3
-- Find the first 5 unique customers alphabetically.

SELECT customer_name
FROM customers_2025

UNION

SELECT customer_name
FROM customers_2026

ORDER BY customer_name

LIMIT 5;


-- Hard Question 1
-- Find unique customer-city combinations
-- sorted by city and customer name.

SELECT customer_name, city
FROM customers_2025

UNION

SELECT customer_name, city
FROM customers_2026

ORDER BY city, customer_name;


-- Hard Question 2
-- Combine all online and store orders,
-- sort by amount from highest to lowest,
-- and return the top 10 orders.

SELECT order_id, customer_name, amount
FROM online_orders

UNION ALL

SELECT order_id, customer_name, amount
FROM store_orders

ORDER BY amount DESC

LIMIT 10;