
drop table employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    job_title VARCHAR(100),
    city VARCHAR(50),
    salary NUMERIC(10,2),
    experience_years INT,
    hire_date DATE
);

SELECT *
FROM employees;


INSERT INTO employees
(employee_id, employee_name, department, job_title, city, salary, experience_years, hire_date)
VALUES
(1001, 'Aarav Sharma', 'Data Analytics', 'Data Analyst', 'Pune', 65000.00, 2, '2023-06-15'),
(1002, 'Priya Mehta', 'Finance', 'Financial Analyst', 'Mumbai', 72000.00, 3, '2022-03-10'),
(1003, 'Rahul Verma', 'Technology', 'Software Engineer', 'Bengaluru', 95000.00, 5, '2020-08-21'),
(1004, 'Sneha Patil', 'Human Resources', 'HR Executive', 'Pune', 58000.00, 2, '2023-01-12'),
(1005, 'Aditya Joshi', 'Marketing', 'Marketing Analyst', 'Delhi', 68000.00, 3, '2022-07-18'),
(1006, 'Neha Kulkarni', 'Data Analytics', 'Data Scientist', 'Hyderabad', 105000.00, 4, '2021-11-05'),
(1007, 'Rohan Desai', 'Sales', 'Sales Executive', 'Mumbai', 55000.00, 2, '2023-04-27'),
(1008, 'Kavya Iyer', 'Technology', 'Backend Developer', 'Chennai', 88000.00, 4, '2021-09-14'),
(1009, 'Vikram Singh', 'Finance', 'Accountant', 'Delhi', 61000.00, 3, '2022-05-30'),
(1010, 'Ananya Rao', 'Data Analytics', 'BI Analyst', 'Bengaluru', 78000.00, 3, '2022-10-11'),
(1011, 'Siddharth Shah', 'Sales', 'Sales Manager', 'Ahmedabad', 92000.00, 6, '2019-02-19'),
(1012, 'Ishita Nair', 'Human Resources', 'Recruiter', 'Kochi', 62000.00, 3, '2022-12-01'),
(1013, 'Manish Gupta', 'Technology', 'Frontend Developer', 'Noida', 82000.00, 4, '2021-06-23'),
(1014, 'Pooja Deshmukh', 'Marketing', 'Marketing Manager', 'Pune', 85000.00, 5, '2020-04-16'),
(1015, 'Karan Malhotra', 'Data Analytics', 'ML Engineer', 'Bengaluru', 115000.00, 5, '2020-01-08');



SELECT *
FROM employees;

