-- Day 8: UNION
-- 01-UNION.sql
-- PostgreSQL

-- Example 1: Find unique customer names from both years
SELECT customer_name
FROM customers_2025

UNION

SELECT customer_name
FROM customers_2026;


-- Example 2: Find unique cities from both years
SELECT city
FROM customers_2025

UNION

SELECT city
FROM customers_2026;


-- Example 3: Find unique customer and category combinations
SELECT customer_name, category
FROM customers_2025

UNION

SELECT customer_name, category
FROM customers_2026;


-- Example 4: Find unique Retail customer names from both years
SELECT customer_name
FROM customers_2025
WHERE category = 'Retail'

UNION

SELECT customer_name
FROM customers_2026
WHERE category = 'Retail';


-- Example 5: Find unique customers from Pune or Nashik
SELECT customer_name
FROM customers_2025
WHERE city IN ('Pune', 'Nashik')

UNION

SELECT customer_name
FROM customers_2026
WHERE city IN ('Pune', 'Nashik');


-- TCS NQT / LeetCode-style Question 1
-- Find all unique customers across 2025 and 2026.

SELECT customer_name
FROM customers_2025

UNION

SELECT customer_name
FROM customers_2026;


-- TCS NQT / LeetCode-style Question 2
-- Find all unique cities across both years.

SELECT city
FROM customers_2025

UNION

SELECT city
FROM customers_2026;


-- TCS NQT / LeetCode-style Question 3
-- Find unique Corporate customers across both years.

SELECT customer_name
FROM customers_2025
WHERE category = 'Corporate'

UNION

SELECT customer_name
FROM customers_2026
WHERE category = 'Corporate';


-- Hard Question 1
-- Find unique customer-city combinations across both years.

SELECT customer_name, city
FROM customers_2025

UNION

SELECT customer_name, city
FROM customers_2026;


-- Hard Question 2
-- Find unique customers from Pune or Mumbai across both years.

SELECT customer_name
FROM customers_2025
WHERE city IN ('Pune', 'Mumbai')

UNION

SELECT customer_name
FROM customers_2026
WHERE city IN ('Pune', 'Mumbai');