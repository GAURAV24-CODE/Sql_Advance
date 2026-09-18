-- CROSS JOIN
-- Day 6: JOINs
-- PostgreSQL


-- Example 1: All customer-product combinations
SELECT
    c.customer_name,
    p.product_name
FROM customers AS c
CROSS JOIN products AS p;


-- Example 2: Customer and product prices
SELECT
    c.customer_name,
    p.product_name,
    p.price
FROM customers AS c
CROSS JOIN products AS p;


-- Example 3: Customer-product combinations
-- for Electronics only
SELECT
    c.customer_name,
    p.product_name,
    p.category
FROM customers AS c
CROSS JOIN products AS p
WHERE p.category = 'Electronics';


-- Example 4: Count all possible combinations
SELECT
    COUNT(*) AS total_combinations
FROM customers AS c
CROSS JOIN products AS p;


-- Example 5: Products with every customer
SELECT
    p.product_name,
    c.customer_name
FROM products AS p
CROSS JOIN customers AS c
ORDER BY p.product_name;


-- TCS NQT / LeetCode-Style Questions


-- Q1: Generate all customer-product combinations
SELECT
    c.customer_name,
    p.product_name
FROM customers AS c
CROSS JOIN products AS p;


-- Q2: Generate combinations for Furniture products
SELECT
    c.customer_name,
    p.product_name
FROM customers AS c
CROSS JOIN products AS p
WHERE p.category = 'Furniture';


-- Q3: Count customer-product combinations
SELECT
    COUNT(*) AS total_combinations
FROM customers AS c
CROSS JOIN products AS p;


-- Hard SQL Questions


-- Q4: Find customer-product combinations
-- where product price is above 30000
SELECT
    c.customer_name,
    p.product_name,
    p.price
FROM customers AS c
CROSS JOIN products AS p
WHERE p.price > 30000
ORDER BY p.price DESC;

 Generate every customer-product combination
-- and calculate a 10% discount price
SELECT
    c.customer_name,
    p.product_name,
    p.price,
    ROUND(p.price * 0.90, 2) AS discounted_price
FROM customers AS c
CROSS JOIN products AS p
ORDER BY c.customer_name, p.product_name;