-- DAY 2 — FILTERING DATA
-- File: dataset.sql
-- Database: PostgreSQL
-- Purpose: Practice WHERE and Filtering


-- Drop table if it already exists
DROP TABLE IF EXISTS employees;


-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50),
    job_role VARCHAR(100),
    salary NUMERIC(10,2),
    age INT,
    experience_years INT,
    joining_year INT,
    performance_rating NUMERIC(3,1)
);


-- Insert realistic sample data
INSERT INTO employees
(employee_id, employee_name, department, city, job_role, salary, age, experience_years, joining_year, performance_rating)
VALUES

(101, 'Gaurav', 'IT', 'Pune', 'Data Analyst', 60000, 24, 2, 2024, 4.2),

(102, 'Priya', 'HR', 'Mumbai', 'HR Executive', 55000, 26, 3, 2023, 4.0),

(103, 'Gayu', 'IT', 'Pune', 'Data Scientist', 85000, 28, 5, 2021, 4.7),

(104, 'Suvarna', 'Finance', 'Nashik', 'Financial Analyst', 65000, 27, 4, 2022, 4.3),

(105, 'Anu', 'Marketing', 'Mumbai', 'Marketing Analyst', 50000, 23, 1, 2025, 3.8),

(106, 'Hema', 'IT', 'Nashik', 'Software Engineer', 75000, 25, 3, 2023, 4.5),

(107, 'Hemant', 'HR', 'Pune', 'Recruiter', 48000, 22, 1, 2025, 3.6),

(108, 'Vishal', 'Finance', 'Mumbai', 'Accountant', 58000, 29, 6, 2020, 4.1),

(109, 'Nitin', 'IT', 'Bangalore', 'ML Engineer', 95000, 30, 7, 2019, 4.8),

(110, 'Pooja', 'Sales', 'Pune', 'Sales Executive', 52000, 24, 2, 2024, 3.9),

(111, 'Rahul', 'Marketing', 'Delhi', 'Marketing Manager', 72000, 31, 8, 2018, 4.6),

(112, 'Sneha', 'IT', 'Mumbai', 'Backend Developer', 80000, 27, 4, 2022, 4.4),

(113, 'Amit', 'Finance', 'Pune', 'Financial Analyst', 62000, 26, 3, 2023, 4.2),

(114, 'Neha', 'Sales', 'Delhi', 'Sales Manager', 70000, 32, 9, 2017, 4.5),

(115, 'Kiran', 'HR', 'Nashik', 'HR Manager', 68000, 30, 7, 2019, 4.4),

(116, 'Varun', 'IT', 'Bangalore', 'Data Engineer', 90000, 29, 6, 2020, 4.7),

(117, 'Riya', 'Marketing', 'Pune', 'Content Specialist', 45000, 21, 1, 2025, 3.5),

(118, 'Manish', 'Sales', 'Mumbai', 'Sales Executive', 55000, 25, 3, 2023, 4.0),

(119, 'Kavya', 'Finance', 'Nashik', 'Accountant', 56000, 24, 2, 2024, 3.9),

(120, 'Aditya', 'IT', 'Delhi', 'DevOps Engineer', 88000, 28, 5, 2021, 4.6),

(121, 'Rohit', 'IT', 'Pune', 'Python Developer', 67000, 26, 3, 2023, 4.1),

(122, 'Shweta', 'HR', 'Mumbai', 'HR Analyst', 59000, 27, 4, 2022, 4.2),

(123, 'Suvrat', 'Finance', 'Delhi', 'Finance Manager', 78000, 33, 10, 2016, 4.7),

(124, 'Aishwarya', 'Marketing', 'Nashik', 'SEO Analyst', 54000, 24, 2, 2024, 3.9),

(125, 'Saurabh', 'Sales', 'Pune', 'Sales Executive', 51000, 23, 1, 2025, 3.7);


-- Verify total records
SELECT COUNT(*) AS total_employees
FROM employees;


-- View complete dataset
SELECT *
FROM employees;