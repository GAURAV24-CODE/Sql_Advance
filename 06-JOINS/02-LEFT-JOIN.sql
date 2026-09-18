-- LEFT JOIN

: Match customers with their orders
SELECT
    c.customer_name,
    o.order_id,
    o.total_amount
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;

-- Example 2: Show all customers and their order status
SELECT
    c.customer_name,
    o.order_id,
    o.order_status
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;

-- Example 3: Find customers who have no orders
SELECT
    c.customer_id,
    c.customer_name
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Example 4: Count orders for every customer
SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Example 5: Show every customer with completed order amount
SELECT
    c.customer_name,
    COALESCE(SUM(
        CASE
            WHEN o.order_status = 'Completed'
            THEN o.total_amount
            ELSE 0
        END
    ), 0) AS completed_sales
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name;


-- TCS NQT / LeetCode-style Practice

-- Q1: Find customers who have placed at least one order
-- Solution
SELECT DISTINCT
    c.customer_id,
    c.customer_name
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NOT NULL;

-- Q2: Find customers with no orders
-- Solution
SELECT
    c.customer_id,
    c.customer_name
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Q3: Find the total number of orders for each customer
-- Solution
SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name;


-- Hard SQL Questions

-- Q4: Find customers whose completed sales exceed 50000
-- Solution
SELECT
    c.customer_name,
    SUM(o.total_amount) AS completed_sales
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_name
HAVING SUM(o.total_amount) > 50000;

-- Q5: Show every customer and their total completed sales,
-- including customers with no completed orders
-- Solution
SELECT
    c.customer_id,
    c.customer_name,
    COALESCE(
        SUM(
            CASE
                WHEN o.order_status = 'Completed'
                THEN o.total_amount
                ELSE 0
            END
        ),
        0
    ) AS completed_sales
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;