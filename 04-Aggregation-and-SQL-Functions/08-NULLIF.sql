-- SQL Day 4: NULLIF()
-- NULLIF() compares two expressions.
--
-- Syntax:
-- NULLIF(value1, value2)
--
-- If value1 = value2 -> returns NULL
-- If value1 <> value2 -> returns value1


-- 1. Basic NULLIF example
SELECT
    NULLIF(100, 100) AS result;


-- 2. NULLIF with different values
SELECT
    NULLIF(100, 200) AS result;


-- 3. Convert zero to NULL
SELECT
    NULLIF(0, 0) AS result;


-- 4. Keep non-zero value
SELECT
    NULLIF(100, 0) AS result;


-- 5. Prevent division by zero
-- NULLIF changes 0 to NULL, so the division does not
-- attempt to divide by zero.
SELECT
    100 / NULLIF(0, 0) AS safe_division;


-- 6. Calculate average amount safely
-- Total amount / number of transactions
SELECT
    SUM(amount) / NULLIF(COUNT(*), 0) AS average_amount
FROM transactions;


-- 7. Calculate revenue per quantity safely
SELECT
    SUM(amount) / NULLIF(SUM(quantity), 0) AS revenue_per_unit
FROM transactions;


-- 8. Calculate completed revenue per completed transaction
SELECT
    SUM(
        CASE
            WHEN transaction_status = 'Completed'
            THEN amount
            ELSE 0
        END
    )
    /
    NULLIF(
        COUNT(
            CASE
                WHEN transaction_status = 'Completed'
                THEN 1
            END
        ),
        0
    ) AS average_completed_transaction
FROM transactions;


-- 9. Calculate revenue per customer safely
SELECT
    SUM(amount)
    /
    NULLIF(COUNT(DISTINCT customer_name), 0)
    AS revenue_per_customer
FROM transactions;


-- 10. Calculate average Electronics transaction safely
SELECT
    SUM(
        CASE
            WHEN category = 'Electronics'
            THEN amount
            ELSE 0
        END
    )
    /
    NULLIF(
        COUNT(
            CASE
                WHEN category = 'Electronics'
                THEN 1
            END
        ),
        0
    ) AS average_electronics_transaction
FROM transactions;


-- 11. NULLIF can identify placeholder values
-- Here, an empty string becomes NULL.
SELECT
    NULLIF('', '') AS cleaned_value;


-- 12. NULLIF with transaction status
SELECT
    transaction_id,
    NULLIF(transaction_status, 'Cancelled') AS active_status
FROM transactions;


-- 13. NULLIF combined with COALESCE
-- NULLIF converts 0 to NULL.
-- COALESCE then converts NULL back to 0.
SELECT
    COALESCE(
        NULLIF(0, 0),
        0
    ) AS safe_value;


-- 14. Calculate average completed revenue with
-- NULLIF and COALESCE
SELECT
    COALESCE(
        SUM(
            CASE
                WHEN transaction_status = 'Completed'
                THEN amount
                ELSE 0
            END
        )
        /
        NULLIF(
            COUNT(
                CASE
                    WHEN transaction_status = 'Completed'
                    THEN 1
                END
            ),
            0
        ),
        0
    ) AS average_completed_transaction
FROM transactions;


-- 15. Business KPI: revenue per transaction
SELECT
    COALESCE(
        SUM(amount) / NULLIF(COUNT(*), 0),
        0
    ) AS revenue_per_transaction
FROM transactions;

