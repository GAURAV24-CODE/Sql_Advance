-- DAY 3 — SORTING AND CONDITIONAL LOGIC
-- File: 03-Multiple-Column-Sorting.sql
-- Topic: Multiple Column Sorting
-- Database: PostgreSQL


-- 1. Sort by city, then sales
SELECT
    customer_name,
    city,
    total_amount
FROM sales_orders
ORDER BY city ASC, total_amount DESC;


-- 2. Sort by category, then sales
SELECT
    product,
    category,
    total_amount
FROM sales_orders
ORDER BY category ASC, total_amount DESC;


-- 3. Sort by payment status, then sales
SELECT
    customer_name,
    payment_status,
    total_amount
FROM sales_orders
ORDER BY payment_status ASC, total_amount DESC;


-- 4. Sort by city, then customer name
SELECT
    customer_name,
    city
FROM sales_orders
ORDER BY city ASC, customer_name ASC;


-- 5. Sort by city and rating
SELECT
    customer_name,
    city,
    customer_rating
FROM sales_orders
ORDER BY city ASC, customer_rating DESC;


-- 6. Sort by category and unit price
SELECT
    product,
    category,
    unit_price
FROM sales_orders
ORDER BY category ASC, unit_price DESC;


-- 7. Sort by quantity and sales
SELECT
    customer_name,
    quantity,
    total_amount
FROM sales_orders
ORDER BY quantity DESC, total_amount DESC;


-- 8. Sort by payment status and date
SELECT
    customer_name,
    payment_status,
    order_date
FROM sales_orders
ORDER BY payment_status ASC, order_date DESC;


-- 9. Sort by city and date
SELECT
    customer_name,
    city,
    order_date
FROM sales_orders
ORDER BY city ASC, order_date DESC;


-- 10. Sort by category and rating
SELECT
    product,
    category,
    customer_rating
FROM sales_orders
ORDER BY category ASC, customer_rating DESC;


-- 11. Pune and Mumbai orders
-- Sort city first, then sales
SELECT
    customer_name,
    city,
    total_amount
FROM sales_orders
WHERE city IN ('Pune', 'Mumbai')
ORDER BY city ASC, total_amount DESC;


-- 12. Electronics orders
-- Sort by sales and rating
SELECT
    customer_name,
    product,
    total_amount,
    customer_rating
FROM sales_orders
WHERE category = 'Electronics'
ORDER BY total_amount DESC, customer_rating DESC;


-- 13. Paid orders
-- Highest sales first, then latest date
SELECT
    customer_name,
    total_amount,
    order_date
FROM sales_orders
WHERE payment_status = 'Paid'
ORDER BY total_amount DESC, order_date DESC;


-- 14. Sort using three columns
SELECT
    customer_name,
    city,
    category,
    total_amount
FROM sales_orders
ORDER BY city ASC,
         category ASC,
         total_amount DESC;


-- 15. Highest sales within each city
SELECT
    customer_name,
    city,
    product,
    total_amount
FROM sales_orders
ORDER BY city ASC,
         total_amount DESC;