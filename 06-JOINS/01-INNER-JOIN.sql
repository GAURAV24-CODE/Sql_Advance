-- INNER JOIN

-- Example 1: Match customers with their orders
SELECT *
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;

-- Example 2: Customer name with order amount
SELECT
    customer_name,
    order_id,
    total_amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;

-- Example 3: INNER JOIN with multiple columns
SELECT
    c.customer_name,
    c.city,
    o.order_id,
    o.quantity,
    o.total_amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;

-- Example 4: INNER JOIN with WHERE
SELECT
    c.customer_name,
    o.order_id,
    o.total_amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed';

-- Example 5: Join orders with products
SELECT
    o.order_id,
    p.product_name,
    p.category,
    o.quantity,
    o.total_amount
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id;

-- Example 6: Join customers and products through orders
SELECT
    c.customer_name,
    p.product_name,
    o.quantity,
    o.total_amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id;

-- Example 7: Three-table INNER JOIN with filtering
SELECT
    c.customer_name,
    c.city,
    o.order_id,
    p.product_name,
    p.category,
    o.total_amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
WHERE o.total_amount > 30000;


-- TCS NQT / LeetCode-style Practice

-- Q1: Find customer names and their order IDs
-- Solution
SELECT
    c.customer_name,
    o.order_id
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;

-- Q2: Find completed orders with customer names
-- Solution
SELECT
    c.customer_name,
    o.order_id,
    o.total_amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed';

-- Q3: Find customer name, product name and order amount
-- Solution
SELECT
    c.customer_name,
    p.product_name,
    o.total_amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id;


-- Hard SQL Questions

-- Q4: Find customers who purchased Electronics products
-- Solution
SELECT
    c.customer_name,
    p.product_name,
    p.category,
    o.total_amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
WHERE p.category = 'Electronics';

-- Q5: Find completed Electronics orders above 50000
-- Solution
SELECT
    c.customer_name,
    o.order_id,
    p.product_name,
    o.total_amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
WHERE o.order_status = 'Completed'
  AND p.category = 'Electronics'
  AND o.total_amount > 50000;