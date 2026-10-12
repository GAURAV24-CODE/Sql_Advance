
-- ============================================================
-- File: 10-NTILE-Quartiles-and-Buckets.sql
-- Topic: NTILE(), Quartiles, and Buckets
-- Database: PostgreSQL
-- ============================================================

-- DATASET:
-- employees(employee_id, employee_name, department_id, salary, hire_date)


-- ============================================================
-- 1. EASY PATTERN
-- Question:
-- Divide all employees into 4 salary groups (quartiles).
-- Quartile 1 contains the lower salaries.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    salary,
    NTILE(4) OVER (
        ORDER BY salary, employee_id
    ) AS salary_quartile
FROM employees
ORDER BY salary, employee_id;


-- ============================================================
-- 2. MEDIUM PATTERN
-- Question:
-- Divide employees into 3 salary groups:
-- 1 = lower group, 2 = middle group, 3 = upper group.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    salary,
    NTILE(3) OVER (
        ORDER BY salary, employee_id
    ) AS salary_bucket
FROM employees
ORDER BY salary, employee_id;


-- ============================================================
-- 3. HARD PATTERN
-- Question:
-- Divide employees into 4 salary quartiles separately
-- within each department.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    NTILE(4) OVER (
        PARTITION BY department_id
        ORDER BY salary, employee_id
    ) AS department_salary_quartile
FROM employees
ORDER BY department_id, salary, employee_id;


-- ============================================================
-- 4. TCS NQT PATTERN
-- Question:
-- What does NTILE(4) do?
--
-- A. Divides rows into at most 4 ordered groups
-- B. Returns the top 4 salaries only
-- C. Calculates the average of 4 rows
-- D. Removes duplicate rows
--
-- Answer: A
--
-- Practice:
-- Return employees in the highest salary bucket when all
-- employees are divided into 4 buckets.
-- ============================================================

WITH salary_buckets AS (
    SELECT
        employee_id,
        employee_name,
        salary,
        NTILE(4) OVER (
            ORDER BY salary DESC, employee_id
        ) AS salary_bucket
    FROM employees
)
SELECT
    employee_id,
    employee_name,
    salary,
    salary_bucket
FROM salary_buckets
WHERE salary_bucket = 1
ORDER BY salary DESC, employee_id;


-- ============================================================
-- 5. ADVANCED INTERVIEW PATTERN
-- Question:
-- Find the average salary of each quartile and the number
-- of employees assigned to each quartile.
-- ============================================================

WITH salary_quartiles AS (
    SELECT
        employee_id,
        salary,
        NTILE(4) OVER (
            ORDER BY salary, employee_id
        ) AS quartile
    FROM employees
)
SELECT
    quartile,
    COUNT(*) AS employee_count,
    ROUND(AVG(salary), 2) AS average_salary,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM salary_quartiles
GROUP BY quartile
ORDER BY quartile;


-- ============================================================
-- BONUS: NTILE() WITH DEPARTMENT-WISE BUCKETS
-- Question:
-- Divide employees into 2 salary groups within each
-- department and show the group number.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    NTILE(2) OVER (
        PARTITION BY department_id
        ORDER BY salary DESC, employee_id
    ) AS department_salary_group
FROM employees
ORDER BY department_id, salary DESC, employee_id;


-- ============================================================
-- KEY CONCEPTS
--
-- NTILE(n):
-- Divides ordered rows into n approximately equal-sized buckets.
--
-- NTILE(4):
-- Commonly used to create quartile groups.
--
-- PARTITION BY department_id:
-- Restarts bucket assignment for each department.
--
-- ORDER BY salary:
-- Determines how rows are assigned to salary buckets.
--
-- Important:
-- NTILE() distributes rows, not distinct salary values.
-- Employees with the same salary can be assigned to different
-- buckets, especially when a tie crosses a bucket boundary.
-- If a partition has fewer rows than buckets, some buckets
-- will be empty.
-- ============================================================
