-- Day 12 - Topic 12
-- Department-wise Ranking

-- Rank employees within each department
SELECT
    name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;


-- Dense rank within each department
SELECT
    name,
    department,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;


-- Highest-paid employee(s) in each department
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


-- Top 2 employees from each department
WITH ranked_employees AS (
    SELECT
        name,
        department,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS department_rank
    FROM employees
)
SELECT
    name,
    department,
    salary,
    department_rank
FROM ranked_employees
WHERE department_rank <= 2
ORDER BY department, department_rank;