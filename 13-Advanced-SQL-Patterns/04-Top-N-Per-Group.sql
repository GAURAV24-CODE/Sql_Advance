
-- ============================================================
-- File: 04-Top-N-Per-Group.sql
-- Topic: Top N Records Per Group
-- Database: PostgreSQL
-- ============================================================

-- DATASET:
-- employees(employee_id, employee_name, department_id, salary, hire_date)
--
-- Sample salary data:
-- IT:    Amit(90000), Priya(80000), Rahul(80000)
-- HR:    Neha(60000), Sneha(50000)
-- Sales: Karan(70000), Pooja(60000), Vikas(50000)


-- ============================================================
-- 1. EASY PATTERN
-- Question:
-- Find the highest-paid employee in each department.
-- ============================================================

SELECT employee_id, employee_name, department_id, salary
FROM (
    SELECT
        employee_id,
        employee_name,
        department_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC, employee_id
        ) AS rn
    FROM employees
) AS ranked_employees
WHERE rn = 1;


-- ============================================================
-- 2. MEDIUM PATTERN
-- Question:
-- Find the top 2 employees by salary in each department.
-- Include employees tied at the second salary level.
-- ============================================================

SELECT employee_id, employee_name, department_id, salary
FROM (
    SELECT
        employee_id,
        employee_name,
        department_id,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
) AS ranked_employees
WHERE salary_rank <= 2
ORDER BY department_id, salary DESC, employee_id;


-- ============================================================
-- 3. HARD PATTERN
-- Question:
-- Find the third-highest distinct salary in each department.
-- ============================================================

SELECT department_id, employee_name, salary
FROM (
    SELECT
        department_id,
        employee_name,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
) AS ranked_employees
WHERE salary_rank = 3
ORDER BY department_id;


-- ============================================================
-- 4. TCS NQT PATTERN
-- Question:
-- What does PARTITION BY department_id do in a window function?
--
-- A. Sorts the complete table only
-- B. Divides rows into department groups for ranking
-- C. Removes duplicate department IDs
-- D. Filters out departments with low salaries
--
-- Answer: B
--
-- Practice:
-- Find the top 2 employees in each department, returning
-- exactly two employees per department when available.
-- ============================================================

SELECT employee_id, employee_name, department_id, salary
FROM (
    SELECT
        employee_id,
        employee_name,
        department_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC, employee_id
        ) AS rn
    FROM employees
) AS ranked_employees
WHERE rn <= 2
ORDER BY department_id, rn;


-- ============================================================
-- 5. ADVANCED INTERVIEW PATTERN
-- Question:
-- Find employees whose salary is in the top 2 distinct salary
-- levels of their department, and display the department name.
-- ============================================================

SELECT
    e.employee_id,
    e.employee_name,
    d.department_name,
    e.salary
FROM (
    SELECT
        employee_id,
        employee_name,
        department_id,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
) AS e
JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary_rank <= 2
ORDER BY d.department_name, e.salary DESC, e.employee_id;


-- ============================================================
-- KEY DIFFERENCE:
--
-- ROW_NUMBER():
-- Gives every row a unique rank; ties receive different numbers.
--
-- RANK():
-- Tied values share a rank; the next rank can be skipped.
--
-- DENSE_RANK():
-- Tied values share a rank; the next rank is not skipped.
--
-- PARTITION BY:
-- Restarts the ranking separately for each department.
-- ============================================================
