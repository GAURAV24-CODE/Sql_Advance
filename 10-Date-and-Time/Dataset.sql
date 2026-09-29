-- ============================================================
-- DAY 10 — DATE & TIME DATASET
-- ============================================================

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;

-- ============================================================
-- 1. ORDERS TABLE
-- ============================================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    product VARCHAR(100),
    amount NUMERIC(10,2),
    order_date DATE,
    order_timestamp TIMESTAMP,
    expected_delivery_date DATE,
    delivery_date DATE,
    order_status VARCHAR(30)
);

INSERT INTO orders VALUES
(1001, 'Gaurav', 'Nashik', 'Laptop', 65000, '2026-01-10', '2026-01-10 10:30:00', '2026-01-15', '2026-01-14', 'Delivered'),
(1002, 'Priya', 'Pune', 'Monitor', 18000, '2026-01-18', '2026-01-18 14:20:00', '2026-01-23', '2026-01-25', 'Delivered'),
(1003, 'Rahul', 'Mumbai', 'Keyboard', 2500, '2026-02-05', '2026-02-05 09:15:00', '2026-02-10', '2026-02-09', 'Delivered'),
(1004, 'Sneha', 'Nashik', 'Laptop', 72000, '2026-02-15', '2026-02-15 16:45:00', '2026-02-20', '2026-02-20', 'Delivered'),
(1005, 'Amit', 'Delhi', 'Monitor', 22000, '2026-03-03', '2026-03-03 11:10:00', '2026-03-08', '2026-03-07', 'Delivered'),
(1006, 'Neha', 'Pune', 'Mouse', 1500, '2026-03-19', '2026-03-19 13:25:00', '2026-03-24', '2026-03-26', 'Delivered'),
(1007, 'Pooja', 'Mumbai', 'Headphones', 4500, '2026-04-07', '2026-04-07 17:30:00', '2026-04-12', '2026-04-11', 'Delivered'),
(1008, 'Nitin', 'Delhi', 'Laptop', 68000, '2026-04-21', '2026-04-21 10:05:00', '2026-04-26', '2026-04-28', 'Delivered'),
(1009, 'Hema', 'Nashik', 'Keyboard', 3000, '2026-05-12', '2026-05-12 15:40:00', '2026-05-17', '2026-05-16', 'Delivered'),
(1010, 'Vishal', 'Pune', 'Monitor', 21000, '2026-05-29', '2026-05-29 12:15:00', '2026-06-03', '2026-06-02', 'Delivered'),
(1011, 'Anu', 'Mumbai', 'Laptop', 75000, '2026-06-08', '2026-06-08 09:45:00', '2026-06-13', '2026-06-15', 'Delivered'),
(1012, 'Hemant', 'Nashik', 'Mouse', 1800, '2026-06-25', '2026-06-25 18:20:00', '2026-06-30', '2026-06-29', 'Delivered'),
(1013, 'Suvarna', 'Pune', 'Headphones', 5200, '2026-07-11', '2026-07-11 11:35:00', '2026-07-16', '2026-07-17', 'Delivered'),
(1014, 'Gayu', 'Delhi', 'Laptop', 70000, '2026-07-28', '2026-07-28 14:50:00', '2026-08-02', '2026-08-01', 'Delivered'),
(1015, 'Kiran', 'Mumbai', 'Monitor', 24000, '2026-08-06', '2026-08-06 10:20:00', '2026-08-11', '2026-08-10', 'Delivered'),
(1016, 'Gaurav', 'Nashik', 'Keyboard', 3200, '2026-08-19', '2026-08-19 16:10:00', '2026-08-24', '2026-08-23', 'Delivered'),
(1017, 'Priya', 'Pune', 'Laptop', 80000, '2026-09-02', '2026-09-02 09:30:00', '2026-09-07', NULL, 'Shipped'),
(1018, 'Rahul', 'Mumbai', 'Mouse', 1700, '2026-09-08', '2026-09-08 13:40:00', '2026-09-13', NULL, 'Shipped'),
(1019, 'Sneha', 'Nashik', 'Monitor', 23000, '2026-09-15', '2026-09-15 17:15:00', '2026-09-20', NULL, 'Processing'),
(1020, 'Neha', 'Pune', 'Laptop', 76000, '2026-09-22', '2026-09-22 11:55:00', '2026-09-27', NULL, 'Processing');

-- ============================================================
-- 2. EMPLOYEES TABLE
-- ============================================================

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50),
    joining_date DATE,
    salary NUMERIC(10,2)
);

INSERT INTO employees VALUES
(201, 'Gaurav', 'Analytics', 'Nashik', '2021-06-15', 65000),
(202, 'Priya', 'Data Science', 'Pune', '2020-08-10', 75000),
(203, 'Rahul', 'IT', 'Mumbai', '2022-01-20', 58000),
(204, 'Sneha', 'Analytics', 'Nashik', '2019-11-05', 82000),
(205, 'Amit', 'Finance', 'Delhi', '2023-03-12', 52000),
(206, 'Neha', 'Data Science', 'Pune', '2021-09-18', 72000),
(207, 'Pooja', 'HR', 'Mumbai', '2022-07-25', 50000),
(208, 'Nitin', 'IT', 'Delhi', '2018-12-10', 88000),
(209, 'Hema', 'Analytics', 'Nashik', '2024-02-14', 48000),
(210, 'Vishal', 'BI', 'Pune', '2020-05-22', 68000);

-- ============================================================
-- 3. CUSTOMERS TABLE
-- ============================================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    birth_date DATE,
    last_order_date DATE
);

INSERT INTO customers VALUES
(301, 'Gaurav', 'Nashik', '2000-05-15', '2026-09-22'),
(302, 'Priya', 'Pune', '1999-08-20', '2026-09-15'),
(303, 'Rahul', 'Mumbai', '1998-02-10', '2026-09-08'),
(304, 'Sneha', 'Nashik', '2001-11-25', '2026-08-19'),
(305, 'Amit', 'Delhi', '1997-04-12', '2026-07-28'),
(306, 'Neha', 'Pune', '2000-09-18', '2026-09-22'),
(307, 'Pooja', 'Mumbai', '1999-01-30', '2026-08-06'),
(308, 'Nitin', 'Delhi', '1996-06-05', '2026-05-29'),
(309, 'Hema', 'Nashik', '2002-03-14', '2026-05-12'),
(310, 'Vishal', 'Pune', '1998-12-22', '2026-05-29'),
(311, 'Anu', 'Mumbai', '2001-07-09', '2026-06-08'),
(312, 'Hemant', 'Nashik', '1997-10-16', '2026-06-25'),
(313, 'Suvarna', 'Pune', '2000-01-05', '2026-07-11'),
(314, 'Gayu', 'Delhi', '1999-09-27', '2026-07-28'),
(315, 'Kiran', 'Mumbai', '1998-04-19', '2026-08-06');

-- ============================================================
-- VIEW DATA
-- ============================================================

SELECT * FROM orders;

SELECT * FROM employees;

SELECT * FROM customers;