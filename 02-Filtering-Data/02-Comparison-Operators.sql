-- DAY 2 — FILTERING DATA
-- File: 02-Comparison-Operators.sql
-- Topic: Comparison Operators
-- Database: PostgreSQL


-- 1. Equal To (=)
SELECT
    employee_name,
    salary
FROM employees
WHERE salary = 60000;


-- 2. Greater Than (>)
SELECT
    employee_name,
    salary
FROM employees
WHERE salary > 70000;


-- 3. Less Than (<)
SELECT
    employee_name,
    salary
FROM employees
WHERE salary < 60000;


-- 4. Greater Than or Equal To (>=)
SELECT
    employee_name,
    salary
FROM employees
WHERE salary >= 60000;


-- 5. Less Than or Equal To (<=)
SELECT
    employee_name,
    salary
FROM employees
WHERE salary <= 60000;


-- 6. Not Equal To (<>)
SELECT
    employee_name,
    department
FROM employees
WHERE department <> 'IT';


-- 7. Not Equal To (!=)
SELECT
    employee_name,
    department
FROM employees
WHERE department != 'IT';


-- 8. Compare Department
SELECT
    employee_name,
    department
FROM employees
WHERE department = 'Finance';


-- 9. Compare City
SELECT
    employee_name,
    city
FROM employees
WHERE city = 'Pune';


-- 10. Compare Age
SELECT
    employee_name,
    age
FROM employees
WHERE age > 25;


-- 11. Compare Experience
SELECT
    employee_name,
    experience_years
FROM employees
WHERE experience_years >= 5;


-- 12. Compare Performance Rating
SELECT
    employee_name,
    performance_rating
FROM employees
WHERE performance_rating >= 4.5;


-- 13. Compare Joining Year
SELECT
    employee_name,
    joining_year
FROM employees
WHERE joining_year < 2022;


-- 14. Salary Not Equal To
SELECT
    employee_name,
    salary
FROM employees
WHERE salary <> 50000;


-- 15. Combining Column Selection with Comparison
SELECT
    employee_id,
    employee_name,
    job_role,
    salary
FROM employees
WHERE salary >= 80000;