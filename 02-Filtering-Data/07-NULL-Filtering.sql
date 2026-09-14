
-- DAY 2 — FILTERING DATA
-- File: 07-NULL-Filtering.sql
-- Topic: NULL Filtering
-- Database: PostgreSQL


-- Add a NULL value for practice
UPDATE employees
SET performance_rating = NULL
WHERE employee_name = 'Gaurav';


-- 1. Find employees with NULL performance rating
SELECT
    employee_name,
    performance_rating
FROM employees
WHERE performance_rating IS NULL;


-- 2. Find employees with a performance rating
SELECT
    employee_name,
    performance_rating
FROM employees
WHERE performance_rating IS NOT NULL;


-- 3. Find employees with NULL salary
SELECT
    employee_name,
    salary
FROM employees
WHERE salary IS NULL;


-- 4. Find employees whose salary is available
SELECT
    employee_name,
    salary
FROM employees
WHERE salary IS NOT NULL;


-- 5. NULL with another condition
SELECT
    employee_name,
    department,
    performance_rating
FROM employees
WHERE performance_rating IS NULL
AND department = 'IT';


-- 6. IS NOT NULL with salary condition
SELECT
    employee_name,
    salary,
    performance_rating
FROM employees
WHERE performance_rating IS NOT NULL
AND salary >= 70000;


-- 7. Count all employees
SELECT
    COUNT(*) AS total_employees
FROM employees;


-- 8. Count non-NULL performance ratings
SELECT
    COUNT(performance_rating) AS employees_with_rating
FROM employees;


-- 9. Count employees with NULL performance ratings
SELECT
    COUNT(*) - COUNT(performance_rating) AS missing_ratings
FROM employees;


-- 10. Find employees with NULL performance ratings
-- and show their departments
SELECT
    employee_name,
    department,
    performance_rating
FROM employees
WHERE performance_rating IS NULL;


-- 11. Find employees with available ratings
-- and rating above 4.5
SELECT
    employee_name,
    performance_rating
FROM employees
WHERE performance_rating IS NOT NULL
AND performance_rating > 4.5;


-- 12. NULL filtering with city
SELECT
    employee_name,
    city,
    performance_rating
FROM employees
WHERE performance_rating IS NULL
AND city = 'Pune';


-- 13. NULL filtering with department
SELECT
    employee_name,
    department,
    performance_rating
FROM employees
WHERE performance_rating IS NULL
AND department <> 'HR';


-- 14. Replace NULL using COALESCE
SELECT
    employee_name,
    COALESCE(performance_rating, 0) AS performance_rating
FROM employees;


-- 15. Replace NULL with text
SELECT
    employee_name,
    COALESCE(
        performance_rating::TEXT,
        'Not Rated'
    ) AS rating_status
FROM employees;