/*
=========================================================
File: 01-Basic-CTE.sql
Section: 11 - CTEs
Database: PostgreSQL

Topics:
1. What is a CTE?
2. Basic CTE syntax
3. Selecting data from a CTE
4. Filtering CTE results
5. Calculated columns in a CTE
6. Sorting CTE results
7. Multiple columns in a CTE
=========================================================
*/
-- ======================================================
-- Example 1: Basic CTE
-- Display all employees using a CTE
-- ======================================================
WITH employee_data AS (
    SELECT
        employee_id,
        name,
        department,
        salary
    FROM employees
)
SELECT *
FROM employee_data;


-- ======================================================
-- Example 2: Select specific columns from a CTE
-- ======================================================

WITH employee_data AS (
    SELECT
        employee_id,
        name,
        department
    FROM employees
)
SELECT
    employee_id,
    name,
    department
FROM employee_data;


-- ======================================================
-- Example 3: Filter CTE results
-- Find employees earning more than 50000
-- ======================================================

WITH employee_data AS (
    SELECT
        employee_id,
        name,
        department,
        salary
    FROM employees
)
SELECT *
FROM employee_data
WHERE salary > 50000;


-- ======================================================
-- Example 4: Filter employees by department
-- ======================================================

WITH employee_data AS (
    SELECT
        employee_id,
        name,
        department,
        salary
    FROM employees
)
SELECT *
FROM employee_data
WHERE department = 'IT';


-- ======================================================
-- Example 5: Create a calculated column in a CTE
-- ======================================================

WITH employee_data AS (
    SELECT
        employee_id,
        name,
        salary,
        salary * 12 AS annual_salary
    FROM employees
)
SELECT
    employee_id,
    name,
    salary,
    annual_salary
FROM employee_data;


-- ======================================================
-- Example 6: Sort CTE results
-- Display employees from highest to lowest salary
-- ======================================================

WITH employee_data AS (
    SELECT
        employee_id,
        name,
        department,
        salary
    FROM employees
)
SELECT *
FROM employee_data
ORDER BY salary DESC;


-- ======================================================
-- Example 7: Use a CTE with a condition on a
-- calculated column
-- ======================================================

WITH employee_data AS (
    SELECT
        employee_id,
        name,
        department,
        salary,
        salary * 12 AS annual_salary
    FROM employees
)
SELECT
    name,
    department,
    salary,
    annual_salary
FROM employee_data
WHERE annual_salary > 600000
ORDER BY annual_salary DESC;


-- ======================================================
-- Example 8: Assign readable column names in a CTE
-- ======================================================

WITH employee_data (
    employee_id,
    employee_name,
    employee_department,
    monthly_salary
) AS (
    SELECT
        employee_id,
        name,
        department,
        salary
    FROM employees
)
SELECT
    employee_id,
    employee_name,
    employee_department,
    monthly_salary
FROM employee_data;


-- ======================================================
-- Example 9: CTE with LIMIT
-- Display the five highest-paid employees
-- ======================================================

WITH employee_data AS (
    SELECT
        employee_id,
        name,
        department,
        salary
    FROM employees
)
SELECT *
FROM employee_data
ORDER BY salary DESC
LIMIT 5;


-- ======================================================
-- Example 10: CTE with DISTINCT
-- List departments without duplicates
-- ======================================================

WITH department_data AS (
    SELECT DISTINCT
        department
    FROM employees
)
SELECT department
FROM department_data
ORDER BY department;
