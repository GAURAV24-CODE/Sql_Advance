-- DAY 2 — FILTERING DATA
-- File: 03-AND-OR-NOT.sql
-- Topic: AND / OR / NOT
-- Database: PostgreSQL


-- 1. AND — Two Conditions
SELECT
    employee_name,
    department,
    salary
FROM employees
WHERE department = 'IT'
AND salary > 70000;


-- 2. AND — City and Department
SELECT
    employee_name,
    department,
    city
FROM employees
WHERE department = 'IT'
AND city = 'Pune';


-- 3. AND — Salary and Age
SELECT
    employee_name,
    salary,
    age
FROM employees
WHERE salary >= 70000
AND age < 30;


-- 4. AND — Three Conditions
SELECT
    employee_name,
    department,
    salary,
    age
FROM employees
WHERE department = 'IT'
AND salary > 70000
AND age < 30;


-- 5. OR — Two Departments
SELECT
    employee_name,
    department
FROM employees
WHERE department = 'IT'
OR department = 'Finance';


-- 6. OR — Two Cities
SELECT
    employee_name,
    city
FROM employees
WHERE city = 'Pune'
OR city = 'Mumbai';


-- 7. OR — Salary Conditions
SELECT
    employee_name,
    salary
FROM employees
WHERE salary < 50000
OR salary > 85000;


-- 8. NOT — Exclude IT
SELECT
    employee_name,
    department
FROM employees
WHERE NOT department = 'IT';


-- 9. NOT — Exclude Mumbai
SELECT
    employee_name,
    city
FROM employees
WHERE NOT city = 'Mumbai';


-- 10. NOT with Salary Condition
SELECT
    employee_name,
    salary
FROM employees
WHERE NOT salary > 70000;


-- 11. AND with OR
SELECT
    employee_name,
    department,
    city
FROM employees
WHERE (department = 'IT' OR department = 'Finance')
AND city = 'Pune';


-- 12. Multiple AND Conditions
SELECT
    employee_name,
    department,
    city,
    salary
FROM employees
WHERE department = 'IT'
AND city = 'Pune'
AND salary >= 70000;


-- 13. OR with Different Columns
SELECT
    employee_name,
    department,
    city
FROM employees
WHERE department = 'HR'
OR city = 'Nashik';


-- 14. Complex Condition
SELECT
    employee_name,
    department,
    salary,
    age
FROM employees
WHERE (department = 'IT' OR department = 'Finance')
AND salary >= 60000
AND age <= 30;


-- 15. NOT with Parentheses
SELECT
    employee_name,
    department,
    city
FROM employees
WHERE NOT (department = 'IT' OR department = 'HR');