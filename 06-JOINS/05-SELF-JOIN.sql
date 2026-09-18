-- SELF JOIN
-- Day 6: JOINs
-- PostgreSQL


-- Example 1: Show employees with their managers
SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.employee_id;


-- Example 2: Show employee and manager departments
SELECT
    e.employee_name AS employee,
    e.department AS employee_department,
    m.employee_name AS manager,
    m.department AS manager_department
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.employee_id;


-- Example 3: Find employees who have a manager
SELECT
    e.employee_name,
    m.employee_name AS manager
FROM employees AS e
INNER JOIN employees AS m
    ON e.manager_id = m.employee_id;


-- Example 4: Find employees working in the same department
SELECT
    e1.employee_name AS employee_1,
    e2.employee_name AS employee_2,
    e1.department
FROM employees AS e1
JOIN employees AS e2
    ON e1.department = e2.department
   AND e1.employee_id < e2.employee_id;


-- Example 5: Find employees reporting to Gaurav
SELECT
    e.employee_name,
    e.department
FROM employees AS e
JOIN employees AS m
    ON e.manager_id = m.employee_id
WHERE m.employee_name = 'Gaurav';


-- TCS NQT / LeetCode-Style Questions


-- Q1: Display each employee and their manager
SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.employee_id;


-- Q2: Find employees who do not have a manager
SELECT
    employee_id,
    employee_name
FROM employees
WHERE manager_id IS NULL;


-- Q3: Find employees and their manager's department
SELECT
    e.employee_name,
    m.department AS manager_department
FROM employees AS e
JOIN employees AS m
    ON e.manager_id = m.employee_id;


-- Hard SQL Questions


-- Q4: Count employees reporting to each manager
SELECT
    m.employee_name AS manager,
    COUNT(e.employee_id) AS employee_count
FROM employees AS m
JOIN employees AS e
    ON e.manager_id = m.employee_id
GROUP BY m.employee_name
ORDER BY employee_count DESC;


 Find pairs of employees working in the same department
SELECT
    e1.employee_name AS employee_1,
    e2.employee_name AS employee_2,
    e1.department
FROM employees AS e1
JOIN employees AS e2
    ON e1.department = e2.department
   AND e1.employee_id < e2.employee_id
ORDER BY e1.department;