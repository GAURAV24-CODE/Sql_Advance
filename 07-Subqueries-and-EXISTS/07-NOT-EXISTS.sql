-- Day 7: NOT EXISTS
-- Dataset: employees and departments
-- NOT EXISTS checks whether no matching row exists.


-- Example 1: Departments without employees

SELECT
    d.department_id,
    d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


-- Example 2: Departments without an employee
-- earning more than 80000

SELECT
    d.department_id,
    d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.salary > 80000
);


-- Example 3: Departments without an employee
-- having performance rating below 3.5

SELECT
    d.department_id,
    d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.performance_rating < 3.5
);


-- Example 4: Departments without an employee
-- having more than 5 years of experience

SELECT
    d.department_id,
    d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.experience_years > 5
);


-- Example 5: Employees without a matching department

SELECT
    e.employee_id,
    e.employee_name,
    e.department_id
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM departments d
    WHERE d.department_id = e.department_id
);


-- TCS NQT / LeetCode Style 1:
-- Find departments that do not have an employee
-- earning more than 70000.

SELECT
    d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.salary > 70000
);


-- TCS NQT / LeetCode Style 2:
-- Find departments that do not have an employee
-- with performance rating above 4.5.

SELECT
    d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.performance_rating > 4.5
);


-- TCS NQT / LeetCode Style 3:
-- Find departments that do not have an employee
-- with more than 4 years of experience.

SELECT
    d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.experience_years > 4
);


-- Hard 1:
-- Find departments where no employee earns
-- above the overall average salary.

SELECT
    d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.salary > (
          SELECT AVG(salary)
          FROM employees
      )
);


-- Hard 2:
-- Find departments where no employee earns
-- above that department's average salary.

SELECT
    d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.salary > (
          SELECT AVG(e2.salary)
          FROM employees e2
          WHERE e2.department_id = d.department_id
      )
);