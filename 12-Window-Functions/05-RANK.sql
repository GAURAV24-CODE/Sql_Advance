-- Day 12 - Topic 5
-- RANK()

-- Rank all employees by salary
SELECT
    name,
    department,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


-- Department-wise salary ranki
SELECT
    name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;


-- Find highest-paid employee(s) in each department
WITH ranked_employees AS (
    SELECT
        name,
        department,
        salary,
        RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS department_rank
    FROM employees
)
SELECT
    name,
    department,
    salary
FROM ranked_employees
WHERE department_rank = 1;