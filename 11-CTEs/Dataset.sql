/*
=========================================================
FILE: Dataset.sql
SECTION: 11 - CTEs
DATABASE: PostgreSQL
PURPOSE: Sample dataset for CTE practice and interview questions
=========================================================

IMPORTANT:
This script drops the existing employees table if it exists.
Run it only if you are comfortable replacing that table and its data.
*/

-- =====================================================
-- 1. CREATE EMPLOYEES TABLE
-- =====================================================

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary NUMERIC(10, 2)
);

-- =====================================================
-- 2. INSERT SAMPLE EMPLOYEE DATA
-- =====================================================

INSERT INTO employees (name, department, salary)
VALUES
    ('Aarav Sharma', 'IT', 65000),
    ('Priya Patil', 'HR', 45000),
    ('Rahul Deshmukh', 'IT', 75000),
    ('Sneha Joshi', 'Finance', 55000),
    ('Vikram Shah', 'Sales', 40000),
    ('Ananya Kulkarni', 'IT', 85000),
    ('Rohan More', 'HR', 50000),
    ('Kavya Pawar', 'Finance', 60000),
    ('Aditya Jadhav', 'Sales', 48000),
    ('Neha Chavan', 'IT', 70000),
    ('Omkar Patil', 'Marketing', 52000),
    ('Isha Desai', 'Finance', 65000),
    ('Sahil Kulkarni', 'Sales', 55000),
    ('Pooja Shinde', 'Marketing', 58000),
    ('Yash Mehta', 'HR', 42000),
    ('Meera Joshi', 'IT', 90000),
    ('Kunal Pawar', 'Marketing', 62000),
    ('Riya Shah', 'Finance', 72000),
    ('Atharva More', 'Sales', 60000),
    ('Tanvi Deshmukh', 'HR', 48000);

-- =====================================================
-- 3. VERIFY THE DATA
-- =====================================================

SELECT *
FROM employees
ORDER BY employee_id;

-- =====================================================
-- 4. CHECK THE NUMBER OF EMPLOYEES
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM employees;

-- =====================================================
-- 5. CHECK DEPARTMENT-WISE EMPLOYEE COUNTS
-- =====================================================

SELECT
    department,
    COUNT(*) AS total_employees
FROM employees
GROUP BY department
ORDER BY department;

-- =====================================================
-- 6. CHECK DEPARTMENT-WISE AVERAGE SALARY
-- =====================================================

SELECT
    department,
    ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department
ORDER BY department;

-- =====================================================
-- END OF DATASET
-- =====================================================