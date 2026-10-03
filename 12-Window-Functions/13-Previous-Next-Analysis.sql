-- Day 12 - Topic 13
-- Previous and Next Row Analysis

-- Previous salary
SELECT
    employee_id,
    name,
    salary,
    LAG(salary) OVER (
        ORDER BY employee_id
    ) AS previous_salary
FROM employees;


-- Next salary
SELECT
    employee_id,
    name,
    salary,
    LEAD(salary) OVER (
        ORDER BY employee_id
    ) AS next_salary
FROM employees;


-- Compare current salary with previous salary
SELECT
    employee_id,
    name,
    salary,
    LAG(salary) OVER (
        ORDER BY employee_id
    ) AS previous_salary,
    salary - LAG(salary) OVER (
        ORDER BY employee_id
    ) AS salary_difference
FROM employees;


-- Compare current salary with next salary
SELECT
    employee_id,
    name,
    salary,
    LEAD(salary) OVER (
        ORDER BY employee_id
    ) AS next_salary,
    LEAD(salary) OVER (
        ORDER BY employee_id
    ) - salary AS next_salary_difference
FROM employees;


-- Previous and next salary together
SELECT
    employee_id,
    name,
    department,
    salary,

    LAG(salary) OVER (
        ORDER BY employee_id
    ) AS previous_salary,

    LEAD(salary) OVER (
        ORDER BY employee_id
    ) AS next_salary

FROM employees;


-- Previous and next salary within each department
SELECT
    employee_id,
    name,
    department,
    salary,

    LAG(salary) OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS previous_salary,

    LEAD(salary) OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS next_salary

FROM employees;