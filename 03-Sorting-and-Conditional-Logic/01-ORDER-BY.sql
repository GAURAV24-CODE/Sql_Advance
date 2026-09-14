
-- File: 01-ORDER-BY.sql
-- Topic: ORDER BY



-- 1. Sort employees by salary
SELECT
    employee_name,
    salary
FROM employees
ORDER BY salary;


-- 2. Sort salary in ascending order
SELECT
    employee_name,
    salary
FROM employees
ORDER BY salary ASC;


-- 3. Sort salary in descending order
SELECT
    employee_name,
    salary
FROM employees
ORDER BY salary DESC;


-- 4. Sort employees by age
SELECT
    employee_name,
    age
FROM employees
ORDER BY age;


-- 5. Sort employees by age descending
SELECT
    employee_name,
    age
FROM employees
ORDER BY age DESC;


-- 6. Sort by employee name
SELECT
    employee_name,
    department
FROM employees
ORDER BY employee_name;


-- 7. Sort names in descending order
SELECT
    employee_name,
    department
FROM employees
ORDER BY employee_name DESC;


-- 8. Sort by experience
SELECT
    employee_name,
    experience_years
FROM employees
ORDER BY experience_years DESC;


-- 9. Sort by performance rating
SELECT
    employee_name,
    performance_rating
FROM employees
WHERE performance_rating IS NOT NULL
ORDER BY performance_rating DESC;


-- 10. Sort employees by joining year
SELECT
    employee_name,
    joining_year
FROM employees
ORDER BY joining_year;


-- 11. Filter and sort
SELECT
    employee_name,
    department,
    salary
FROM employees
WHERE department = 'IT'
ORDER BY salary DESC;


-- 12. Sort Finance employees
SELECT
    employee_name,
    salary
FROM employees
WHERE department = 'Finance'
ORDER BY salary DESC;


-- 13. Sort employees earning more than 60000
SELECT
    employee_name,
    salary
FROM employees
WHERE salary > 60000
ORDER BY salary DESC;


-- 14. Sort by performance rating
-- and display only rated employees
SELECT
    employee_name,
    performance_rating
FROM employees
WHERE performance_rating IS NOT NULL
ORDER BY performance_rating ASC;


-- 15. Sort using calculated expression
SELECT
    employee_name,
    salary,
    salary * 12 AS annual_salary
FROM employees
ORDER BY annual_salary DESC;