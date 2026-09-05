-- Day 1: LIMIT
-- Restrict the number of rows returned

-- 1. Display only the first 5 employees
SELECT *
FROM employees
LIMIT 5;


-- 2. Display the first 3 employee names
SELECT employee_name
FROM employees
LIMIT 3;


-- 3. Display the first 10 employees
SELECT employee_name, department, salary
FROM employees
LIMIT 10;


-- 4. Display only 1 employee
SELECT *
FROM employees
LIMIT 1;


-- 5. Display the first 5 employee names and salaries
SELECT employee_name, salary
FROM employees
LIMIT 5;


-- ============================================
-- PRACTICE ANSWERS
-- ============================================

-- Q1. Display only the first 5 employees.
SELECT *
FROM employees
LIMIT 5;

-- Q2. Display the first 3 employee names.
SELECT employee_name
FROM employees
LIMIT 3;

-- Q3. Display the first 7 employees with their department.
SELECT employee_name, department
FROM employees
LIMIT 7;

-- Q4. Display only 2 employee names and salaries.
SELECT employee_name, salary
FROM employees
LIMIT 2;

-- Q5. Display the first 10 employees with their job title.
SELECT employee_name, job_title
FROM employees
LIMIT 10;