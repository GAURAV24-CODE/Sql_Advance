-- Day 12 - Topic 1
-- OVER() with Window Functions

-- Average salary of all employees
SELECT
    name,
    salary,
    ROUND(AVG(salary) OVER (), 2) AS overall_average_salary
FROM employees;


-- Total salary of all employees
SELECT
    name,
    salary,
    SUM(salary) OVER () AS total_salary
FROM employees;


-- Count total employees
SELECT
    name,
    department,
    COUNT(*) OVER () AS total_employees
FROM employees;


-- Minimum and maximum salary
SELECT
    name,
    salary,
    MIN(salary) OVER () AS minimum_salary,
    MAX(salary) OVER () AS maximum_salary
FROM employees;


-- Multiple window calculations
SELECT
    name,
    department,
    salary,
    ROUND(AVG(salary) OVER (), 2) AS average_salary,
    SUM(salary) OVER () AS total_salary,
    COUNT(*) OVER () AS total_employees
FROM employees;