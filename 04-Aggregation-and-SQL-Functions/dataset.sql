
DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    product VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    amount NUMERIC(10,2),
    payment_method VARCHAR(30),
    transaction_date DATE,
    transaction_status VARCHAR(30)
);

INSERT INTO transactions
(transaction_id, customer_name, city, product, category, quantity,
 amount, payment_method, transaction_date, transaction_status)
VALUES
(2001, 'Gaurav', 'Nashik', 'Laptop', 'Electronics', 1, 65000, 'UPI', '2026-01-05', 'Completed'),
(2002, 'Priya', 'Pune', 'Smartphone', 'Electronics', 2, 56000, 'Card', '2026-01-07', 'Completed'),
(2003, 'Rahul', 'Mumbai', 'Office Chair', 'Furniture', 1, 12000, 'UPI', '2026-01-10', 'Pending'),
(2004, 'Sneha', 'Nashik', 'Monitor', 'Electronics', 2, 36000, 'Card', '2026-01-12', 'Completed'),
(2005, 'Amit', 'Pune', 'Keyboard', 'Accessories', 3, 7500, 'Cash', '2026-01-15', 'Completed'),
(2006, 'Neha', 'Mumbai', 'Desk', 'Furniture', 1, 15000, 'UPI', '2026-01-18', 'Cancelled'),
(2007, 'Rohit', 'Delhi', 'Headphones', 'Accessories', 2, 9000, 'Card', '2026-01-20', 'Completed'),
(2008, 'Vishal', 'Pune', 'Laptop', 'Electronics', 2, 144000, 'UPI', '2026-01-22', 'Completed'),
(2009, 'Pooja', 'Mumbai', 'Tablet', 'Electronics', 1, 32000, 'Card', '2026-01-25', 'Pending'),
(2010, 'Kiran', 'Nashik', 'Mouse', 'Accessories', 5, 6000, 'Cash', '2026-01-27', 'Completed'),
(2011, 'Varun', 'Delhi', 'Smartphone', 'Electronics', 1, 45000, 'UPI', '2026-02-02', 'Completed'),
(2012, 'Riya', 'Pune', 'Bookshelf', 'Furniture', 2, 17000, 'Card', '2026-02-05', 'Pending'),
(2013, 'Manish', 'Nashik', 'Monitor', 'Electronics', 1, 22000, 'UPI', '2026-02-08', 'Completed'),
(2014, 'Kavya', 'Mumbai', 'Laptop', 'Electronics', 1, 58000, 'Card', '2026-02-11', 'Completed'),
(2015, 'Aditya', 'Pune', 'Keyboard', 'Accessories', 4, 8800, 'UPI', '2026-02-14', 'Cancelled'),
(2016, 'Nitin', 'Bangalore', 'Desk', 'Furniture', 2, 28000, 'Card', '2026-02-17', 'Completed'),
(2017, 'Aishwarya', 'Delhi', 'Headphones', 'Accessories', 3, 15000, 'UPI', '2026-02-20', 'Completed'),
(2018, 'Saurabh', 'Nashik', 'Smartphone', 'Electronics', 2, 60000, 'Card', '2026-02-23', 'Pending'),
(2019, 'Hema', 'Pune', 'Tablet', 'Electronics', 2, 58000, 'UPI', '2026-02-26', 'Completed'),
(2020, 'Suvarna', 'Mumbai', 'Office Chair', 'Furniture', 3, 33000, 'Card', '2026-03-01', 'Completed');

SELECT COUNT(*) AS total_transactions
FROM transactions;

SELECT *
FROM transactions;
