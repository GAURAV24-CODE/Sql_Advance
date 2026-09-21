-- Day 7: Scalar Subquery
-- Dataset: employees
-- Scalar subquery returns exactly one value.


-- Example 1: Employees earning above average salary

SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


-- Example 2: Employee with the highest salary

SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


-- Example 3: Employee with the lowest salary

SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);


-- Example 4: Employees earning below average salary

SELECT employee_name, salary
FROM employees
WHERE salary < (
    SELECT AVG(salary)
    FROM employees
);


-- Example 5: Employees with performance above average

SELECT employee_name, performance_rating
FROM employees
WHERE performance_rating > (
    SELECT AVG(performance_rating)
    FROM employees
);


-- TCS NQT / LeetCode Style 1:
-- Find employees earning more than the average salary.

SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


-- TCS NQT / LeetCode Style 2:
-- Find the employee(s) with the maximum salary.

SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


-- TCS NQT / LeetCode Style 3:
-- Find employees whose experience is greater than average experience.

SELECT employee_name, experience_years
FROM employees
WHERE experience_years > (
    SELECT AVG(experience_years)
    FROM employees
);


-- Hard 1:
-- Find employees whose salary is greater than
-- the average salary but performance rating is
-- also greater than average performance rating.

SELECT
    employee_name,
    salary,
    performance_rating
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
AND performance_rating > (
    SELECT AVG(performance_rating)
    FROM employees
);


-- Hard 2:
-- Find employees whose salary is equal to the
-- second-highest distinct salary.

SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);