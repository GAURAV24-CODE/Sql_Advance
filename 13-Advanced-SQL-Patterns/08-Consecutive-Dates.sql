
-- ============================================================
-- File: 08-FIRST-LAST-VALUE.sql
-- Topic: FIRST_VALUE() and LAST_VALUE()
-- Database: PostgreSQL
-- ============================================================

-- DATASET:
-- employees(employee_id, employee_name, department_id, salary, hire_date)


-- ============================================================
-- 1. EASY PATTERN
-- Question:
-- Find the highest-paid employee's name in each department.
-- Display every employee along with that name.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    FIRST_VALUE(employee_name) OVER (
        PARTITION BY department_id
        ORDER BY salary DESC, employee_id
    ) AS highest_paid_employee
FROM employees
ORDER BY department_id, salary DESC, employee_id;


-- ============================================================
-- 2. MEDIUM PATTERN
-- Question:
-- Display each employee's salary alongside the lowest salary
-- in their department.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    FIRST_VALUE(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary ASC, employee_id
    ) AS department_lowest_salary
FROM employees
ORDER BY department_id, salary, employee_id;


-- ============================================================
-- 3. HARD PATTERN
-- Question:
-- Display each employee alongside the salary of the
-- last employee in their department when ordered by salary.
--
-- The explicit full-partition frame is important:
-- without it, LAST_VALUE() often returns the current row's
-- value or the last value in the current frame.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    LAST_VALUE(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary ASC, employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND UNBOUNDED FOLLOWING
    ) AS department_highest_salary
FROM employees
ORDER BY department_id, salary, employee_id;


-- ============================================================
-- 4. TCS NQT PATTERN
-- Question:
-- Which window function returns the first value in a window?
--
-- A. LAST_VALUE()
-- B. FIRST_VALUE()
-- C. LAG()
-- D. LEAD()
--
-- Answer: B
--
-- Practice:
-- Display each employee's salary and the highest salary
-- in their department.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    FIRST_VALUE(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary DESC, employee_id
    ) AS highest_department_salary
FROM employees
ORDER BY department_id, salary DESC, employee_id;


-- ============================================================
-- 5. ADVANCED INTERVIEW PATTERN
-- Question:
-- Find employees earning the highest salary in each department.
-- Return only the employee rows, including ties.
-- ============================================================

WITH employee_salary_values AS (
    SELECT
        employee_id,
        employee_name,
        department_id,
        salary,
        FIRST_VALUE(salary) OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
            ROWS BETWEEN UNBOUNDED PRECEDING
                     AND UNBOUNDED FOLLOWING
        ) AS highest_salary
    FROM employees
)
SELECT
    employee_id,
    employee_name,
    department_id,
    salary
FROM employee_salary_values
WHERE salary = highest_salary
ORDER BY department_id, employee_id;


-- ============================================================
-- BONUS: FIRST AND LAST HIRE DATE
-- Question:
-- Show the earliest and latest hire dates in each department.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    department_id,
    hire_date,
    FIRST_VALUE(hire_date) OVER (
        PARTITION BY department_id
        ORDER BY hire_date ASC, employee_id
    ) AS earliest_hire_date,
    LAST_VALUE(hire_date) OVER (
        PARTITION BY department_id
        ORDER BY hire_date ASC, employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND UNBOUNDED FOLLOWING
    ) AS latest_hire_date
FROM employees
ORDER BY department_id, hire_date, employee_id;


-- ============================================================
-- KEY CONCEPTS
--
-- FIRST_VALUE():
-- Returns the first value in the current window frame.
--
-- LAST_VALUE():
-- Returns the last value in the current window frame.
--
-- PARTITION BY department_id:
-- Evaluates each department separately.
--
-- ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING:
-- Makes the frame include the entire department partition.
--
-- Important:
-- LAST_VALUE() needs careful frame selection when you want
-- the last value across the entire partition.
-- ============================================================
