
-- ============================================================
-- File: 06-Moving-Average.sql
-- Topic: Moving Average and Rolling Average
-- Database: PostgreSQL
-- ============================================================

-- DATASET:
-- orders(order_id, customer_id, order_date, amount)


-- ============================================================
-- 1. EASY PATTERN
-- Question:
-- Calculate the average order amount across all orders.
-- Display each order with the overall average.
-- ============================================================

SELECT
    order_id,
    order_date,
    amount,
    ROUND(AVG(amount) OVER (), 2) AS overall_average
FROM orders
ORDER BY order_date, order_id;


-- ============================================================
-- 2. MEDIUM PATTERN
-- Question:
-- Calculate a 3-row moving average of order amounts.
-- Include the current row and the previous two rows.
-- ============================================================

SELECT
    order_id,
    order_date,
    amount,
    ROUND(
        AVG(amount) OVER (
            ORDER BY order_date, order_id
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS moving_average
FROM orders
ORDER BY order_date, order_id;


-- ============================================================
-- 3. HARD PATTERN
-- Question:
-- Calculate a 3-order moving average separately for each
-- customer, ordered by date and order ID.
-- ============================================================

SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    ROUND(
        AVG(amount) OVER (
            PARTITION BY customer_id
            ORDER BY order_date, order_id
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS customer_moving_average
FROM orders
ORDER BY customer_id, order_date, order_id;


-- ============================================================
-- 4. TCS NQT PATTERN
-- Question:
-- Which window frame calculates the average of the current
-- row and the two preceding rows?
--
-- A. ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
-- B. ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
-- C. ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
-- D. PARTITION BY order_id
--
-- Answer: A
--
-- Practice:
-- Display each order and its 2-row moving average, using
-- the current order and the immediately preceding order.
-- ============================================================

SELECT
    order_id,
    order_date,
    amount,
    ROUND(
        AVG(amount) OVER (
            ORDER BY order_date, order_id
            ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS two_row_moving_average
FROM orders
ORDER BY order_date, order_id;


-- ============================================================
-- 5. ADVANCED INTERVIEW PATTERN
-- Question:
-- Find orders whose amount is greater than the 3-row moving
-- average calculated up to and including that order.
-- ============================================================

WITH moving_averages AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        amount,
        AVG(amount) OVER (
            ORDER BY order_date, order_id
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS moving_average
    FROM orders
)
SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    ROUND(moving_average, 2) AS moving_average
FROM moving_averages
WHERE amount > moving_average
ORDER BY order_date, order_id;


-- ============================================================
-- KEY CONCEPTS
--
-- AVG(amount) OVER ():
-- Calculates an overall average while preserving every row.
--
-- ROWS BETWEEN 1 PRECEDING AND CURRENT ROW:
-- Uses the current row and one preceding row.
--
-- ROWS BETWEEN 2 PRECEDING AND CURRENT ROW:
-- Uses up to three rows, including the current row.
--
-- PARTITION BY customer_id:
-- Calculates separate moving averages for each customer.
--
-- Important:
-- AVG ignores NULL values. At the beginning of a partition,
-- the moving average uses only the available preceding rows.
-- ============================================================
