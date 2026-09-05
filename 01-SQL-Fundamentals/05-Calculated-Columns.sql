-- Day 1: Calculated Columns
-- Perform calculations directly inside SELECT

-- 1. Calculate annual salary
SELECT
    employee_name,
    salary,
    salary * 12 AS annual_salary
FROM employees;


-- 2. Calculate salary after a 10% increase
SELECT
    employee_name,
    salary,
    salary * 1.10 AS salary_after_hike
FROM employees;


-- 3. Calculate 20% bonus
SELECT
    employee_name,
    salary,
    salary * 0.20 AS bonus
FROM employees;


-- 4. Calculate salary + 20% bonus
SELECT
    employee_name,
    salary,
    salary * 1.20 AS total_compensation
FROM employees;


-- 5. Calculate remaining years to reach 10 years of experience
SELECT
    employee_name,
    experience_years,
    10 - experience_years AS years_to_10
FROM employees;



-- ============================================
-- PRACTICE ANSWERS
-- ============================================

-- Q1. Calculate annual salary.
SELECT
    employee_name,
    salary * 12 AS annual_salary
FROM employees;

-- Q2. Calculate a 15% salary hike.
SELECT
    employee_name,
    salary,
    salary * 1.15 AS salary_after_hike
FROM employees;

-- Q3. Calculate a 10% bonus.
SELECT
    employee_name,
    salary,
    salary * 0.10 AS bonus
FROM employees;

-- Q4. Calculate salary after adding a 10% bonus.
SELECT
    employee_name,
    salary,
    salary * 1.10 AS salary_with_bonus
FROM employees;

-- Q5. Calculate years needed to reach 10 years experience.
SELECT
    employee_name,
    experience_years,
    10 - experience_years AS years_to_10
FROM employees;