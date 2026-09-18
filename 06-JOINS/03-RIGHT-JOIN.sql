-- RIGHT JOIN
-- Day 6: JOINs
-- PostgreSQL


-- Example 1: Show all orders with customer names
SELECT
    o.order_id,
    c.customer_name,
    o.total_amount
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id;


-- Example 2: Show orders with customer city
SELECT
    o.order_id,
    c.customer_name,
    c.city,
    o.order_status
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id;


-- Example 3: Show completed orders
SELECT
    o.order_id,
    c.customer_name,
    o.total_amount
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed';


-- Example 4: Count orders by customer
SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name;


-- Example 5: Total sales by customer
SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_sales
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;


-- TCS NQT / LeetCode-Style Questions


-- Q1: Find orders above 50000
SELECT
    o.order_id,
    c.customer_name,
    o.total_amount
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.total_amount > 50000;


-- Q2: Find completed orders
SELECT
    o.order_id,
    c.customer_name
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed';


-- Q3: Count completed orders for each customer
SELECT
    c.customer_name,
    COUNT(o.order_id) AS completed_orders
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_name;


-- Hard SQL Questions


-- Q4: Customers with completed sales above 50000
SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_sales
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_name
HAVING SUM(o.total_amount) > 50000;


-- Q5: Products with total quantity ordered above 3
SELECT
    p.product_name,
    SUM(o.quantity) AS total_quantity
FROM products AS p
RIGHT JOIN orders AS o
    ON p.product_id = o.product_id
GROUP BY p.product_name
HAVING SUM(o.quantity) > 3
ORDER BY total_quantity DESC;