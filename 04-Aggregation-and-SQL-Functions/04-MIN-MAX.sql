-- SQL Day 4: MIN() and MAX()
-- MIN() returns the smallest value.
-- MAX() returns the largest value.


-- 1. Find the minimum transaction amount
SELECT
    MIN(amount) AS minimum_amount
FROM transactions;


-- 2. Find the maximum transaction amount
SELECT
    MAX(amount) AS maximum_amount
FROM transactions;


-- 3. Find minimum and maximum amount together
SELECT
    MIN(amount) AS minimum_amount,
    MAX(amount) AS maximum_amount
FROM transactions;


-- 4. Find the minimum completed transaction amount
SELECT
    MIN(amount) AS minimum_completed_amount
FROM transactions
WHERE transaction_status = 'Completed';


-- 5. Find the maximum completed transaction amount
SELECT
    MAX(amount) AS maximum_completed_amount
FROM transactions
WHERE transaction_status = 'Completed';


-- 6. Find the minimum Electronics transaction amount
SELECT
    MIN(amount) AS minimum_electronics_amount
FROM transactions
WHERE category = 'Electronics';


-- 7. Find the maximum Electronics transaction amount
SELECT
    MAX(amount) AS maximum_electronics_amount
FROM transactions
WHERE category = 'Electronics';


-- 8. Find minimum and maximum quantity
SELECT
    MIN(quantity) AS minimum_quantity,
    MAX(quantity) AS maximum_quantity
FROM transactions;


-- 9. Find minimum and maximum amount by category
SELECT
    category,
    MIN(amount) AS minimum_amount,
    MAX(amount) AS maximum_amount
FROM transactions
GROUP BY category;


-- 10. Find minimum and maximum amount by city
SELECT
    city,
    MIN(amount) AS minimum_amount,
    MAX(amount) AS maximum_amount
FROM transactions
GROUP BY city;


-- 11. Find the price range of transactions
SELECT
    MAX(amount) - MIN(amount) AS amount_range
FROM transactions;


-- 12. Find minimum and maximum amount for UPI payments
SELECT
    MIN(amount) AS minimum_upi_amount,
    MAX(amount) AS maximum_upi_amount
FROM transactions
WHERE payment_method = 'UPI';


-- 13. Find minimum and maximum amount for completed Electronics transactions
SELECT
    MIN(amount) AS minimum_amount,
    MAX(amount) AS maximum_amount
FROM transactions
WHERE transaction_status = 'Completed'
  AND category = 'Electronics';


-- 14. Find minimum and maximum transaction amount for each status
SELECT
    transaction_status,
    MIN(amount) AS minimum_amount,
    MAX(amount) AS maximum_amount
FROM transactions
GROUP BY transaction_status;


-- 15. Compare MIN, MAX, AVG, and SUM
SELECT
    MIN(amount) AS minimum_amount,
    MAX(amount) AS maximum_amount,
    AVG(amount) AS average_amount,
    SUM(amount) AS total_amount
FROM transactions;
