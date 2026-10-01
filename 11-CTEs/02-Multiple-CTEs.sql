-- ============================================
-- SQL-Interview-Mastery
-- Section 11: CTEs
-- File: 02-Multiple-CTEs.sql
-- Database: PostgreSQL
-- ============================================

-- Example 1: Calculate average salary by department

WITH employee_data AS (
    SELECT
        employee_id,
        name,
        department,
        salary
    FROM employees
    WHERE salary > 0
),
department_salary AS (
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employee_data
    GROUP BY department
)
SELECT
    department,
    ROUND(avg_salary, 2) AS avg_salary
FROM department_salary
ORDER BY department;


-- Example 2: Employees earning above their
-- department's average salary

WITH employee_data AS (
    SELECT
        employee_id,
        name,
        department,
        salary
    FROM employees
    WHERE salary IS NOT NULL
),
department_salary AS (
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employee_data
    GROUP BY department
)
SELECT
    e.employee_id,
    e.name,
    e.department,
    e.salary,
    ROUND(d.avg_salary, 2) AS department_avg_salary
FROM employee_data AS e
INNER JOIN department_salary AS d
    ON e.department = d.department
WHERE e.salary > d.avg_salary
ORDER BY e.department, e.salary DESC;


-- Example 3: Three CTEs working in sequence

WITH employee_data AS (
    SELECT
        employee_id,
        name,
        department,
        salary
    FROM employees
    WHERE salary > 0
),
department_stats AS (
    SELECT
        department,
        COUNT(*) AS employee_count,
        AVG(salary) AS avg_salary,
        SUM(salary) AS total_salary
    FROM employee_data
    GROUP BY department
),
high_salary_departments AS (
    SELECT
        department,
        employee_count,
        avg_salary,
        total_salary
    FROM department_stats
    WHERE avg_salary > 50000
)
SELECT
    department,
    employee_count,
    ROUND(avg_salary, 2) AS avg_salary,
    total_salary
FROM high_salary_departments
ORDER BY avg_salary DESC;