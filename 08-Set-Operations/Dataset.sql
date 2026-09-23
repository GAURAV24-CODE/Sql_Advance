-- Day 8: SQL Set Operations
-- dataset.sql
-- PostgreSQL
-- Run this file before practicing Day 8 topics.

DROP TABLE IF EXISTS online_orders;
DROP TABLE IF EXISTS store_orders;
DROP TABLE IF EXISTS customers_2025;
DROP TABLE IF EXISTS customers_2026;


-- =========================================
-- CUSTOMERS 2025
-- =========================================

CREATE TABLE customers_2025 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    category VARCHAR(50)
);

INSERT INTO customers_2025
    (customer_id, customer_name, city, category)
VALUES
    (501, 'Gaurav', 'Nashik', 'Retail'),
    (502, 'Priya', 'Pune', 'Retail'),
    (503, 'Rahul', 'Mumbai', 'Corporate'),
    (504, 'Sneha', 'Nashik', 'Retail'),
    (505, 'Amit', 'Delhi', 'Corporate'),
    (506, 'Neha', 'Pune', 'Retail'),
    (507, 'Pooja', 'Mumbai', 'Retail'),
    (508, 'Nitin', 'Delhi', 'Corporate'),
    (509, 'Hema', 'Nashik', 'Retail'),
    (510, 'Vishal', 'Pune', 'Corporate');


-- =========================================
-- CUSTOMERS 2026
-- =========================================

CREATE TABLE customers_2026 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    category VARCHAR(50)
);

INSERT INTO customers_2026
    (customer_id, customer_name, city, category)
VALUES
    (601, 'Priya', 'Pune', 'Retail'),
    (602, 'Rahul', 'Mumbai', 'Corporate'),
    (603, 'Kiran', 'Bangalore', 'Retail'),
    (604, 'Riya', 'Nashik', 'Retail'),
    (605, 'Amit', 'Delhi', 'Corporate'),
    (606, 'Anu', 'Pune', 'Retail'),
    (607, 'Pooja', 'Mumbai', 'Retail'),
    (608, 'Hemant', 'Nashik', 'Corporate'),
    (609, 'Suvarna', 'Bangalore', 'Retail'),
    (610, 'Gayu', 'Pune', 'Retail');


-- =========================================
-- ONLINE ORDERS
-- =========================================

CREATE TABLE online_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    product VARCHAR(100),
    amount NUMERIC(10,2),
    order_date DATE
);

INSERT INTO online_orders
    (order_id, customer_name, city, product, amount, order_date)
VALUES
    (7001, 'Gaurav', 'Nashik', 'Laptop', 65000, '2026-01-10'),
    (7002, 'Priya', 'Pune', 'Monitor', 18000, '2026-01-12'),
    (7003, 'Rahul', 'Mumbai', 'Keyboard', 2500, '2026-01-15'),
    (7004, 'Sneha', 'Nashik', 'Laptop', 72000, '2026-01-20'),
    (7005, 'Neha', 'Pune', 'Mouse', 1500, '2026-02-02'),
    (7006, 'Pooja', 'Mumbai', 'Headphones', 4500, '2026-02-08'),
    (7007, 'Amit', 'Delhi', 'Monitor', 22000, '2026-02-14'),
    (7008, 'Riya', 'Nashik', 'Keyboard', 3000, '2026-02-18');


-- =========================================
-- STORE ORDERS
-- =========================================

CREATE TABLE store_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    product VARCHAR(100),
    amount NUMERIC(10,2),
    order_date DATE
);

INSERT INTO store_orders
    (order_id, customer_name, city, product, amount, order_date)
VALUES
    (8001, 'Priya', 'Pune', 'Laptop', 68000, '2026-01-11'),
    (8002, 'Rahul', 'Mumbai', 'Monitor', 19000, '2026-01-16'),
    (8003, 'Kiran', 'Bangalore', 'Mouse', 1600, '2026-01-22'),
    (8004, 'Amit', 'Delhi', 'Laptop', 75000, '2026-02-01'),
    (8005, 'Pooja', 'Mumbai', 'Keyboard', 2800, '2026-02-07'),
    (8006, 'Anu', 'Pune', 'Headphones', 5000, '2026-02-15'),
    (8007, 'Hemant', 'Nashik', 'Monitor', 21000, '2026-02-20'),
    (8008, 'Gayu', 'Pune', 'Mouse', 1700, '2026-02-25');


-- =========================================
-- VERIFY DATA
-- =========================================

SELECT * FROM customers_2025;
SELECT * FROM customers_2026;
SELECT * FROM online_orders;
SELECT * FROM store_orders;