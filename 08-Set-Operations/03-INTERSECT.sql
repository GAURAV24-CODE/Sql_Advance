-- Day 8: INTERSECT
-- 03-INTERSECT.sql
-- PostgreSQL

-- Example 1: Find customers present in both 2025 and 2026

SELECT customer_name
FROM customers_2025

INTERSECT

SELECT customer_name
FROM customers_2026;


-- Example 2: Find cities present in both years

SELECT city
FROM customers_2025

INTERSECT

SELECT city
FROM customers_2026;


-- Example 3: Find Corporate customers present in both years

SELECT customer_name
FROM customers_2025
WHERE category = 'Corporate'

INTERSECT

SELECT customer_name
FROM customers_2026
WHERE category = 'Corporate';


-- Example 4: Find customers from Pune present in both years

SELECT customer_name
FROM customers_2025
WHERE city = 'Pune'

INTERSECT

SELECT customer_name
FROM customers_2026
WHERE city = 'Pune';


-- Example 5: Find common customer-city combinations

SELECT customer_name, city
FROM customers_2025

INTERSECT

SELECT customer_name, city
FROM customers_2026;


-- TCS NQT / LeetCode-style Question 1
-- Find customers who appear in both years.

SELECT customer_name
FROM customers_2025

INTERSECT

SELECT customer_name
FROM customers_2026;


-- TCS NQT / LeetCode-style Question 2
-- Find cities represented in both years.

SELECT city
FROM customers_2025

INTERSECT

SELECT city
FROM customers_2026;


-- TCS NQT / LeetCode-style Question 3
-- Find Retail customers common to both years.

SELECT customer_name
FROM customers_2025
WHERE category = 'Retail'

INTERSECT

SELECT customer_name
FROM customers_2026
WHERE category = 'Retail';


-- Hard Question 1
-- Find customer-city pairs that occur in both years.

SELECT customer_name, city
FROM customers_2025

INTERSECT

SELECT customer_name, city
FROM customers_2026;


-- Hard Question 2
-- Find common customers and sort them alphabetically.

SELECT customer_name
FROM customers_2025

INTERSECT

SELECT customer_name
FROM customers_2026

ORDER BY customer_name;