-- Day 12 - Topic 11
-- Running Total

-- Basic running total
SELECT
    employee_id,
    name,
    salary,
    SUM(salary) OVER (
        ORDER BY employee_id
    ) AS running_total
FROM employees;


-- Running total b department
SELECT
    employee_id,
    name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
        ORDER BY employee_id
    ) AS department_running_total
FROM employees;


-- Running total ordered by salary
SELECT
    name,
    salary,
    SUM(salary) OVER (
        ORDER BY salary
    ) AS running_salary_total
FROM employees;