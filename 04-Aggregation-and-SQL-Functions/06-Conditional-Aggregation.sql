-- SQL Day 4: Conditional Aggregation
-- Conditional aggregation combines aggregate functions
-- such as COUNT() or SUM() with CASE WHEN.
--
-- It is used to calculate multiple business metrics
-- in a single query.


-- 1. Count completed transactions
SELECT
    SUM(
        CASE
            WHEN transaction_status = 'Completed' THEN 1
            ELSE 0
        END
    ) AS completed_transactions
FROM transactions;


-- 2. Count pending transactions
SELECT
    SUM(
        CASE
            WHEN transaction_status = 'Pending' THEN 1
            ELSE 0
        END
    ) AS pending_transactions
FROM transactions;


-- 3. Count cancelled transactions
SELECT
    SUM(
        CASE
            WHEN transaction_status = 'Cancelled' THEN 1
            ELSE 0
        END
    ) AS cancelled_transactions
FROM transactions;


-- 4. Count completed, pending, and cancelled transactions
-- in one query
SELECT
    SUM(CASE
        WHEN transaction_status = 'Completed' THEN 1
        ELSE 0
    END) AS completed_transactions,

    SUM(CASE
        WHEN transaction_status = 'Pending' THEN 1
        ELSE 0
    END) AS pending_transactions,

    SUM(CASE
        WHEN transaction_status = 'Cancelled' THEN 1
        ELSE 0
    END) AS cancelled_transactions
FROM transactions;


-- 5. Calculate completed revenue
SELECT
    SUM(
        CASE
            WHEN transaction_status = 'Completed'
            THEN amount
            ELSE 0
        END
    ) AS completed_revenue
FROM transactions;


-- 6. Calculate pending revenue
SELECT
    SUM(
        CASE
            WHEN transaction_status = 'Pending'
            THEN amount
            ELSE 0
        END
    ) AS pending_revenue
FROM transactions;


-- 7. Calculate completed and pending revenue together
SELECT
    SUM(CASE
        WHEN transaction_status = 'Completed'
        THEN amount
        ELSE 0
    END) AS completed_revenue,

    SUM(CASE
        WHEN transaction_status = 'Pending'
        THEN amount
        ELSE 0
    END) AS pending_revenue
FROM transactions;


-- 8. Calculate Electronics and Furniture revenue
SELECT
    SUM(CASE
        WHEN category = 'Electronics'
        THEN amount
        ELSE 0
    END) AS electronics_revenue,

    SUM(CASE
        WHEN category = 'Furniture'
        THEN amount
        ELSE 0
    END) AS furniture_revenue
FROM transactions;


-- 9. Count transactions by payment method
SELECT
    SUM(CASE
        WHEN payment_method = 'UPI' THEN 1
        ELSE 0
    END) AS upi_transactions,

    SUM(CASE
        WHEN payment_method = 'Card' THEN 1
        ELSE 0
    END) AS card_transactions,

    SUM(CASE
        WHEN payment_method = 'Cash' THEN 1
        ELSE 0
    END) AS cash_transactions
FROM transactions;


-- 10. Calculate completed revenue by payment method
SELECT
    SUM(CASE
        WHEN payment_method = 'UPI'
         AND transaction_status = 'Completed'
        THEN amount
        ELSE 0
    END) AS completed_upi_revenue,

    SUM(CASE
        WHEN payment_method = 'Card'
         AND transaction_status = 'Completed'
        THEN amount
        ELSE 0
    END) AS completed_card_revenue,

    SUM(CASE
        WHEN payment_method = 'Cash'
         AND transaction_status = 'Completed'
        THEN amount
        ELSE 0
    END) AS completed_cash_revenue
FROM transactions;


-- 11. Count high-value and low-value transactions
SELECT
    SUM(CASE
        WHEN amount >= 50000 THEN 1
        ELSE 0
    END) AS high_value_transactions,

    SUM(CASE
        WHEN amount < 50000 THEN 1
        ELSE 0
    END) AS low_value_transactions
FROM transactions;


-- 12. Calculate high-value transaction revenue
SELECT
    SUM(
        CASE
            WHEN amount >= 50000
            THEN amount
            ELSE 0
        END
    ) AS high_value_revenue
FROM transactions;


-- 13. Calculate completed Electronics revenue
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


-- 14. Count completed transactions by category
SELECT
    category,

    SUM(CASE
        WHEN transaction_status = 'Completed'
        THEN 1
        ELSE 0
    END) AS completed_transactions

FROM transactions
GROUP BY category;


-- 15. Create a complete business summary
SELECT
    COUNT(*) AS total_transactions,

    SUM(CASE
        WHEN transaction_status = 'Completed'
        THEN 1
        ELSE 0
    END) AS completed_transactions,

    SUM(CASE
        WHEN transaction_status = 'Pending'
        THEN 1
        ELSE 0
    END) AS pending_transactions,

    SUM(CASE
        WHEN transaction_status = 'Cancelled'
        THEN 1
        ELSE 0
    END) AS cancelled_transactions,

    SUM(amount) AS total_revenue,

    SUM(CASE
        WHEN transaction_status = 'Completed'
        THEN amount
        ELSE 0
    END) AS completed_revenue,

    SUM(CASE
        WHEN transaction_status = 'Pending'
        THEN amount
        ELSE 0
    END) AS pending_revenue

FROM transactions;

