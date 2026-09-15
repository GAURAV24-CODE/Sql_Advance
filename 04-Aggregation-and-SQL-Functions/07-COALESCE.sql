-- SQL Day 4: COALESCE()
-- COALESCE() returns the first non-NULL value.
--
-- Syntax:
-- COALESCE(value1, value2, value3, ...)
--
-- If value1 is NULL, SQL checks value2, then value3, and so on.


-- 1. Basic COALESCE example
SELECT
    COALESCE(NULL, 100) AS result;


-- 2. Return a default value when amount is NULL
SELECT
    transaction_id,
    customer_name,
    COALESCE(amount, 0) AS amount
FROM transactions;


-- 3. Replace NULL payment method with 'Unknown'
SELECT
    transaction_id,
    customer_name,
    COALESCE(payment_method, 'Unknown') AS payment_method
FROM transactions;


-- 4. Replace NULL transaction status with 'Unknown'
SELECT
    transaction_id,
    customer_name,
    COALESCE(transaction_status, 'Unknown') AS transaction_status
FROM transactions;


-- 5. Replace NULL product with 'Not Available'
SELECT
    transaction_id,
    COALESCE(product, 'Not Available') AS product
FROM transactions;


-- 6. Use COALESCE with SUM()
-- SUM() can return NULL when there are no matching rows.
SELECT
    COALESCE(
        SUM(amount),
        0
    ) AS completed_revenue
FROM transactions
WHERE transaction_status = 'Refunded';


-- 7. Use COALESCE with AVG()
SELECT
    COALESCE(
        AVG(amount),
        0
    ) AS average_refunded_amount
FROM transactions
WHERE transaction_status = 'Refunded';


-- 8. Use COALESCE with COUNT()
-- COUNT() normally returns 0 when no rows match.
SELECT
    COALESCE(
        COUNT(*),
        0
    ) AS refunded_transactions
FROM transactions
WHERE transaction_status = 'Refunded';


-- 9. Multiple fallback values
SELECT
    COALESCE(
        NULL,
        NULL,
        'Default Value'
    ) AS result;


-- 10. COALESCE with multiple columns
-- Returns the first available non-NULL value.
SELECT
    transaction_id,
    COALESCE(
        payment_method,
        transaction_status,
        product,
        'Unknown'
    ) AS first_available_value
FROM transactions;


-- 11. Calculate revenue safely when no matching records exist
SELECT
    COALESCE(
        SUM(
            CASE
                WHEN transaction_status = 'Refunded'
                THEN amount
                ELSE NULL
            END
        ),
        0
    ) AS refunded_revenue
FROM transactions;


-- 12. Use COALESCE with CASE WHEN
SELECT
    transaction_id,
    COALESCE(
        CASE
            WHEN amount >= 50000 THEN 'High Value'
            WHEN amount >= 20000 THEN 'Medium Value'
            ELSE 'Low Value'
        END,
        'Unknown'
    ) AS transaction_value_category
FROM transactions;


-- 13. Category-wise revenue with COALESCE
SELECT
    category,
    COALESCE(
        SUM(amount),
        0
    ) AS total_revenue
FROM transactions
GROUP BY category;


-- 14. City-wise revenue with COALESCE
SELECT
    city,
    COALESCE(
        SUM(amount),
        0
    ) AS total_revenue
FROM transactions
GROUP BY city;


-- 15. Business summary using COALESCE
SELECT
    COALESCE(SUM(amount), 0) AS total_revenue,

    COALESCE(
        SUM(
            CASE
                WHEN transaction_status = 'Completed'
                THEN amount
                ELSE 0
            END
        ),
        0
    ) AS completed_revenue,

    COALESCE(
        SUM(
            CASE
                WHEN transaction_status = 'Pending'
                THEN amount
                ELSE 0
            END
        ),
        0
    ) AS pending_revenue

FROM transactions;

