
-- ============================================================
-- File: 09-PERCENT-RANK-AND-CUME-DIST.sql
-- Topic: PERCENT_RANK() and CUME_DIST()
-- Database: PostgreSQL
-- ============================================================

-- DATASET:
-- employees(employee_id, employee_name, department_id, salary, hire_date)


-- ============================================================
-- 1. EASY PATTERN
-- Question:
-- Calculate the relative salary rank of every employee
-- across the entire company using PERCENT_RANK().
-- ============================================================

SELECT
    employee_id,
    employee_name,
    salary,
    ROUND(
        CAST(PERCENT_RANK() OVER (ORDER BY salary) AS NUMERIC),
        2
    ) AS percent_rank
FROM employees
ORDER BY salary, employee_id;


-- ============================================================
-- 2. MEDIUM PATTERN
-- Question:
-- Calculate each employee's cumulative salary distribution
-- across the entire company using CUME_DIST().
-- ============================================================

SELECT
    employee_id,
    employee_name,
    salary,
    ROUND(
        CAST(CUME_DIST() OVER (ORDER BY salary) AS NUMERIC),
        2
    ) AS cumulative_distribution
FROM employees
ORDER BY salary, employee_id;


-- ============================================================
-- 3. HARD PATTERN
-- Question:
-- Calculate percentile rank separately for each department.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    ROUND(
        CAST(
            PERCENT_RANK() OVER (
                PARTITION BY department_id
                ORDER BY salary
            ) AS NUMERIC
        ),
        2
    ) AS department_percent_rank
FROM employees
ORDER BY department_id, salary, employee_id;


-- ============================================================
-- 4. TCS NQT PATTERN
-- Question:
-- Which statement about PERCENT_RANK() is correct?
--
-- A. Its values always range from 1 to 100.
-- B. It returns the row count of each group.
-- C. It returns (rank - 1) / (total rows - 1).
-- D. It removes duplicate salary values.
--
-- Answer: C
--
-- Practice:
-- Display employees in ascending salary order with their
-- cumulative distribution.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    salary,
    ROUND(
        CAST(CUME_DIST() OVER (ORDER BY salary) AS NUMERIC),
        2
    ) AS cumulative_distribution
FROM employees
ORDER BY salary, employee_id;


-- ============================================================
-- 5. ADVANCED INTERVIEW PATTERN
-- Question:
-- Find employees whose percentile rank within their
-- department is at least 0.50.
-- ============================================================

WITH salary_percentiles AS (
    SELECT
        employee_id,
        employee_name,
        department_id,
        salary,
        PERCENT_RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary
        ) AS percent_rank
    FROM employees
)
SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    ROUND(CAST(percent_rank AS NUMERIC), 2) AS percent_rank
FROM salary_percentiles
WHERE percent_rank >= 0.50
ORDER BY department_id, salary, employee_id;


-- ============================================================
-- BONUS: COMPARE PERCENT_RANK() AND CUME_DIST()
-- ============================================================

SELECT
    employee_id,
    employee_name,
    salary,
    RANK() OVER (ORDER BY salary) AS salary_rank,
    COUNT(*) OVER () AS total_employees,
    ROUND(
        CAST(PERCENT_RANK() OVER (ORDER BY salary) AS NUMERIC),
        2
    ) AS percent_rank,
    ROUND(
        CAST(CUME_DIST() OVER (ORDER BY salary) AS NUMERIC),
        2
    ) AS cume_dist
FROM employees
ORDER BY salary, employee_id;


-- ============================================================
-- KEY CONCEPTS
--
-- PERCENT_RANK():
-- Formula: (rank - 1) / (total rows - 1)
-- Returns 0 for the first ranked row.
-- Returns 0 when the partition contains only one row.
--
-- CUME_DIST():
-- Returns the fraction of rows whose ordering values are
-- less than or equal to the current row's ordering value.
-- Its result is greater than 0 and at most 1.
--
-- PARTITION BY department_id:
-- Calculates the distribution separately for each department.
--
-- Important:
-- Tied salaries receive the same PERCENT_RANK() and CUME_DIST()
-- values when salary is the only window ORDER BY expression.
-- ============================================================
