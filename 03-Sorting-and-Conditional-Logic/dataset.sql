-- DAY 3 — SORTING AND CONDITIONAL LOGIC
-- File: dataset.sql
-- Database: PostgreSQL


-- Remove old table if it exists
DROP TABLE IF EXISTS sales_orders;


-- Create fresh Day 3 dataset
CREATE TABLE sales_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    product VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    unit_price NUMERIC(10,2),
    total_amount NUMERIC(10,2),
    order_date DATE,
    payment_status VARCHAR(30),
    customer_rating NUMERIC(3,1)
);


-- Insert realistic Indian business data
INSERT INTO sales_orders
(order_id, customer_name, city, product, category, quantity,
 unit_price, total_amount, order_date, payment_status, customer_rating)
VALUES

(1001, 'Gaurav', 'Nashik', 'Laptop', 'Electronics', 1, 65000, 65000, '2026-01-05', 'Paid', 4.5),

(1002, 'Priya', 'Pune', 'Smartphone', 'Electronics', 2, 28000, 56000, '2026-01-07', 'Paid', 4.2),

(1003, 'Gayu', 'Mumbai', 'Office Chair', 'Furniture', 1, 12000, 12000, '2026-01-09', 'Pending', 4.0),

(1004, 'Suvarna', 'Nashik', 'Monitor', 'Electronics', 2, 18000, 36000, '2026-01-12', 'Paid', 4.7),

(1005, 'Anu', 'Pune', 'Keyboard', 'Accessories', 3, 2500, 7500, '2026-01-15', 'Paid', 3.8),

(1006, 'Hema', 'Mumbai', 'Desk', 'Furniture', 1, 15000, 15000, '2026-01-18', 'Pending', 4.1),

(1007, 'Hemant', 'Delhi', 'Headphones', 'Accessories', 2, 4500, 9000, '2026-01-20', 'Paid', 3.9),

(1008, 'Vishal', 'Pune', 'Laptop', 'Electronics', 2, 72000, 144000, '2026-01-22', 'Paid', 4.8),

(1009, 'Nitin', 'Bangalore', 'Tablet', 'Electronics', 1, 32000, 32000, '2026-01-25', 'Pending', 4.3),

(1010, 'Pooja', 'Mumbai', 'Mouse', 'Accessories', 5, 1200, 6000, '2026-01-27', 'Paid', 3.7),

(1011, 'Rahul', 'Delhi', 'Smartphone', 'Electronics', 1, 45000, 45000, '2026-02-02', 'Paid', 4.6),

(1012, 'Sneha', 'Pune', 'Bookshelf', 'Furniture', 2, 8500, 17000, '2026-02-05', 'Pending', 4.0),

(1013, 'Amit', 'Nashik', 'Monitor', 'Electronics', 1, 22000, 22000, '2026-02-08', 'Paid', 4.4),

(1014, 'Neha', 'Mumbai', 'Laptop', 'Electronics', 1, 58000, 58000, '2026-02-11', 'Paid', 4.7),

(1015, 'Kiran', 'Pune', 'Keyboard', 'Accessories', 4, 2200, 8800, '2026-02-14', 'Pending', 3.6),

(1016, 'Varun', 'Bangalore', 'Desk', 'Furniture', 2, 14000, 28000, '2026-02-17', 'Paid', 4.2),

(1017, 'Riya', 'Delhi', 'Headphones', 'Accessories', 3, 5000, 15000, '2026-02-20', 'Paid', 4.5),

(1018, 'Manish', 'Nashik', 'Smartphone', 'Electronics', 2, 30000, 60000, '2026-02-23', 'Pending', 4.1),

(1019, 'Kavya', 'Pune', 'Tablet', 'Electronics', 2, 29000, 58000, '2026-02-26', 'Paid', 4.6),

(1020, 'Aditya', 'Mumbai', 'Office Chair', 'Furniture', 3, 11000, 33000, '2026-03-01', 'Paid', 4.3),

(1021, 'Rohit', 'Delhi', 'Laptop', 'Electronics', 1, 68000, 68000, '2026-03-04', 'Paid', 4.9),

(1022, 'Shweta', 'Nashik', 'Mouse', 'Accessories', 6, 1000, 6000, '2026-03-07', 'Pending', 3.5),

(1023, 'Suvrat', 'Bangalore', 'Monitor', 'Electronics', 2, 20000, 40000, '2026-03-10', 'Paid', 4.4),

(1024, 'Aishwarya', 'Pune', 'Desk', 'Furniture', 1, 16000, 16000, '2026-03-13', 'Paid', 4.0),

(1025, 'Saurabh', 'Mumbai', 'Smartphone', 'Electronics', 3, 27000, 81000, '2026-03-16', 'Paid', 4.8);


-- Verify total records
SELECT COUNT(*) AS total_orders
FROM sales_orders;


-- View complete dataset
SELECT *
FROM sales_orders;