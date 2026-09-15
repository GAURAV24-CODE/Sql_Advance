-- SQL Day 4: AVG()
-- AVG() calculates the average value of a numeric column.


-- 1. Calculate the average transaction amount
SELECT
    AVG(amount) AS average_transaction_amount
FROM transactions;


-- 2. Calculate the average quantity per transaction
SELECT
    AVG(quantity) AS average_quantity
FROM transactions;


-- 3. Calculate the average amount of completed transactions
SELECT
    AVG(amount) AS average_completed_amount
FROM transactions
WHERE transaction_status = 'Completed';


-- 4. Calculate the average amount of pending transactions
SELECT
    AVG(amount) AS average_pending_amount
FROM transactions
WHERE transaction_status = 'Pending';


-- 5. Calculate the average amount of Electronics transactions
SELECT
    AVG(amount) AS average_electronics_amount
FROM transactions
WHERE category = 'Electronics';


-- 6. Calculate the average amount of Furniture transactions
SELECT
    AVG(amount) AS average_furniture_amount
FROM transactions
WHERE category = 'Furniture';


-- 7. Calculate the average transaction amount from Pune
SELECT
    AVG(amount) AS average_pune_amount
FROM transactions
WHERE city = 'Pune';


-- 8. Calculate the average transaction amount for UPI payments
SELECT
    AVG(amount) AS average_upi_amount
FROM transactions
WHERE payment_method = 'UPI';


-- 9. Calculate the average amount for transactions above 50000
SELECT
    AVG(amount) AS average_high_value_amount
FROM transactions
WHERE amount > 50000;


-- 10. Round the average transaction amount to 2 decimal places
SELECT
    ROUND(AVG(amount), 2) AS average_transaction_amount
FROM transactions;


-- 11. Calculate average completed transaction amount
-- and average pending transaction amount together
SELECT
    AVG(
        CASE
            WHEN transaction_status = 'Completed'
            THEN amount
        END
    ) AS average_completed_amount,

    AVG(
        CASE
            WHEN transaction_status = 'Pending'
            THEN amount
        END
    ) AS average_pending_amount
FROM transactions;


-- 12. Calculate average amount for Completed Electronics transactions
SELECT
    AVG(
        CASE
            WHEN transaction_status = 'Completed'
             AND category = 'Electronics'
            THEN amount
        END
    ) AS average_completed_electronics_amount
FROM transactions;


-- 13. Calculate average transaction amount by payment method
SELECT
    payment_method,
    AVG(amount) AS average_amount
FROM transactions
GROUP BY payment_method;


-- 14. Calculate average transaction amount by category
SELECT
    category,
    AVG(amount) AS average_amount
FROM transactions
GROUP BY category;


-- 15. Calculate average amount and total amount together
SELECT
    AVG(amount) AS average_amount,
    SUM(amount) AS total_amount
FROM transactions;


