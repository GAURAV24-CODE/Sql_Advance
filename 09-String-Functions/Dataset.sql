-- Day 9: SQL String Functions
-- PostgreSQL

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    phone VARCHAR(30),
    city VARCHAR(100),
    job_role VARCHAR(100)
);

INSERT INTO customers VALUES
(901, 'Gaurav Kumbhar', 'gaurav@gmail.com', '987-654-3210', 'Nashik', 'Data Analyst'),
(902, 'Priya Sharma', 'priya@yahoo.com', '987 111 2233', 'Pune', 'Data Scientist'),
(903, 'Rahul Patil', 'rahul@outlook.com', '982-222-3344', 'Mumbai', 'Software Developer'),
(904, 'Sneha Joshi', 'sneha@gmail.com', '981 333 4455', 'Nashik', 'Power BI Analyst'),
(905, 'Amit Verma', 'amit@yahoo.com', '980-444-5566', 'Delhi', 'Data Analyst'),
(906, 'Neha Kulkarni', 'neha@outlook.com', '979 555 6677', 'Pune', 'ML Engineer'),
(907, 'Pooja Deshmukh', 'pooja@gmail.com', '978-666-7788', 'Mumbai', 'Data Scientist'),
(908, 'Nitin Jadhav', 'nitin@yahoo.com', '977 777 8899', 'Delhi', 'BI Developer'),
(909, 'Hema More', 'hema@gmail.com', '976-888-9900', 'Nashik', 'Data Analyst'),
(910, 'Vishal Pawar', 'vishal@outlook.com', '975 999 0011', 'Pune', 'Software Developer'),
(911, 'Anu Patil', 'anu@gmail.com', '974-123-4567', 'Mumbai', 'Data Analyst'),
(912, 'Hemant Shinde', 'hemant@yahoo.com', '973 234 5678', 'Nashik', 'ML Engineer'),
(913, 'Suvarna Kale', 'suvarna@gmail.com', '972-345-6789', 'Pune', 'Power BI Analyst'),
(914, 'Gayu Patil', 'gayu@outlook.com', '971 456 7890', 'Delhi', 'Data Scientist'),
(915, 'Kiran More', 'kiran@gmail.com', '970-567-8901', 'Mumbai', 'BI Developer');

SELECT * FROM customers;