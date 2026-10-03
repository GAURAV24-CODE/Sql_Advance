-- Day 12 - Topic 3
-- ORDER BY with Window Functions

-- Number employees according to salary
SELECT
    name,
    department,
    salary,
    ROW_NUMBER() OVER (
        ORDER BY salary DESC
    ) AS row_num
FROM employees;


-- Running total based on employee_id
SELECT
    employee_id,
    name,
    salary,
    SUM(salary) OVER (
        ORDER BY employee_id
    ) AS running_total
FROM employees;


-- Running average
SELECT
    employee_id,
    name,
    salary,
    ROUND(
        AVG(salary) OVER (
            ORDER BY employee_id
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
        ), 2
    ) AS running_average
FROM employees;


-- Department-wise ranking
SELECT
    name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;