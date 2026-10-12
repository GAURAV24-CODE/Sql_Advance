
-- ============================================================
-- File: 15-Repeat-Customers.sql
-- Topic: Repeat Customers
-- Database: PostgreSQL
-- ============================================================

-- DATASET:
-- orders(order_id, customer_id, order_date, amount)


-- ============================================================
-- 1. EASY PATTERN
-- Question:
-- Find customers who have placed more than one order.
-- ============================================================

SELECT
    customer_id,
    COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY customer_id;


-- ============================================================
-- 2. MEDIUM PATTERN
-- Question:
-- Find repeat customers and calculate their total spending.
-- ============================================================

SELECT
    customer_id,
    COUNT(*) AS total_orders,
    SUM(amount) AS total_spending
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY total_spending DESC;


-- ============================================================
-- 3. HARD PATTERN
-- Question:
-- Find customers who placed orders on at least two
-- different dates.
-- ============================================================

SELECT
    customer_id,
    COUNT(DISTINCT order_date) AS distinct_order_dates
FROM orders
GROUP BY customer_id
HAVING COUNT(DISTINCT order_date) >= 2
ORDER BY customer_id;


-- ============================================================
-- 4. TCS NQT PATTERN
-- Question:
-- Which clause filters grouped results?
--
-- A. WHERE
-- B. ORDER BY
-- C. HAVING
-- D. DISTINCT
--
-- Answer: C
--
-- Practice:
-- Find customers who have placed at least 3 orders.
-- ============================================================

SELECT
    customer_id,
    COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) >= 3
ORDER BY customer_id;


-- ============================================================
-- 5. ADVANCED INTERVIEW PATTERN
-- Question:
-- Find repeat customers, their first order date,
-- latest order date, order count, and total spending.
-- ============================================================

SELECT
    customer_id,
    COUNT(*) AS total_orders,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS latest_order_date,
    SUM(amount) AS total_spending
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY total_spending DESC;


-- ============================================================
-- BONUS: FIND CUSTOMERS WHO ORDERED AGAIN WITHIN 30 DAYS
-- Question:
-- Find customers who placed a later order within 30 days
-- of their previous order.
-- ============================================================

WITH customer_order_history AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        LAG(order_date) OVER (
            PARTITION BY customer_id
            ORDER BY order_date, order_id
        ) AS previous_order_date
    FROM orders
)
SELECT
    customer_id,
    order_id,
    previous_order_date,
    order_date AS repeat_order_date,
    order_date - previous_order_date AS days_between_orders
FROM customer_order_history
WHERE order_date > previous_order_date
  AND order_date - previous_order_date <= 30
ORDER BY customer_id, order_date;


-- ============================================================
-- KEY CONCEPTS
--
-- GROUP BY:
-- Groups orders by customer.
--
-- COUNT(*):
-- Counts the number of order records.
--
-- HAVING COUNT(*) > 1:
-- Keeps customers with multiple orders.
--
-- COUNT(DISTINCT order_date):
-- Counts different order dates, not individual orders.
--
-- LAG():
-- Retrieves the previous order date for each customer.
--
-- Important:
-- A repeat customer is usually defined as a customer with
-- more than one order. If your business defines repeat
-- purchases differently, adjust the condition accordingly.
-- ============================================================
