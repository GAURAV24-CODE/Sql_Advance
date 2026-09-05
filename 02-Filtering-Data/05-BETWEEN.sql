-- DAY 2 — FILTERING DATA
-- File: 05-BETWEEN.sql
-- Topic: BETWEEN
-- Database: PostgreSQL


-- 1. Salary Between 50000 and 70000
SELECT
    employee_name,
    salary
FROM employees
WHERE salary BETWEEN 50000 AND 70000;


-- 2. Salary Between 60000 and 90000
SELECT
    employee_name,
    salary
FROM employees
WHERE salary BETWEEN 60000 AND 90000;


-- 3. Salary Not Between 50000 and 70000
SELECT
    employee_name,
    salary
FROM employees
WHERE salary NOT BETWEEN 50000 AND 70000;


-- 4. Age Between 25 and 30
SELECT
    employee_name,
    age
FROM employees
WHERE age BETWEEN 25 AND 30;


-- 5. Experience Between 3 and 6 Years
SELECT
    employee_name,
    experience_years
FROM employees
WHERE experience_years BETWEEN 3 AND 6;


-- 6. Performance Rating Between 4.0 and 4.5
SELECT
    employee_name,
    performance_rating
FROM employees
WHERE performance_rating BETWEEN 4.0 AND 4.5;


-- 7. Salary Between 60000 and 90000
-- for IT Employees
SELECT
    employee_name,
    department,
    salary
FROM employees
WHERE department = 'IT'
AND salary BETWEEN 60000 AND 90000;


-- 8. Salary Between 50000 and 70000
-- for Pune Employees
SELECT
    employee_name,
    city,
    salary
FROM employees
WHERE city = 'Pune'
AND salary BETWEEN 50000 AND 70000;


-- 9. IN + BETWEEN
SELECT
    employee_name,
    department,
    salary
FROM employees
WHERE department IN ('IT', 'Finance')
AND salary BETWEEN 60000 AND 90000;


-- 10. BETWEEN + Age
SELECT
    employee_name,
    salary,
    age
FROM employees
WHERE salary BETWEEN 60000 AND 80000
AND age BETWEEN 24 AND 30;


-- 11. BETWEEN + Experience
SELECT
    employee_name,
    experience_years,
    salary
FROM employees
WHERE experience_years BETWEEN 2 AND 5
AND salary >= 60000;


-- 12. NOT BETWEEN + Department
SELECT
    employee_name,
    department,
    salary
FROM employees
WHERE salary NOT BETWEEN 50000 AND 70000
AND department = 'IT';


-- 13. Multiple BETWEEN Conditions
SELECT
    employee_name,
    age,
    experience_years,
    performance_rating
FROM employees
WHERE age BETWEEN 25 AND 30
AND experience_years BETWEEN 3 AND 6
AND performance_rating BETWEEN 4.0 AND 4.7;


-- 14. BETWEEN + OR
SELECT
    employee_name,
    department,
    salary
FROM employees
WHERE salary BETWEEN 45000 AND 55000
OR salary BETWEEN 85000 AND 95000;


-- 15. BETWEEN with Subquery
-- Employees earning between average salary
-- and 90000
SELECT
    employee_name,
    salary
FROM employees
WHERE salary BETWEEN
      (SELECT AVG(salary) FROM employees)
      AND 90000;