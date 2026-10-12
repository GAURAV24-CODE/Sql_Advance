
-- =====================================================
-- DAY 13: ADVANCED SQL PATTERNS
-- FILE: 03-Top-N.sql
-- DATABASE: PostgreSQL
-- TOPIC: TOP N RECORDS
-- =====================================================


-- =====================================================
-- 1. EASY PATTERN
-- Q1. Find the top 3 highest-paid employees.
-- =====================================================

SELECT employee_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- Expected: Amit (90000), Priya (80000), Rahul (80000)
-- LIMIT 3 returns exactly three rows.
-- Ties may mean some equally paid employees are excluded.


-- =====================================================
-- 2. MEDIUM PATTERN
-- Q2. Find the top 3 DISTINCT salaries.
-- =====================================================

SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- Expected:
-- 90000
-- 80000
-- 70000
-- DISTINCT removes duplicate salary values.


-- =====================================================
-- 3. HARD PATTERN
-- Q3. Find the top 3 salary ranks,
-- including every employee tied at those ranks.
-- =====================================================

WITH ranked_employees AS (
    SELECT
        employee_name,
        salary,
        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT employee_name, salary, salary_rank
FROM ranked_employees
WHERE salary_rank <= 3
ORDER BY salary DESC, employee_name;

-- Expected salary ranks:
-- Rank 1: Amit - 90000
-- Rank 2: Priya and Rahul - 80000
-- Rank 3: Karan - 70000
-- DENSE_RANK includes ties without skipping ranks.


-- =====================================================
-- 4. TCS NQT PATTERN
-- Q4. Salaries are 90000, 80000, 80000, 70000.
-- What does this query return?
--
-- SELECT DISTINCT salary
-- FROM employees
-- ORDER BY salary DESC
-- LIMIT 2;
--
-- A) 90000, 80000
-- B) 90000, 80000, 80000
-- C) 80000, 70000
-- D) 90000, 80000, 70000
--
-- ANSWER: A) 90000, 80000


-- Q5. Which function returns a unique row number
-- for every employee?
--
-- A) RANK()
-- B) DENSE_RANK()
-- C) ROW_NUMBER()
-- D) AVG()
--
-- ANSWER: C) ROW_NUMBER()


-- Q6. Find the top 2 employees by salary.
-- If salaries tie, employee_id breaks the tie.

SELECT employee_id, employee_name, salary
FROM employees
ORDER BY salary DESC, employee_id ASC
LIMIT 2;

-- Expected:
-- Amit - 90000
-- Priya - 80000
-- Employee ID makes the ordering deterministic.


-- =====================================================
-- 5. ADVANCED INTERVIEW PATTERN
-- Q7. Find the top 2 highest-paid employees
-- in each department, including salary ties.
-- =====================================================

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
SELECT employee_name, department_id, salary, salary_rank
FROM ranked_employees
WHERE salary_rank <= 2
ORDER BY department_id, salary DESC, employee_name;

-- Explanation:
-- PARTITION BY creates a separate ranking per department.
-- DENSE_RANK assigns equal salaries the same rank.
-- salary_rank <= 2 includes the top two salary levels.
-- Ties can cause more than two employees per department.


-- Q8. Find the top 3 employees using ROW_NUMBER().
-- Always return at most 3 rows.

WITH numbered_employees AS (
    SELECT
        employee_id,
        employee_name,
        salary,
        ROW_NUMBER() OVER (
            ORDER BY salary DESC, employee_id ASC
        ) AS row_num
    FROM employees
)
SELECT employee_id, employee_name, salary
FROM numbered_employees
WHERE row_num <= 3
ORDER BY row_num;

-- Expected:
-- Amit - 90000
-- Priya - 80000
-- Rahul - 80000
-- ROW_NUMBER returns exactly one number per row.
-- employee_id breaks ties consistently.


-- END OF FILE
