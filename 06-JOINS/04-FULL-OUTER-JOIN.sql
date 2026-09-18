-- FULL OUTER JOIN
-- Day 6: JOINs
-- PostgreSQL


-- Example 1: Show all customers and orders
SELECT
    c.customer_name,
    o.order_id,
    o.total_amount
FROM customers AS c
FULL OUTER JOIN orders AS o
    ON c.customer_id = o.customer_id;


-- Example 2: Customer and order details
SELECT
    c.customer_name,
    c.city,
    o.order_id,
    o.order_status
FROM customers AS c
FULL OUTER JOIN orders AS o
    ON c.customer_id = o.customer_id;


-- Example 3: Find unmatched records
SELECT
    c.customer_name,
    o.order_id
FROM customers AS c
FULL OUTER JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL
   OR o.order_id IS NULL;


-- Example 4: Count orders per customer
SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers AS c
FULL OUTER JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name;


-- Example 5: Total sales per customer
SELECT
    c.customer_name,
    COALESCE(SUM(o.total_amount), 0) AS total_sales
FROM customers AS c
FULL OUTER JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;


-- TCS NQT / LeetCode-Style Questions


-- Q1: Find customers without orders
SELECT
    c.customer_id,
    c.customer_name
FROM customers AS c
FULL OUTER JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- Q2: Find orders without customers
SELECT
    o.order_id,
    o.customer_id
FROM customers AS c
FULL OUTER JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;


-- Q3: Show all customers and orders
SELECT
    c.customer_name,
    o.order_id
FROM customers AS c
FULL OUTER JOIN orders AS o
    ON c.customer_id = o.customer_id;


-- Hard SQL Questions


-- Q4: Customers with completed sales above 50000
SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_sales
FROM customers AS c
FULL OUTER JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_name
HAVING SUM(o.total_amount) > 50000;


 Find unmatched customers or orders
SELECT
    c.customer_name,
    o.order_id
FROM customers AS c
FULL OUTER JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL
   OR o.order_id IS NULL;