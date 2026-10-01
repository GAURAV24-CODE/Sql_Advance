-- ============================================
-- SQL-Interview-Mastery
-- Section 11: CTEs
-- File: 03-CTE-with-JOIN.sql
-- Database: PostgreSQL
-- ============================================

-- Example 1: Join employees with department summary
WITH department_summary AS (
    SELECT
        department,
        COUNT(*) AS employee_count,
        AVG(salary) AS avg_salary
    FROM employees
    WHERE salary IS NOT NULL
    GROUP BY department
)
SELECT
    e.employee_id,
    e.name,
    e.department,
    e.salary,
    d.employee_count,
    ROUND(d.avg_salary, 2) AS department_avg_salary
FROM employees AS e
INNER JOIN department_summary AS d
    ON e.department = d.department
ORDER BY e.department, e.salary DESC;


-- Example 2: Keep every employee using LEFT JOIN
WITH department_summary AS (
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    WHERE salary IS NOT NULL
    GROUP BY department
)
SELECT
    e.employee_id,
    e.name,
    e.department,
    e.salary,
    ROUND(d.avg_salary, 2) AS department_avg_salary
FROM employees AS e
LEFT JOIN department_summary AS d
    ON e.department = d.department
ORDER BY e.department, e.name;


-- Example 3: Employees earning above department average
WITH department_summary AS (
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    WHERE salary IS NOT NULL
    GROUP BY department
)
SELECT
    e.employee_id,
    e.name,
    e.department,
    e.salary,
    ROUND(d.avg_salary, 2) AS department_avg_salary
FROM employees AS e
INNER JOIN department_summary AS d
    ON e.department = d.department
WHERE e.salary > d.avg_salary
ORDER BY e.department, e.salary DESC;