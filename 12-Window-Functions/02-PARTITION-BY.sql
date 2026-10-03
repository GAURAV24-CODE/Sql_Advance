-- Day 12 - Topic 2
-- PARTITION BY

-- Average salary by department
SELECT
    name,
    department,
    salary,
    ROUND(
        AVG(salary) OVER (
            PARTITION BY department
        ), 2
    ) AS department_avg_salary
FROM employees;


-- Total salary by department
SELECT
    name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
    ) AS department_total_salary
FROM employees;


-- Employee count by department
SELECT
    name,
    department,
    COUNT(*) OVER (
        PARTITION BY department
    ) AS department_employee_count
FROM employees;


-- Highest salary in each department
SELECT
    name,
    department,
    salary,
    MAX(salary) OVER (
        PARTITION BY department
    ) AS highest_department_salary
FROM employees;


-- Lowest salary in each department
SELECT
    name,
    department,
    salary,
    MIN(salary) OVER (
        PARTITION BY department
    ) AS lowest_department_salary
FROM employees;