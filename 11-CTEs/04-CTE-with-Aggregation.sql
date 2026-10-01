/*
=========================================================
File: 04-CTE-with-Aggregation.sql
Section: 11 - CTEs
Database: PostgreSQL

Topics:
1. Aggregation inside a CTE
2. COUNT, AVG, MIN, MAX
3. Filtering aggregated results
4. Comparing department and company averages
=========================================================
*/

-- ======================================================
-- Example 1: Department-wise employee summary
-- ======================================================

WITH department_summary AS (
    SELECT
        department,
        COUNT(*) AS employee_count,
        AVG(salary) AS average_salary,
        MIN(salary) AS minimum_salary,
        MAX(salary) AS maximum_salary
    FROM employees
    GROUP BY department
)
SELECT
    department,
    employee_count,
    ROUND(average_salary, 2) AS average_salary,
    minimum_salary,
    maximum_salary
FROM department_summary
ORDER BY average_salary DESC;


-- ======================================================
-- Example 2: Departments with average salary > 50000
-- ======================================================

WITH department_summary AS (
    SELECT
        department,
        COUNT(*) AS employee_count,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
)
SELECT
    department,
    employee_count,
    ROUND(average_salary, 2) AS average_salary
FROM department_summary
WHERE average_salary > 50000
ORDER BY average_salary DESC;


-- ======================================================
-- Example 3: Departments with highest salary > 60000
-- ======================================================

WITH department_summary AS (
    SELECT
        department,
        MAX(salary) AS highest_salary
    FROM employees
    GROUP BY department
)
SELECT
    department,
    highest_salary
FROM department_summary
WHERE highest_salary > 60000
ORDER BY highest_salary DESC;


-- ======================================================
-- Example 4: Compare department average with company average
-- ======================================================

WITH department_summary AS (
    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
),
company_summary AS (
    SELECT
        AVG(salary) AS company_average_salary
    FROM employees
)
SELECT
    d.department,
    ROUND(d.average_salary, 2) AS department_average,
    ROUND(c.company_average_salary, 2) AS company_average,
    CASE
        WHEN d.average_salary > c.company_average_salary
            THEN 'Above Company Average'
        WHEN d.average_salary < c.company_average_salary
            THEN 'Below Company Average'
        ELSE 'Equal to Company Average'
    END AS comparison
FROM department_summary AS d
CROSS JOIN company_summary AS c
ORDER BY d.average_salary DESC;


-- ======================================================
-- Example 5: Count employees with a non-NULL salary
-- ======================================================

WITH department_summary AS (
    SELECT
        department,
        COUNT(*) AS total_employees,
        COUNT(salary) AS employees_with_salary
    FROM employees
    GROUP BY department
)
SELECT
    department,
    total_employees,
    employees_with_salary
FROM department_summary
ORDER BY department;


