-- Day 1: Column Aliases
-- Rename columns in the query result using AS

-- 1. Rename employee_name as name
SELECT employee_name AS name
FROM employees;

-- 2. Rename salary as monthly_salary
SELECT salary AS monthly_salary
FROM employees;

-- 3. Rename department as department_name
SELECT department AS department_name
FROM employees;

-- 4. Rename multiple columns
SELECT
    employee_name AS employee,
    job_title AS position,
    salary AS monthly_salary
FROM employees;

-- 5. Calculated column with an alias
SELECT
    employee_name,
    salary * 12 AS annual_salary
FROM employees;

-- 6. Alias without AS
SELECT
    employee_name employee,
    salary monthly_salary
FROM employees;



show table;


