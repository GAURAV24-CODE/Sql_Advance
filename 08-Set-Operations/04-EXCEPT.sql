-- Day 8: EXCEPT
-- 04-EXCEPT.sql
-- PostgreSQL

-- Example 1: Find customers present in 2025 but not in 2026

SELECT customer_name
FROM customers_2025

EXCEPT

SELECT customer_name
FROM customers_2026;


-- Example 2: Find customers present in 2026 but not in 2025

SELECT customer_name
FROM customers_2026

EXCEPT

SELECT customer_name
FROM customers_2025;


-- Example 3: Find cities present in 2025 but not in 2026

SELECT city
FROM customers_2025

EXCEPT

SELECT city
FROM customers_2026;


-- Example 4: Find Corporate customers from 2025
-- who are not Corporate customers in 2026

SELECT customer_name
FROM customers_2025
WHERE category = 'Corporate'

EXCEPT

SELECT customer_name
FROM customers_2026
WHERE category = 'Corporate';


-- Example 5: Find customer-city combinations
-- present in 2025 but not in 2026

SELECT customer_name, city
FROM customers_2025

EXCEPT

SELECT customer_name, city
FROM customers_2026;


-- TCS NQT / LeetCode-style Question 1
-- Find customers who were present in 2025 but not in 2026.

SELECT customer_name
FROM customers_2025

EXCEPT

SELECT customer_name
FROM customers_2026;


-- TCS NQT / LeetCode-style Question 2
-- Find customers who are new in 2026.

SELECT customer_name
FROM customers_2026

EXCEPT

SELECT customer_name
FROM customers_2025;


-- TCS NQT / LeetCode-style Question 3
-- Find cities present in 2025 but not in 2026.

SELECT city
FROM customers_2025

EXCEPT

SELECT city
FROM customers_2026;


-- Hard Question 1
-- Find Retail customers from 2025 who are not
-- Retail customers in 2026.

SELECT customer_name
FROM customers_2025
WHERE category = 'Retail'

EXCEPT

SELECT customer_name
FROM customers_2026
WHERE category = 'Retail';


-- Hard Question 2
-- Find customer-city combinations unique to 2025.

SELECT customer_name, city
FROM customers_2025

EXCEPT

SELECT customer_name, city
FROM customers_2026;