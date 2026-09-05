-- DAY 2 — FILTERING DATA
-- File: 01-WHERE.sql
-- Topic: WHERE
-- Database: PostgreSQL


-- 1. Basic WHERE
SELECT *
FROM employees
WHERE salary > 60000;


-- 2. Select Specific Columns with WHERE
SELECT
    employee_name,
    salary
FROM employees
WHERE salary > 60000;


-- 3. WHERE with Equal (=)
SELECT *
FROM employees
WHERE salary = 60000;


-- 4. WHERE with Text
SELECT *
FROM employees
WHERE employee_name = 'Rahul';


-- 5. WHERE with emp_id
SELECT *
FROM employees
WHERE employee_id = 111;


-- 6. Salary Less Than
SELECT
    employee_name,
    salary
FROM employees
WHERE salary < 60000;


-- 7. Salary Greater Than or Equal To
SELECT
    employee_name,
    salary
FROM employees
WHERE salary >= 65000;


-- 8. Salary Less Than or Equal To
SELECT
    employee_name,
    salary
FROM employees
WHERE salary <= 55000;


-- 9. Filter by Employee ID
SELECT
    employee_id,
    employee_name
FROM employees
WHERE employee_id = 103;


-- 10. Filter by Department ID
SELECT
    employee_name,
    employee_id
FROM employees
WHERE employee_id = 112;


-- 11. Filter Employees with Non-NULL Salary
SELECT
    employee_name,
    salary
FROM employees
WHERE salary IS NOT NULL;


-- 12. Filter Employees with NULL Salary
SELECT
    employee_name,
    salary
FROM employees
WHERE salary IS NULL;