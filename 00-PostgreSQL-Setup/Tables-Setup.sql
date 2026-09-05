CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC
);





INSERT INTO employees
(employee_id, employee_name, department, job_title, salary, hire_date, city)
VALUES
(1, 'Amit Sharma', 'IT', 'Data Analyst', 55000, '2022-01-15', 'Pune'),
(2, 'Priya Patil', 'HR', 'HR Executive', 45000, '2021-06-10', 'Mumbai'),
(3, 'Rahul Joshi', 'IT', 'Software Engineer', 75000, '2020-03-20', 'Pune'),
(4, 'Sneha Kulkarni', 'Finance', 'Financial Analyst', 60000, '2023-02-05', 'Nashik'),
(5, 'Vikas Deshmukh', 'IT', 'Data Scientist', 90000, '2019-11-12', 'Pune'),
(6, 'Neha Shah', 'Marketing', 'Marketing Analyst', 50000, '2022-08-18', 'Mumbai'),
(7, 'Rohan Mehta', 'Finance', 'Accountant', 48000, '2021-12-05', 'Pune'),
(8, 'Anjali Rao', 'HR', 'Recruiter', 42000, '2023-05-18', 'Bangalore'),
(9, 'Karan Singh', 'IT', 'Backend Developer', 70000, '2020-09-25', 'Delhi'),
(10, 'Pooja More', 'Marketing', 'Marketing Manager', 70000, '2018-04-10', 'Mumbai');