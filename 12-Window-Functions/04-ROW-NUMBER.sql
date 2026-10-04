-- Day 12 - Topic 4
-- ROW_NUMBER()

-- Number all employees by salary
SELECT
    name,
    department,
    salary,
    ROW_NUMBER() OVER (
        ORDER BY salary DESC
    ) AS row_number
FROM employees;


-- Number employees within each departme
SELECT
    name,
    department,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_row_number
FROM employees;


-- Find the highest-paid employee from each department
WITH ranked_employees AS (
    SELECT
        name,
        department,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS row_number
    FROM employees
)
SELECT
    name,
    department,
    salary
FROM ranked_employees
WHERE row_number = 1;