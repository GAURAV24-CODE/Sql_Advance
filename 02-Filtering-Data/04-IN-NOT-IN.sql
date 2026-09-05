-- DAY 2 — FILTERING DATA
-- File: 04-IN-NOT-IN.sql
-- Topic: IN / NOT IN
-- Database: PostgreSQL


-- 1. IN with Departments
SELECT
    employee_name,
    department
FROM employees
WHERE department IN ('IT', 'Finance');


-- 2. IN with Three Departments
SELECT
    employee_name,
    department
FROM employees
WHERE department IN ('IT', 'Finance', 'HR');


-- 3. IN with Cities
SELECT
    employee_name,
    city
FROM employees
WHERE city IN ('Pune', 'Mumbai', 'Nashik');


-- 4. IN with Ages
SELECT
    employee_name,
    age
FROM employees
WHERE age IN (24, 25, 26);


-- 5. IN with Joining Years
SELECT
    employee_name,
    joining_year
FROM employees
WHERE joining_year IN (2021, 2022, 2023);


-- 6. IN with Job Roles
SELECT
    employee_name,
    job_role
FROM employees
WHERE job_role IN ('Data Analyst', 'Data Scientist', 'ML Engineer');


-- 7. NOT IN with Departments
SELECT
    employee_name,
    department
FROM employees
WHERE department NOT IN ('IT', 'HR');


-- 8. NOT IN with Cities
SELECT
    employee_name,
    city
FROM employees
WHERE city NOT IN ('Pune', 'Mumbai');


-- 9. IN with AND
SELECT
    employee_name,
    department,
    salary
FROM employees
WHERE department IN ('IT', 'Finance')
AND salary >= 70000;


-- 10. NOT IN with AND
SELECT
    employee_name,
    department,
    city
FROM employees
WHERE department NOT IN ('HR', 'Sales')
AND city = 'Pune';


-- 11. IN with Salary Condition
SELECT
    employee_name,
    department,
    salary
FROM employees
WHERE department IN ('IT', 'Finance', 'Marketing')
AND salary > 60000;


-- 12. IN with ORDER BY
SELECT
    employee_name,
    department,
    salary
FROM employees
WHERE department IN ('IT', 'Finance')
ORDER BY salary DESC;


-- 13. NOT IN with Salary Condition
SELECT
    employee_name,
    department,
    salary
FROM employees
WHERE department NOT IN ('HR', 'Sales')
AND salary >= 60000;


-- 14. IN with Performance Rating
SELECT
    employee_name,
    performance_rating
FROM employees
WHERE performance_rating IN (4.0, 4.2, 4.5);


-- 15. Multiple Filtering with IN
SELECT
    employee_name,
    department,
    city,
    salary
FROM employees
WHERE department IN ('IT', 'Finance')
AND city IN ('Pune', 'Mumbai')
AND salary >= 60000;