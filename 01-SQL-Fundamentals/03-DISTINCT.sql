-- Day 1: DISTINCT
-- Remove duplicate values from query results

-- 1. Display all departments
SELECT department
FROM employees;

-- 2. Display unique departments
SELECT DISTINCT department
FROM employees;

-- 3. Display unique cities
SELECT DISTINCT city
FROM employees;

-- 4. Display unique job titles
SELECT DISTINCT job_title
FROM employees;

-- 5. Display unique combinations of department and city
SELECT DISTINCT department, city
FROM employees;

-- 6. Display unique combinations of department and job title
SELECT DISTINCT department, job_title
FROM employees;

-- ============================================
-- PRACTICE ANSWERS
-- ============================================

-- Q1. Find all unique departments.
SELECT DISTINCT department
FROM employees;

-- Q2. Find all unique cities.
SELECT DISTINCT city
FROM employees;

-- Q3. Find all unique job titles.
SELECT DISTINCT job_title
FROM employees;

-- Q4. Find unique department and city combinations.
SELECT DISTINCT department, city
FROM employees;

-- Q5. Find unique department and salary combinations.
SELECT DISTINCT department, salary
FROM employees;