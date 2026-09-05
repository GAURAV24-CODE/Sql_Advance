-- Day 1: NULL Basics
-- Understanding missing / unknown values

-- 1. Check all employee records
SELECT *
FROM employees;


-- 2. Find employees where department is NULL
SELECT *
FROM employees
WHERE department IS NULL;


-- 3. Find employees where department is NOT NULL
SELECT *
FROM employees
WHERE department IS NOT NULL;


-- 4. Find employees where salary is NULL
SELECT *
FROM employees
WHERE salary IS NULL;


-- 5. Find employees where salary is NOT NULL
SELECT *
FROM employees
WHERE salary IS NOT NULL;


-- Q1. Find employees with a NULL job_title.
SELECT *
FROM employees
WHERE job_title IS NULL;


-- Q2. Find employees whose city is NOT NULL.
SELECT *
FROM employees
WHERE city IS NOT NULL;


-- Q3. Find employees whose experience_years is NULL.
SELECT *
FROM employees
WHERE experience_years IS NULL;


-- Q4. Find employees whose hire_date is NOT NULL.
SELECT *
FROM employees
WHERE hire_date IS NOT NULL;
