-- DAY 3 — SORTING AND CONDITIONAL LOGIC
-- File: 04-LIMIT-with-ORDER-BY.sql
-- Topic: LIMIT with ORDER BY
-- Database: PostgreSQL

-- 1. First 5 orders
SELECT *
FROM sales_orders
LIMIT 5;

-- 2. Top 5 highest-value orders
SELECT
    order_id,
    customer_name,
    total_amount
FROM sales_orders
ORDER BY total_amount DESC
LIMIT 5;

-- 3. Top 3 highest-value orders
SELECT
    order_id,
    customer_name,
    product,
    total_amount
FROM sales_orders
ORDER BY total_amount DESC
LIMIT 3;

-- 4. Three lowest-value orders
SELECT
    order_id,
    customer_name,
    total_amount
FROM sales_orders
ORDER BY total_amount ASC
LIMIT 3;

-- 5. Latest 5 orders
SELECT
    order_id,
    customer_name,
    order_date
FROM sales_orders
ORDER BY order_date DESC
LIMIT 5;

-- 6. Earliest 5 orders
SELECT
    order_id,
    customer_name,
    order_date
FROM sales_orders
ORDER BY order_date ASC
LIMIT 5;

-- 7. Top 5 rated orders
SELECT
    customer_name,
    customer_rating
FROM sales_orders
ORDER BY customer_rating DESC
LIMIT 5;

-- 8. Top 3 most expensive products
SELECT
    product,
    unit_price
FROM sales_orders
ORDER BY unit_price DESC
LIMIT 3;

-- 9. Top 3 Pune orders
SELECT
    order_id,
    customer_name,
    city,
    total_amount
FROM sales_orders
WHERE city = 'Pune'
ORDER BY total_amount DESC
LIMIT 3;

-- 10. Top 3 paid orders
SELECT
    order_id,
    customer_name,
    total_amount,
    payment_status
FROM sales_orders
WHERE payment_status = 'Paid'
ORDER BY total_amount DESC
LIMIT 3;

-- 11. Top 3 Electronics orders
SELECT
    order_id,
    customer_name,
    product,
    total_amount
FROM sales_orders
WHERE category = 'Electronics'
ORDER BY total_amount DESC
LIMIT 3;

-- 12. Top 5 rated Electronics orders
SELECT
    customer_name,
    product,
    customer_rating
FROM sales_orders
WHERE category = 'Electronics'
ORDER BY customer_rating DESC
LIMIT 5;

-- 13. Top 5 orders by quantity
SELECT
    order_id,
    customer_name,
    product,
    quantity
FROM sales_orders
ORDER BY quantity DESC
LIMIT 5;

-- 14. Top 3 orders with tie-breaking by latest date
SELECT
    order_id,
    customer_name,
    total_amount,
    order_date
FROM sales_orders
ORDER BY total_amount DESC, order_date DESC
LIMIT 3;

-- 15. Top 5 Mumbai orders
SELECT
    order_id,
    customer_name,
    product,
    total_amount
FROM sales_orders
WHERE city = 'Mumbai'
ORDER BY total_amount DESC
LIMIT 5;