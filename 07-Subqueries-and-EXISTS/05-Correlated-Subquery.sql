-- Day 7: Correlated Subquery
-- Dataset: employees and departments
-- Correlated subquery depends on the current row
-- of the outer query.


-- Example 1: Employees earning more than
-- the average salary of their own department

SELECT
    e.employee_name,
    e.department_id,
    e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- Example 2: Employees with the highest salary
-- in their own department

SELECT
    e.employee_name,
    e.department_id,
    e.salary
FROM employees e
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- Example 3: Employees with performance rating
-- above their department's average rating

SELECT
    e.employee_name,
    e.department_id,
    e.performance_rating
FROM employees e
WHERE e.performance_rating > (
    SELECT AVG(e2.performance_rating)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- Example 4: Employees with more experience
-- than the average experience of their department

SELECT
    e.employee_name,
    e.department_id,
    e.experience_years
FROM employees e
WHERE e.experience_years > (
    SELECT AVG(e2.experience_years)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- Example 5: Lowest-paid employee in each department

SELECT
    e.employee_name,
    e.department_id,
    e.salary
FROM employees e
WHERE e.salary = (
    SELECT MIN(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- TCS NQT / LeetCode Style 1:
-- Find employees earning more than their
-- department's average salary.

SELECT
    e.employee_name,
    e.salary,
    e.department_id
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- TCS NQT / LeetCode Style 2:
-- Find the highest-paid employee in each department.

SELECT
    e.employee_name,
    e.department_id,
    e.salary
FROM employees e
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- TCS NQT / LeetCode Style 3:
-- Find employees whose performance rating is
-- greater than their department's average rating.

SELECT
    e.employee_name,
    e.department_id,
    e.performance_rating
FROM employees e
WHERE e.performance_rating > (
    SELECT AVG(e2.performance_rating)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- Hard 1:
-- Find employees whose salary is above their
-- department average and whose performance rating
-- is also above their department average.

SELECT
    e.employee_name,
    e.department_id,
    e.salary,
    e.performance_rating
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
)
AND e.performance_rating > (
    SELECT AVG(e2.performance_rating)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- Hard 2:
-- Find employees who have the maximum salary
-- in their department and performance rating
-- above the department average.

SELECT
    e.employee_name,
    e.department_id,
    e.salary,
    e.performance_rating
FROM employees e
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
)
AND e.performance_rating > (
    SELECT AVG(e2.performance_rating)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);