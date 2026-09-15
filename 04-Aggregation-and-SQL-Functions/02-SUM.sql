-- SQL Day 4: SUM()
-- SUM() calculates the total of a numeric column.

-- 1. Calculate total transaction amount
SELECT
    SUM(amount) AS total_amount
FROM transactions;


-- 2. Calculate total quantity sold
SELECT
    SUM(quantity) AS total_quantity
FROM transactions;


-- 3. Calculate total amount from completed transactions
SELECT
    SUM(amount) AS completed_revenue
FROM transactions
WHERE transaction_status = 'Completed';


-- 4. Calculate total amount from pending transactions
SELECT
    SUM(amount) AS pending_amount
FROM transactions
WHERE transaction_status = 'Pending';


-- 5. Calculate total amount from cancelled transactions
SELECT
    SUM(amount) AS cancelled_amount
FROM transactions
WHERE transaction_status = 'Cancelled';


-- 6. Calculate total revenue from Electronics
SELECT
    SUM(amount) AS electronics_revenue
FROM transactions
WHERE category = 'Electronics';


-- 7. Calculate total revenue from Furniture
SELECT
    SUM(amount) AS furniture_revenue
FROM transactions
WHERE category = 'Furniture';


-- 8. Calculate total revenue from UPI transactions
SELECT
    SUM(amount) AS upi_revenue
FROM transactions
WHERE payment_method = 'UPI';


-- 9. Calculate total revenue from Pune
SELECT
    SUM(amount) AS pune_revenue
FROM transactions
WHERE city = 'Pune';


-- 10. Calculate total revenue from transactions above 50000
SELECT
    SUM(amount) AS high_value_revenue
FROM transactions
WHERE amount > 50000;


-- 11. Calculate total quantity for Electronics
SELECT
    SUM(quantity) AS electronics_quantity
FROM transactions
WHERE category = 'Electronics';


-- 12. Calculate total completed revenue using CASE WHEN
SELECT
    SUM(
        CASE
            WHEN transaction_status = 'Completed'
            THEN amount
            ELSE 0
        END
    ) AS completed_revenue
FROM transactions;


-- 13. Calculate revenue for Completed Electronics transactions
SELECT
    SUM(
        CASE
            WHEN transaction_status = 'Completed'
             AND category = 'Electronics'
            THEN amount
            ELSE 0
        END
    ) AS completed_electronics_revenue
FROM transactions;


-- 14. Calculate total revenue using multiple conditions
SELECT
    SUM(
        CASE
            WHEN payment_method = 'UPI'
             AND transaction_status = 'Completed'
            THEN amount
            ELSE 0
        END
    ) AS completed_upi_revenue
FROM transactions;


-- 15. Calculate total revenue and total quantity together
SELECT
    SUM(amount) AS total_revenue,
    SUM(quantity) AS total_quantity
FROM transactions;

