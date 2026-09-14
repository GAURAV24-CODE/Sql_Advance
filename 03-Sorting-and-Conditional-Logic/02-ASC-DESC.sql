-- DAY 3 — SORTING AND CONDITIONAL LOGIC
-- File: 02-ASC-DESC.sql
-- Topic: ASC / DESC
-- Database: PostgreSQL


-- 1. Sales: low to high
SELECT
    customer_name,
    total_amount
FROM sales_orders
ORDER BY total_amount ASC;


-- 2. Sales: high to low
SELECT
    customer_name,
    total_amount
FROM sales_orders
ORDER BY total_amount DESC;


-- 3. Quantity: low to high
SELECT
    product,
    quantity
FROM sales_orders
ORDER BY quantity ASC;


-- 4. Quantity: high to low
SELECT
    product,
    quantity
FROM sales_orders
ORDER BY quantity DESC;


-- 5. Customer names: A to Z
SELECT
    customer_name
FROM sales_orders
ORDER BY customer_name ASC;


-- 6. Customer names: Z to A
SELECT
    customer_name
FROM sales_orders
ORDER BY customer_name DESC;


-- 7. Price: low to high
SELECT
    product,
    unit_price
FROM sales_orders
ORDER BY unit_price ASC;


-- 8. Price: high to low
SELECT
    product,
    unit_price
FROM sales_orders
ORDER BY unit_price DESC;


-- 9. Rating: low to high
SELECT
    customer_name,
    customer_rating
FROM sales_orders
ORDER BY customer_rating ASC;


-- 10. Rating: high to low
SELECT
    customer_name,
    customer_rating
FROM sales_orders
ORDER BY customer_rating DESC;


-- 11. Date: oldest to newest
SELECT
    order_id,
    order_date
FROM sales_orders
ORDER BY order_date ASC;


-- 12. Date: newest to oldest
SELECT
    order_id,
    order_date
FROM sales_orders
ORDER BY order_date DESC;


-- 13. Pune orders: highest sales first
SELECT
    customer_name,
    city,
    total_amount
FROM sales_orders
WHERE city = 'Pune'
ORDER BY total_amount DESC;


-- 14. Paid orders: lowest sales first
SELECT
    customer_name,
    total_amount,
    payment_status
FROM sales_orders
WHERE payment_status = 'Paid'
ORDER BY total_amount ASC;


-- 15. Top 3 highest-value orders
SELECT
    order_id,
    customer_name,
    total_amount
FROM sales_orders
ORDER BY total_amount DESC
LIMIT 3;