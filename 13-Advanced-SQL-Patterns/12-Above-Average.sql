
-- ============================================================
-- File: 12-Pivot-and-Rows-to-Columns.sql
-- Topic: Pivot Rows into Columns
-- Database: PostgreSQL
-- ============================================================

-- DATASET:
-- employees(employee_id, employee_name, department_id, salary, hire_date)
-- departments(department_id, department_name)
--
-- Department IDs:
-- 1 = IT
-- 2 = HR
-- 3 = Sales


-- ============================================================
-- 1. EASY PATTERN
-- Question:
-- Display the number of employees in IT, HR, and Sales
-- as separate columns.
-- ============================================================

SELECT
    COUNT(*) FILTER (WHERE department_id = 1) AS it_employees,
    COUNT(*) FILTER (WHERE department_id = 2) AS hr_employees,
    COUNT(*) FILTER (WHERE department_id = 3) AS sales_employees
FROM employees;


-- ============================================================
-- 2. MEDIUM PATTERN
-- Question:
-- Display the total salary payroll for IT, HR, and Sales
-- as separate columns.
-- ============================================================

SELECT
    SUM(salary) FILTER (WHERE department_id = 1) AS it_payroll,
    SUM(salary) FILTER (WHERE department_id = 2) AS hr_payroll,
    SUM(salary) FILTER (WHERE department_id = 3) AS sales_payroll
FROM employees;


-- ============================================================
-- 3. HARD PATTERN
-- Question:
-- Display the employee count and average salary for each
-- department as separate columns.
-- ============================================================

SELECT
    COUNT(*) FILTER (WHERE department_id = 1) AS it_count,
    ROUND(
        AVG(salary) FILTER (WHERE department_id = 1),
        2
    ) AS it_average_salary,

    COUNT(*) FILTER (WHERE department_id = 2) AS hr_count,
    ROUND(
        AVG(salary) FILTER (WHERE department_id = 2),
        2
    ) AS hr_average_salary,

    COUNT(*) FILTER (WHERE department_id = 3) AS sales_count,
    ROUND(
        AVG(salary) FILTER (WHERE department_id = 3),
        2
    ) AS sales_average_salary
FROM employees;


-- ============================================================
-- 4. TCS NQT PATTERN
-- Question:
-- Which PostgreSQL expression can count IT employees
-- in a conditional aggregation query?
--
-- A. COUNT(*) FILTER (WHERE department_id = 1)
-- B. COUNT(department_id = 1)
-- C. SUM(department_id)
-- D. DISTINCT(department_id)
--
-- Answer: A
--
-- Practice:
-- Display employee counts for IT and HR as separate columns.
-- ============================================================

SELECT
    COUNT(*) FILTER (WHERE department_id = 1) AS it_count,
    COUNT(*) FILTER (WHERE department_id = 2) AS hr_count
FROM employees;


-- ============================================================
-- 5. ADVANCED INTERVIEW PATTERN
-- Question:
-- Display each department's payroll and employee count
-- in separate columns, with one output row per metric.
-- Use a CTE and UNION ALL to create a pivot-style report.
-- ============================================================

WITH department_summary AS (
    SELECT
        d.department_id,
        d.department_name,
        COUNT(e.employee_id) AS employee_count,
        COALESCE(SUM(e.salary), 0) AS total_payroll
    FROM departments AS d
    LEFT JOIN employees AS e
        ON d.department_id = e.department_id
    GROUP BY d.department_id, d.department_name
)
SELECT
    'Employee Count' AS metric,
    MAX(employee_count) FILTER (
        WHERE department_name = 'IT'
    ) AS it,
    MAX(employee_count) FILTER (
        WHERE department_name = 'HR'
    ) AS hr,
    MAX(employee_count) FILTER (
        WHERE department_name = 'Sales'
    ) AS sales
FROM department_summary

UNION ALL

SELECT
    'Total Payroll' AS metric,
    MAX(total_payroll) FILTER (
        WHERE department_name = 'IT'
    ) AS it,
    MAX(total_payroll) FILTER (
        WHERE department_name = 'HR'
    ) AS hr,
    MAX(total_payroll) FILTER (
        WHERE department_name = 'Sales'
    ) AS sales
FROM department_summary;


-- ============================================================
-- BONUS: PIVOT EMPLOYEE COUNTS AND PAYROLL IN ONE ROW
-- Question:
-- Display each department's employee count and payroll
-- as separate columns in one summary row.
-- ============================================================

SELECT
    COUNT(*) FILTER (WHERE department_id = 1) AS it_employees,
    COALESCE(
        SUM(salary) FILTER (WHERE department_id = 1),
        0
    ) AS it_payroll,

    COUNT(*) FILTER (WHERE department_id = 2) AS hr_employees,
    COALESCE(
        SUM(salary) FILTER (WHERE department_id = 2),
        0
    ) AS hr_payroll,

    COUNT(*) FILTER (WHERE department_id = 3) AS sales_employees,
    COALESCE(
        SUM(salary) FILTER (WHERE department_id = 3),
        0
    ) AS sales_payroll
FROM employees;


-- ============================================================
-- KEY CONCEPTS
--
-- PIVOT:
-- Converts row-based categories into separate columns.
--
-- FILTER (WHERE condition):
-- Applies a condition to an aggregate in PostgreSQL.
--
-- SUM(...) FILTER (...):
-- Calculates a total for a specific category.
--
-- COUNT(...) FILTER (...):
-- Counts records matching a category.
--
-- COALESCE(value, 0):
-- Replaces NULL with 0 when a category has no matching rows.
--
-- UNION ALL:
-- Combines result sets while preserving duplicate rows.
--
-- Important:
-- These examples use fixed department names or IDs.
-- If categories change frequently, a dynamic pivot may be
-- needed, typically using generated SQL or tablefunc's crosstab.
-- ============================================================
