-- Topic: SELECT + FROM
-- Database: PostgreSQL
-- ============================================================
-- 1. Select all columns
-- ============================================================

SELECT *
FROM employees;
-- ============================================================
-- 2. Select a single column
-- ============================================================
SELECT employee_name
FROM employees;
-- ============================================================
-- 3. Select multiple columns
-- ============================================================
SELECT
    employee_name,
    salary
FROM employees;
-- 4. Select employee ID and name
-- ============================================================
SELECT
    employee_id,
    employee_name
FROM employees;
-- ============================================================
-- 5. Select employee name, department and salary
-- ============================================================
SELECT
    employee_name,
    department_id,
    salary
FROM employees;
-- ============================================================
-- 7. Select customer information
-- ============================================================

SELECT
    customer_id,
    customer_name,
    city
FROM customers;

-- "Give me employee names and salaries."
-- ============================================================

SELECT
    employee_name,
    salary
FROM employees;
-- . Display all employees.
SELECT *
FROM employees;

-- . Display employee names.
SELECT employee_name
FROM employees;
--. Display employee names and departments.
SELECT employee_name, department
FROM employees;

-- Display employee names and salaries.
SELECT employee_name, salary
FROM employees;

--. Display employee names, job titles and cities.
SELECT employee_name, job_title, city
FROM employees;