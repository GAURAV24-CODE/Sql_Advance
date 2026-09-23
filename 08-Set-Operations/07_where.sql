-- Day 8: Set Operations with WHERE
-- 07-Set-Operations-with-WHERE.sql
-- PostgreSQL

-- Example 1: Find Retail customers from both years

SELECT customer_name
FROM customers_2025
WHERE category = 'Retail'

UNION

SELECT customer_name
FROM customers_2026
WHERE category = 'Retail';


-- Example 2: Find customers from Pune in both years

SELECT customer_name
FROM customers_2025
WHERE city = 'Pune'

INTERSECT

SELECT customer_name
FROM customers_2026
WHERE city = 'Pune';


-- Example 3: Find Corporate customers from both years

SELECT customer_name
FROM customers_2025
WHERE category = 'Corporate'

INTERSECT

SELECT customer_name
FROM customers_2026
WHERE category = 'Corporate';


-- Example 4: Combine orders above 20000
-- from both online and store channels

SELECT order_id, customer_name, amount
FROM online_orders
WHERE amount > 20000

UNION ALL

SELECT order_id, customer_name, amount
FROM store_orders
WHERE amount > 20000;


-- Example 5: Find customers from Nashik or Pune
-- across both years

SELECT customer_name
FROM customers_2025
WHERE city IN ('Nashik', 'Pune')

UNION

SELECT customer_name
FROM customers_2026
WHERE city IN ('Nashik', 'Pune');


-- TCS NQT / LeetCode-style Question 1
-- Find Retail customers from Pune
-- across both years.

SELECT customer_name
FROM customers_2025
WHERE category = 'Retail'
  AND city = 'Pune'

UNION

SELECT customer_name
FROM customers_2026
WHERE category = 'Retail'
  AND city = 'Pune';


-- TCS NQT / LeetCode-style Question 2
-- Find all orders above 5000
-- from both channels.

SELECT order_id, customer_name, amount
FROM online_orders
WHERE amount > 5000

UNION ALL

SELECT order_id, customer_name, amount
FROM store_orders
WHERE amount > 5000;


-- TCS NQT / LeetCode-style Question 3
-- Find customers from Mumbai
-- who appear in either year.

SELECT customer_name
FROM customers_2025
WHERE city = 'Mumbai'

UNION

SELECT customer_name
FROM customers_2026
WHERE city = 'Mumbai';


-- Hard Question 1
-- Find Corporate customers from Pune or Delhi
-- across both years.

SELECT customer_name
FROM customers_2025
WHERE category = 'Corporate'
  AND city IN ('Pune', 'Delhi')

UNION

SELECT customer_name
FROM customers_2026
WHERE category = 'Corporate'
  AND city IN ('Pune', 'Delhi');


-- Hard Question 2
-- Find orders between 2000 and 30000
-- from both online and store channels.

SELECT order_id, customer_name, amount
FROM online_orders
WHERE amount BETWEEN 2000 AND 30000

UNION ALL

SELECT order_id, customer_name, amount
FROM store_orders
WHERE amount BETWEEN 2000 AND 30000;