-- Day 7: WHERE Subquery
-- Dataset: employees and departments
-- WHERE subqueries filter rows using the result of another query.


-- Example 1: Employees earning above the overall average salary

SELECT
    employee_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


-- Example 2: Employees working in departments located in Pune

SELECT
    employee_name,
    department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Pune'
);


-- Example 3: Employees not working in departments located in Mumbai

SELECT
    employee_name,
    department_id
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Mumbai'
);


-- Example 4: Employees with performance rating above 4.5

SELECT
    employee_name,
    performance_rating
FROM employees
WHERE performance_rating > 4.5;


-- Example 5: Employees earning the maximum salary

SELECT
    employee_name,
    salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


-- TCS NQT / LeetCode Style 1:
-- Find employees working in the Analytics department.

SELECT
    employee_name,
    department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name = 'Analytics'
);


-- TCS NQT / LeetCode Style 2:
-- Find employees working in departments located in Nashik.

SELECT
    employee_name,
    department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Nashik'
);


-- TCS NQT / LeetCode Style 3:
-- Find employees earning more than the average salary.

SELECT
    employee_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


-- Hard 1:
-- Find employees who earn more than the average salary
-- of employees in the Analytics department.

SELECT
    employee_name,
    salary,
    department_id
FROM employees
WHERE salary > (
    SELECT AVG(e.salary)
    FROM employees e
    JOIN departments d
        ON e.department_id = d.department_id
    WHERE d.department_name = 'Analytics'
);


-- Hard 2:
-- Find employees working in departments that have
-- at least one employee with a performance rating above 4.5.

SELECT
    employee_name,
    department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM employees
    WHERE performance_rating > 4.5
);