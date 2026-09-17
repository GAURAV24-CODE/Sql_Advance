DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    product VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    amount NUMERIC(10,2),
    payment_method VARCHAR(30),
    sales_date DATE,
    sales_status VARCHAR(30)
);

INSERT INTO sales
(sale_id, customer_name, city, product, category, quantity,
 amount, payment_method, sales_date, sales_status)
VALUES
(3001, 'Gaurav', 'Nashik', 'Laptop', 'Electronics', 1, 65000, 'UPI', '2026-01-05', 'Completed'),
(3002, 'Priya', 'Pune', 'Smartphone', 'Electronics', 2, 56000, 'Card', '2026-01-06', 'Completed'),
(3003, 'Rahul', 'Mumbai', 'Office Chair', 'Furniture', 1, 12000, 'UPI', '2026-01-08', 'Pending'),
(3004, 'Sneha', 'Nashik', 'Monitor', 'Electronics', 2, 36000, 'Card', '2026-01-10', 'Completed'),
(3005, 'Amit', 'Pune', 'Keyboard', 'Accessories', 3, 7500, 'Cash', '2026-01-12', 'Completed'),
(3006, 'Neha', 'Mumbai', 'Desk', 'Furniture', 1, 15000, 'UPI', '2026-01-14', 'Cancelled'),
(3007, 'Rohit', 'Delhi', 'Headphones', 'Accessories', 2, 9000, 'Card', '2026-01-16', 'Completed'),
(3008, 'Vishal', 'Pune', 'Laptop', 'Electronics', 2, 144000, 'UPI', '2026-01-18', 'Completed'),
(3009, 'Pooja', 'Mumbai', 'Tablet', 'Electronics', 1, 32000, 'Card', '2026-01-20', 'Pending'),
(3010, 'Kiran', 'Nashik', 'Mouse', 'Accessories', 5, 6000, 'Cash', '2026-01-22', 'Completed'),
(3011, 'Varun', 'Delhi', 'Smartphone', 'Electronics', 1, 45000, 'UPI', '2026-02-02', 'Completed'),
(3012, 'Riya', 'Pune', 'Bookshelf', 'Furniture', 2, 17000, 'Card', '2026-02-04', 'Pending'),
(3013, 'Manish', 'Nashik', 'Monitor', 'Electronics', 1, 22000, 'UPI', '2026-02-06', 'Completed'),
(3014, 'Kavya', 'Mumbai', 'Laptop', 'Electronics', 1, 58000, 'Card', '2026-02-08', 'Completed'),
(3015, 'Aditya', 'Pune', 'Keyboard', 'Accessories', 4, 8800, 'UPI', '2026-02-10', 'Cancelled'),
(3016, 'Nitin', 'Bangalore', 'Desk', 'Furniture', 2, 28000, 'Card', '2026-02-12', 'Completed'),
(3017, 'Aishwarya', 'Delhi', 'Headphones', 'Accessories', 3, 15000, 'UPI', '2026-02-14', 'Completed'),
(3018, 'Saurabh', 'Nashik', 'Smartphone', 'Electronics', 2, 60000, 'Card', '2026-02-16', 'Pending'),
(3019, 'Hema', 'Pune', 'Tablet', 'Electronics', 2, 58000, 'UPI', '2026-02-18', 'Completed'),
(3020, 'Suvarna', 'Mumbai', 'Office Chair', 'Furniture', 3, 33000, 'Card', '2026-02-20', 'Completed');




select * from sales;