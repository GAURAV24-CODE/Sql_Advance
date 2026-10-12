
-- ============================================================
-- File: 07-LAG-and-LEAD.sql
-- Topic: LAG() and LEAD() Window Functions
-- Database: PostgreSQL
-- ============================================================

-- DATASET:
-- orders(order_id, customer_id, order_date, amount)


-- ============================================================
-- 1. EASY PATTERN
-- Question:
-- Display each order amount and the previous order amount
-- across all customers.
-- ============================================================

SELECT
    order_id,
    order_date,
    amount,
    LAG(amount) OVER (
        ORDER BY order_date, order_id
    ) AS previous_order_amount
FROM orders
ORDER BY order_date, order_id;


-- ============================================================
-- 2. MEDIUM PATTERN
-- Question:
-- Compare each customer's order amount with their
-- previous order amount.
-- ============================================================

SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    LAG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
    ) AS previous_order_amount
FROM orders
ORDER BY customer_id, order_date, order_id;


-- ============================================================
-- 3. HARD PATTERN
-- Question:
-- Calculate the difference between the current order amount
-- and the customer's previous order amount.
-- ============================================================

SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    LAG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
    ) AS previous_order_amount,
    amount - LAG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
    ) AS amount_difference
FROM orders
ORDER BY customer_id, order_date, order_id;


-- ============================================================
-- 4. TCS NQT PATTERN
-- Question:
-- Which function returns a value from the next row
-- within a window?
--
-- A. LAG()
-- B. LEAD()
-- C. FIRST_VALUE()
-- D. COUNT()
--
-- Answer: B
--
-- Practice:
-- Display the current order amount and the next order amount
-- for each customer.
-- ============================================================

SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    LEAD(amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
    ) AS next_order_amount
FROM orders
ORDER BY customer_id, order_date, order_id;


-- ============================================================
-- 5. ADVANCED INTERVIEW PATTERN
-- Question:
-- Find customer orders where the amount increased compared
-- with the customer's previous order.
-- ============================================================

WITH order_comparison AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        amount,
        LAG(amount) OVER (
            PARTITION BY customer_id
            ORDER BY order_date, order_id
        ) AS previous_order_amount
    FROM orders
)
SELECT
    order_id,
    customer_id,
    order_date,
    previous_order_amount,
    amount AS current_order_amount,
    amount - previous_order_amount AS amount_increase
FROM order_comparison
WHERE amount > previous_order_amount
ORDER BY customer_id, order_date, order_id;


-- ============================================================
-- BONUS: LAG() WITH A DEFAULT VALUE
-- Question:
-- Show 0 instead of NULL when a customer has no previous order.
-- ============================================================

SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    LAG(amount, 1, 0) OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
    ) AS previous_order_amount
FROM orders
ORDER BY customer_id, order_date, order_id;


-- ============================================================
-- KEY CONCEPTS
--
-- LAG(column):
-- Returns a value from a preceding row.
--
-- LEAD(column):
-- Returns a value from a following row.
--
-- PARTITION BY customer_id:
-- Performs the comparison separately for each customer.
--
-- ORDER BY order_date, order_id:
-- Defines the row sequence for comparison.
--
-- LAG(amount, 1, 0):
-- Returns the previous amount, or 0 if no previous row exists.
--
-- Important:
-- The first row in each customer partition has no previous
-- row, so LAG() returns NULL unless a default is specified.
-- ============================================================
