
-- ============================================================
-- File: 05-Running-Total-and-Cumulative-Sum.sql
-- Topic: Running Total and Cumulative Sum
-- Database: PostgreSQL
-- ============================================================

-- DATASET:
-- orders(order_id, customer_id, order_date, amount)
--
-- Sample records:
-- (1, 101, '2024-01-01', 1000)
-- (2, 101, '2024-01-02', 1500)
-- (3, 101, '2024-01-03', 2000)
-- (4, 102, '2024-01-01', 1200)
-- (5, 102, '2024-02-01', 1800)
-- (6, 103, '2024-02-01', 2500)
-- (7, 103, '2024-04-01', 3000)
-- (8, 104, '2024-04-02', 1000)
-- (9, 104, '2024-04-03', 2200)
-- (10, 102, '2025-01-01', 3500)


-- ============================================================
-- 1. EASY PATTERN
-- Question:
-- Calculate the running total of order amounts by order date.
-- ============================================================

SELECT
    order_id,
    order_date,
    amount,
    SUM(amount) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM orders
ORDER BY order_date, order_id;


-- ============================================================
-- 2. MEDIUM PATTERN
-- Question:
-- Calculate a separate running total for each customer.
-- ============================================================

SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS customer_running_total
FROM orders
ORDER BY customer_id, order_date, order_id;


-- ============================================================
-- 3. HARD PATTERN
-- Question:
-- Calculate the running total and show each order's
-- contribution as a percentage of the running total.
-- ============================================================

SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total,
    ROUND(
        100.0 * amount /
        NULLIF(
            SUM(amount) OVER (
                PARTITION BY customer_id
                ORDER BY order_date, order_id
                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
            ),
            0
        ),
        2
    ) AS percentage_of_running_total
FROM orders
ORDER BY customer_id, order_date, order_id;


-- ============================================================
-- 4. TCS NQT PATTERN
-- Question:
-- Which window function calculates a cumulative total?
--
-- A. COUNT(*) OVER ()
-- B. SUM(amount) OVER (ORDER BY order_date)
-- C. MAX(amount) GROUP BY order_date
-- D. DISTINCT(amount)
--
-- Answer: B
--
-- Practice:
-- Display each order and the cumulative amount across all
-- orders, ordered by date and order ID.
-- ============================================================

SELECT
    order_id,
    order_date,
    amount,
    SUM(amount) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_amount
FROM orders
ORDER BY order_date, order_id;


-- ============================================================
-- 5. ADVANCED INTERVIEW PATTERN
-- Question:
-- Find each customer's first order where their cumulative
-- spending reaches or exceeds 3000.
-- Return only one first qualifying order per customer.
-- ============================================================

WITH customer_totals AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        amount,
        SUM(amount) OVER (
            PARTITION BY customer_id
            ORDER BY order_date, order_id
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS running_total
    FROM orders
),
qualifying_orders AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        amount,
        running_total,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date, order_id
        ) AS qualifying_order_number
    FROM customer_totals
    WHERE running_total >= 3000
)
SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    running_total
FROM qualifying_orders
WHERE qualifying_order_number = 1
ORDER BY customer_id;


-- ============================================================
-- KEY CONCEPTS
--
-- SUM(amount) OVER (...):
-- Calculates a windowed sum without collapsing individual rows.
--
-- PARTITION BY customer_id:
-- Restarts the running total for each customer.
--
-- ORDER BY order_date, order_id:
-- Establishes a deterministic order for calculating totals.
--
-- ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW:
-- Includes all rows from the beginning of the partition
-- through the current row.
--
-- GROUP BY vs. Window Function:
-- GROUP BY combines rows into groups.
-- Window functions preserve individual rows.
-- ============================================================
