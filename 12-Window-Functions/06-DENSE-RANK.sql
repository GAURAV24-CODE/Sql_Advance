-- Day 12 - Topic 6
-- DENSE_RANK()

-- Rank employees by salary
SELECT
    name,
    department,
    salary,
    DENSE_RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


-- Department-wise dense ranki
SELECT
    name,
    department,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;


-- Find the second-highest distinct salary
WITH ranked_salaries AS (
    SELECT
        name,
        department,
        salary,
        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT
    name,
    department,
    salary
FROM ranked_salaries
WHERE salary_rank = 2;