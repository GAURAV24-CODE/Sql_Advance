-- Day 12 - Topic 8
-- FIRST_VALUE() and LAST_VALUE()

-- Highest-paid employee
SELECT
    name,
    department,
    salary,
    FIRST_VALUE(name) OVER (
        ORDER BY salary DESC
    ) AS highest_paid_employee
FROM employees;


-- Highest-paid employee in each department
SELECT
    name,
    department,
    salary,
    FIRST_VALUE(name) OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS highest_paid_in_department
FROM employees;


-- Lowest salary
SELECT
    name,
    salary,
    FIRST_VALUE(salary) OVER (
        ORDER BY salary ASC
    ) AS lowest_salary
FROM employees;


-- Highest salary using LAST_VALUE()
SELECT
    name,
    salary,
    LAST_VALUE(salary) OVER (
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS highest_salary
FROM employees;