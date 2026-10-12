
-- ============================================================
-- File: 00-Create-Dataset.sql
-- Project: SQL-Interview-Mastery
-- Database: PostgreSQL
-- Purpose: Practice dataset for advanced SQL patterns
-- ============================================================

-- 1. DROP TABLES IF THEY ALREADY EXIST
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;


-- ============================================================
-- 2. CREATE DEPARTMENTS TABLE
-- ============================================================

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'IT'),
    (2, 'HR'),
    (3, 'Sales');


-- ============================================================
-- 3. CREATE EMPLOYEES TABLE
-- ============================================================

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT REFERENCES departments(department_id),
    salary NUMERIC(10, 2) NOT NULL,
    hire_date DATE NOT NULL
);

INSERT INTO employees
    (employee_id, employee_name, department_id, salary, hire_date)
VALUES
    (1, 'Amit',   1, 90000, '2022-01-10'),
    (2, 'Priya',  1, 80000, '2022-02-15'),
    (3, 'Rahul',  1, 80000, '2023-01-20'),
    (4, 'Neha',   2, 60000, '2022-05-10'),
    (5, 'Sneha',  2, 50000, '2023-03-12'),
    (6, 'Karan',  3, 70000, '2023-06-15'),
    (7, 'Pooja',  3, 60000, '2024-01-05'),
    (8, 'Vikas',  3, 50000, '2024-02-10');


-- ============================================================
-- 4. CREATE CUSTOMERS TABLE
-- ============================================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50)
);

INSERT INTO customers (customer_id, customer_name, city)
VALUES
    (101, 'Customer A', 'Mumbai'),
    (102, 'Customer B', 'Pune'),
    (103, 'Customer C', 'Nashik'),
    (104, 'Customer D', 'Mumbai');


-- ============================================================
-- 5. CREATE ORDERS TABLE
-- ============================================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE NOT NULL,
    amount NUMERIC(10, 2) NOT NULL CHECK (amount >= 0)
);

INSERT INTO orders (order_id, customer_id, order_date, amount)
VALUES
    (1,  101, '2024-01-01', 1000),
    (2,  101, '2024-01-02', 1500),
    (3,  101, '2024-01-03', 2000),
    (4,  102, '2024-01-01', 1200),
    (5,  102, '2024-02-01', 1800),
    (6,  103, '2024-02-01', 2500),
    (7,  103, '2024-04-01', 3000),
    (8,  104, '2024-04-02', 1000),
    (9,  104, '2024-04-03', 2200),
    (10, 102, '2025-01-01', 3500);


-- ============================================================
-- 6. VERIFY THE DATA
-- ============================================================

SELECT * FROM departments ORDER BY department_id;

SELECT * FROM employees ORDER BY employee_id;

SELECT * FROM customers ORDER BY customer_id;

SELECT * FROM orders ORDER BY order_id;


-- ============================================================
-- 7. QUICK TEST: FIND REPEAT CUSTOMERS
-- Expected:
-- Customer IDs 101, 102, 103, and 104
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.amount) AS total_spending
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1
ORDER BY c.customer_id;


-- ============================================================
-- END OF DATASET
-- ============================================================
