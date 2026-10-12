
-- ============================================================
-- File: 11-Conditional-Aggregation.sql
-- Topic: Conditional Aggregation using CASE WHEN
-- Database: PostgreSQL
-- ============================================================

-- DATASET:
-- employees(employee_id, employee_name, department_id, salary, hire_date)
-- departments(department_id, department_name)


-- ============================================================
-- 1. EASY PATTERN
-- Question:
-- Count how many employees earn more than 60000 and how
-- many earn 60000 or less.
-- ============================================================

SELECT
    COUNT(*) FILTER (WHERE salary > 60000) AS employees_above_60000,
    COUNT(*) FILTER (WHERE salary <= 60000) AS employees_at_or_below_60000
FROM employees;


-- ============================================================
-- 2. MEDIUM PATTERN
-- Question:
-- Count high-paid employees (salary >= 70000) and
-- other employees in each department using CASE WHEN.
-- ============================================================

SELECT
    department_id,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN salary >= 70000 THEN 1
            ELSE 0
        END
    ) AS high_paid_employees,
    SUM(
        CASE
            WHEN salary < 70000 THEN 1
            ELSE 0
        END
    ) AS other_employees
FROM employees
GROUP BY department_id
ORDER BY department_id;


-- ============================================================
-- 3. HARD PATTERN
-- Question:
-- Show each department's total payroll, payroll for
-- employees earning >= 70000, and payroll for employees
-- earning < 70000.
-- ============================================================

SELECT
    d.department_id,
    d.department_name,
    SUM(e.salary) AS total_payroll,
    SUM(
        CASE
            WHEN e.salary >= 70000 THEN e.salary
            ELSE 0
        END
    ) AS high_salary_payroll,
    SUM(
        CASE
            WHEN e.salary < 70000 THEN e.salary
            ELSE 0
        END
    ) AS lower_salary_payroll
FROM departments AS d
JOIN employees AS e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY d.department_id;


-- ============================================================
-- 4. TCS NQT PATTERN
-- Question:
-- What does this expression calculate?
--
-- SUM(CASE WHEN salary >= 70000 THEN 1 ELSE 0 END)
--
-- A. Total salary of all employees
-- B. Number of employees earning >= 70000
-- C. Highest salary
-- D. Number of departments
--
-- Answer: B
--
-- Practice:
-- Count employees earning >= 70000 in each department.
-- ============================================================

SELECT
    department_id,
    SUM(
        CASE
            WHEN salary >= 70000 THEN 1
            ELSE 0
        END
    ) AS employees_earning_70000_or_more
FROM employees
GROUP BY department_id
ORDER BY department_id;


-- ============================================================
-- 5. ADVANCED INTERVIEW PATTERN
-- Question:
-- Display every department, total employees, high-paid
-- employee count, and the percentage of high-paid employees.
-- Include departments even if they have no employees.
-- ============================================================

SELECT
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    COUNT(e.employee_id) FILTER (
        WHERE e.salary >= 70000
    ) AS high_paid_employees,
    ROUND(
        100.0 * COUNT(e.employee_id) FILTER (
            WHERE e.salary >= 70000
        ) / NULLIF(COUNT(e.employee_id), 0),
        2
    ) AS high_paid_percentage
FROM departments AS d
LEFT JOIN employees AS e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY d.department_id;


-- ============================================================
-- BONUS: CONDITIONAL COUNTS FOR SALARY BANDS
-- Question:
-- Count employees in three salary bands per department:
-- below 60000, 60000-79999, and 80000 or above.
-- ============================================================

SELECT
    department_id,
    COUNT(*) FILTER (
        WHERE salary < 60000
    ) AS below_60000,
    COUNT(*) FILTER (
        WHERE salary >= 60000 AND salary < 80000
    ) AS salary_60000_to_79999,
    COUNT(*) FILTER (
        WHERE salary >= 80000
    ) AS salary_80000_or_above
FROM employees
GROUP BY department_id
ORDER BY department_id;


-- ============================================================
-- KEY CONCEPTS
--
-- CASE WHEN:
-- Returns a value based on a condition.
--
-- SUM(CASE WHEN condition THEN 1 ELSE 0 END):
-- Counts rows that satisfy a condition.
--
-- SUM(CASE WHEN condition THEN salary ELSE 0 END):
-- Adds salaries only for rows that satisfy a condition.
--
-- COUNT(*) FILTER (WHERE condition):
-- PostgreSQL syntax for counting rows that satisfy a condition.
--
-- LEFT JOIN:
-- Keeps departments even when they have no matching employees.
--
-- NULLIF(value, 0):
-- Prevents division by zero when calculating percentages.
-- ============================================================
