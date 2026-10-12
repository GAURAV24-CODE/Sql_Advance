
-- =====================================================
-- DAY 13: ADVANCED SQL PATTERNS
-- FILE: 02-Nth-Highest-Salary.sql
-- TOPIC: Nth-Highest Salary
-- DATABASE: PostgreSQL
-- =====================================================


-- =====================================================
-- 1. EASY PATTERN
-- Q1. Find the third-highest DISTINCT salary.
-- =====================================================

SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
OFFSET 2
LIMIT 1;

-- Explanation:
-- DISTINCT removes duplicate salaries.
-- DESC sorts salaries from highest to lowest.
-- OFFSET 2 skips the first two distinct salaries.
-- LIMIT 1 returns the third-highest salary.
-- Expected answer: 70000


-- =====================================================
-- 2. MEDIUM PATTERN
-- Q2. Find the Nth-highest DISTINCT salary
-- using a subquery. Here, N = 3.
-- =====================================================

SELECT MAX(salary) AS nth_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
        WHERE salary < (
            SELECT MAX(salary)
            FROM employees
        )
    )
);

-- Expected answer: 70000
-- This nested query finds the third-highest salary.
-- This pattern is suitable for a fixed N = 3.


-- =====================================================
-- 3. HARD PATTERN
-- Q3. Find the Nth-highest DISTINCT salary
-- using DENSE_RANK().
-- =====================================================

WITH ranked_salaries AS (
    SELECT DISTINCT
        salary,
        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT salary
FROM ranked_salaries
WHERE salary_rank = 3;

-- Expected answer: 70000
-- Change 3 to any positive N to get another rank.


-- =====================================================
-- 4. TCS NQT PATTERN
-- Q4. Salaries are:
-- 90000, 80000, 80000, 70000, 60000.
-- What is the third-highest DISTINCT salary?
--
-- A) 90000
-- B) 80000
-- C) 70000
-- D) 60000
--
-- ANSWER: C) 70000
--
-- Q5. What does DENSE_RANK() return for:
-- 90000, 80000, 80000, 70000?
--
-- A) 1, 2, 2, 3
-- B) 1, 2, 3, 4
-- C) 1, 1, 2, 3
-- D) 4, 3, 2, 1
--
-- ANSWER: A) 1, 2, 2, 3
--
-- Q6. Which function is best for finding
-- the Nth-highest DISTINCT salary?
--
-- A) COUNT()
-- B) DENSE_RANK()
-- C) SUM()
-- D) CONCAT()
--
-- ANSWER: B) DENSE_RANK()


-- =====================================================
-- 5. ADVANCED INTERVIEW PATTERN
-- Q7. Find the Nth-highest DISTINCT salary
-- using a parameter-like value.
-- Change n_value to choose the rank.
-- =====================================================

WITH parameters AS (
    SELECT 3 AS n_value
),
ranked_salaries AS (
    SELECT DISTINCT
        salary,
        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT r.salary AS nth_highest_salary
FROM ranked_salaries AS r
CROSS JOIN parameters AS p
WHERE r.salary_rank = p.n_value;

-- Expected answer: 70000
-- Change 3 to 2 for the second-highest salary.
-- Change 3 to 4 for the fourth-highest salary.
-- If that rank does not exist, no rows are returned.


-- Q8. Find the Nth-highest salary in each department.
-- Here, N = 2.

WITH ranked_employees AS (
    SELECT
        employee_name,
        department_id,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT employee_name, department_id, salary
FROM ranked_employees
WHERE salary_rank = 2
ORDER BY department_id, employee_name;

-- Expected results:
-- IT: Priya and Rahul, 80000
-- HR: Sneha, 50000
-- Sales: Pooja, 60000
--
-- PARTITION BY ranks salaries separately
-- within each department.


-- END OF FILE
