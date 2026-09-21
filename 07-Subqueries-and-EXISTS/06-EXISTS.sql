-- Day 7: EXISTS
-- Dataset: employees and departments
-- EXISTS checks whether at least one matching row exists.


-- Example 1: Departments that have employees

SELECT
    d.department_id,
    d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


-- Example 2: Departments having at least one employee
-- earning more than 80000

SELECT
    d.department_id,
    d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.salary > 80000
);


-- Example 3: Departments having at least one employee
-- with performance rating >= 4.5

SELECT
    d.department_id,
    d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.performance_rating >= 4.5
);


-- Example 4: Departments having an employee
-- with more than 5 years of experience

SELECT
    d.department_id,
    d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.experience_years > 5
);


-- Example 5: Employees whose department exists
-- in the departments table

SELECT
    e.employee_id,
    e.employee_name,
    e.department_id
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE d.department_id = e.department_id
);


-- TCS NQT / LeetCode Style 1:
-- Find departments having at least one employee
-- earning more than 70000.

SELECT
    d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.salary > 70000
);


-- TCS NQT / LeetCode Style 2:
-- Find departments having at least one employee
-- with performance rating above 4.5.

SELECT
    d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.performance_rating > 4.5
);


-- TCS NQT / LeetCode Style 3:
-- Find departments having at least one employee
-- with more than 4 years of experience.

SELECT
    d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.experience_years > 4
);


-- Hard 1:
-- Find departments having at least one employee
-- whose salary is greater than the overall average salary.

SELECT
    d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.salary > (
          SELECT AVG(salary)
          FROM employees
      )
);


-- Hard 2:
-- Find departments having at least one employee
-- whose salary is above the department average.

SELECT
    d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.salary > (
          SELECT AVG(e2.salary)
          FROM employees e2
          WHERE e2.department_id = d.department_id
      )
);