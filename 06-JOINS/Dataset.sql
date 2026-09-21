
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO customers
(customer_id, customer_name, city, email)
VALUES
(101, 'Gaurav', 'Nashik', 'gaurav@gmail.com'),
(102, 'Priya', 'Pune', 'priya@gmail.com'),
(103, 'Rahul', 'Mumbai', 'rahul@gmail.com'),
(104, 'Sneha', 'Nashik', 'sneha@gmail.com'),
(105, 'Amit', 'Pune', 'amit@gmail.com'),
(106, 'Neha', 'Mumbai', 'neha@gmail.com'),
(107, 'Rohit', 'Delhi', 'rohit@gmail.com'),
(108, 'Pooja', 'Nashik', 'pooja@gmail.com'),
(109, 'Kiran', 'Bangalore', 'kiran@gmail.com'),
(110, 'Riya', 'Pune', 'riya@gmail.com');


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2)
);

INSERT INTO products
(product_id, product_name, category, price)
VALUES
(201, 'Laptop', 'Electronics', 65000),
(202, 'Smartphone', 'Electronics', 45000),
(203, 'Office Chair', 'Furniture', 12000),
(204, 'Monitor', 'Electronics', 18000),
(205, 'Keyboard', 'Accessories', 2500),
(206, 'Headphones', 'Accessories', 4500),
(207, 'Desk', 'Furniture', 15000),
(208, 'Tablet', 'Electronics', 32000),
(209, 'Mouse', 'Accessories', 1200),
(210, 'Bookshelf', 'Furniture', 8500),
(211, 'Webcam', 'Electronics', 6000);



--CREATE ORDERS TABLES
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_amount NUMERIC(10,2),
    order_date DATE,
    order_status VARCHAR(30),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

INSERT INTO orders
(order_id, customer_id, product_id, quantity, total_amount, order_date, order_status)
VALUES
(5001, 101, 201, 1, 65000, '2026-01-05', 'Completed'),
(5002, 102, 202, 2, 90000, '2026-01-07', 'Completed'),
(5003, 103, 203, 1, 12000, '2026-01-10', 'Pending'),
(5004, 104, 204, 2, 36000, '2026-01-12', 'Completed'),
(5005, 105, 205, 3, 7500, '2026-01-15', 'Completed'),
(5006, 106, 207, 1, 15000, '2026-01-18', 'Cancelled'),
(5007, 107, 206, 2, 9000, '2026-01-20', 'Completed'),
(5008, 108, 201, 2, 130000, '2026-01-22', 'Completed'),
(5009, 103, 208, 1, 32000, '2026-01-25', 'Pending'),
(5010, 109, 209, 5, 6000, '2026-01-28', 'Completed'),
(5011, 102, 204, 1, 18000, '2026-02-02', 'Completed'),
(5012, 105, 210, 2, 17000, '2026-02-05', 'Pending'),
(5013, 101, 202, 1, 45000, '2026-02-08', 'Completed'),
(5014, 104, 201, 1, 65000, '2026-02-10', 'Completed'),
(5015, 110, 205, 4, 10000, '2026-02-12', 'Cancelled'),
(5016, 107, 206, 3, 13500, '2026-02-15', 'Completed'),
(5017, 108, 208, 2, 64000, '2026-02-18', 'Completed'),
(5018, 103, 207, 2, 30000, '2026-02-20', 'Pending'),
(5019, 102, 202, 1, 45000, '2026-02-22', 'Completed'),
(5020, 105, 203, 2, 24000, '2026-02-25', 'Completed'),
(5021, 101, 211, 1, 6000, '2026-02-27', 'Completed'),
(5022, 110, 208, 1, 32000, '2026-03-01', 'Completed');



SELECT * FROM customers;

SELECT * FROM products;

