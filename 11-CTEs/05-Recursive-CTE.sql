/*
=========================================================
File: 05-Recursive-CTE.sql
Section: 11 - CTEs
Database: PostgreSQL

Topics:
1. Recursive CTE fundamentals
2. Anchor and recursive terms
3. Generate number sequences
4. Generate even and odd numbers
5. Calculate running totals
6. Generate date sequences
7. Build hierarchical employee data
8. Prevent unlimited recursion
=========================================================
*/


-- ======================================================
-- Example 1: Generate numbers from 1 to 10
-- ======================================================

WITH RECURSIVE number_sequence AS (
    -- Anchor query
    SELECT 1 AS number

    UNION ALL

    -- Recursive query
    SELECT number + 1
    FROM number_sequence
    WHERE number < 10
)
SELECT number
FROM number_sequence
ORDER BY number;


-- ======================================================
-- Example 2: Generate numbers from 1 to 20
-- ======================================================

WITH RECURSIVE number_sequence AS (
    SELECT 1 AS number

    UNION ALL

    SELECT number + 1
    FROM number_sequence
    WHERE number < 20
)
SELECT number
FROM number_sequence
ORDER BY number;


-- ======================================================
-- Example 3: Generate even numbers from 2 to 20
-- ======================================================

WITH RECURSIVE even_numbers AS (
    SELECT 2 AS number

    UNION ALL

    SELECT number + 2
    FROM even_numbers
    WHERE number < 20
)
SELECT number
FROM even_numbers
ORDER BY number;


-- ======================================================
-- Example 4: Generate odd numbers from 1 to 19
-- ======================================================

WITH RECURSIVE odd_numbers AS (
    SELECT 1 AS number

    UNION ALL

    SELECT number + 2
    FROM odd_numbers
    WHERE number < 19
)
SELECT number
FROM odd_numbers
ORDER BY number;


-- ======================================================
-- Example 5: Generate numbers from 1 to 10 and
-- calculate a running total
-- ======================================================

WITH RECURSIVE running_totals AS (
    -- Anchor query
    SELECT
        1 AS number,
        1 AS running_total

    UNION ALL

    -- Recursive query
    SELECT
        number + 1,
        running_total + number + 1
    FROM running_totals
    WHERE number < 10
)
SELECT
    number,
    running_total
FROM running_totals
ORDER BY number;


-- ======================================================
-- Example 6: Generate a date sequence
-- from 2026-01-01 to 2026-01-07
-- ======================================================

WITH RECURSIVE date_sequence AS (
    SELECT DATE '2026-01-01' AS calendar_date

    UNION ALL

    SELECT calendar_date + 1
    FROM date_sequence
    WHERE calendar_date < DATE '2026-01-07'
)
SELECT calendar_date
FROM date_sequence
ORDER BY calendar_date;


-- ======================================================
-- Example 7: Generate the first 12 months of 2026
-- ======================================================

WITH RECURSIVE month_sequence AS (
    SELECT DATE '2026-01-01' AS month_start

    UNION ALL

    SELECT (month_start + INTERVAL '1 month')::DATE
    FROM month_sequence
    WHERE month_start < DATE '2026-12-01'
)
SELECT month_start
FROM month_sequence
ORDER BY month_start;


-- ======================================================
-- Example 8: Create sample employee hierarchy
-- This example is independent of the existing employees
-- table. It uses a temporary table.
-- ======================================================

CREATE TEMP TABLE IF NOT EXISTS employee_hierarchy (
    employee_id INTEGER PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    manager_id INTEGER
);

TRUNCATE TABLE employee_hierarchy;

INSERT INTO employee_hierarchy (
    employee_id,
    employee_name,
    manager_id
)
VALUES
    (1, 'Amit', NULL),
    (2, 'Priya', 1),
    (3, 'Rahul', 1),
    (4, 'Sneha', 2),
    (5, 'Vikram', 2),
    (6, 'Neha', 3);


-- ======================================================
-- Example 9: Display the employee hierarchy
-- starting from the top-level employee
-- ======================================================

WITH RECURSIVE employee_tree AS (
    -- Anchor: employee with no manager
    SELECT
        employee_id,
        employee_name,
        manager_id,
        1 AS hierarchy_level,
        employee_name::TEXT AS hierarchy_path
    FROM employee_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive term: find direct reports
    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        et.hierarchy_level + 1,
        et.hierarchy_path || ' -> ' || e.employee_name
    FROM employee_hierarchy AS e
    INNER JOIN employee_tree AS et
        ON e.manager_id = et.employee_id
)
SELECT
    employee_id,
    employee_name,
    manager_id,
    hierarchy_level,
    hierarchy_path
FROM employee_tree
ORDER BY hierarchy_level, employee_id;