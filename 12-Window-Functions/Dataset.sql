-- ============================================================
-- Day 12 - SQL Window Functions
-- Dataset.sql
-- PostgreSQL
-- ============================================================

-- Remove existing table if it already exists
DROP TABLE IF EXISTS employees;

-- Create employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary NUMERIC(10, 2)
);

-- Insert sample employee data
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

-- ============================================================
-- Verify Dataset
-- ============================================================

SELECT *
FROM employees
ORDER BY employee_id;

-- Check total employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- Check departments
SELECT DISTINCT department
FROM employees
ORDER BY department;

-- Check salary range
SELECT
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary,
    ROUND(AVG(salary), 2) AS average_salary
FROM employees;