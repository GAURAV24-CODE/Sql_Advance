-- SQL Day 4: COUNT()
-- COUNT() is used to count rows or non-NULL values.

-- 1. Count all transactions
SELECT
    COUNT(*) AS total_transactions
FROM transactions;


-- 2. Count transaction IDs
SELECT
    COUNT(transaction_id) AS transaction_count
FROM transactions;


-- 3. Count completed transactions
SELECT
    COUNT(*) AS completed_transactions
FROM transactions
WHERE transaction_status = 'Completed';


-- 4. Count pending transactions
SELECT
    COUNT(*) AS pending_transactions
FROM transactions
WHERE transaction_status = 'Pending';


-- 5. Count cancelled transactions
SELECT
    COUNT(*) AS cancelled_transactions
FROM transactions
WHERE transaction_status = 'Cancelled';


-- 6. Count transactions from Pune
SELECT
    COUNT(*) AS pune_transactions
FROM transactions
WHERE city = 'Pune';


-- 7. Count Electronics transactions
SELECT
    COUNT(*) AS electronics_transactions
FROM transactions
WHERE category = 'Electronics';


-- 8. Count UPI transactions
SELECT
    COUNT(*) AS upi_transactions
FROM transactions
WHERE payment_method = 'UPI';


-- 9. Count transactions with amount greater than 50000
SELECT
    COUNT(*) AS high_value_transactions
FROM transactions
WHERE amount > 50000;


-- 10. Count transactions with quantity greater than 2
SELECT
    COUNT(*) AS bulk_transactions
FROM transactions
WHERE quantity > 2;


