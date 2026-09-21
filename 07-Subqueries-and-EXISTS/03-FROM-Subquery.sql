-- Day 7: FROM Subquery
-- Dataset: employees and departments
-- FROM subquery = Derived Table


-- Example 1: Average salary by department

SELECT *
FROM (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_salary;


-- Example 2: Departments with average salary above 60000

SELECT *
FROM (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_salary
WHERE avg_salary > 60000;


-- Example 3: Maximum salary by department

SELECT *
FROM (
    SELECT
        department_id,
        MAX(salary) AS max_salary
    FROM employees
    GROUP BY department_id
) AS dept_salary;


-- Example 4: Employee count by department

SELECT *
FROM (
    SELECT
        department_id,
        COUNT(*) AS employee_count
    FROM employees
    GROUP BY department_id
) AS dept_count;


-- Example 5: Join derived table with departments

SELECT
    d.department_name,
    x.avg_salary
FROM departments d
JOIN (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS x
ON d.department_id = x.department_id;


-- TCS NQT / LeetCode Style 1:
-- Find departments having more than 2 employees.

SELECT *
FROM (
    SELECT
        department_id,
        COUNT(*) AS employee_count
    FROM employees
    GROUP BY department_id
) AS dept_count
WHERE employee_count > 2;


-- TCS NQT / LeetCode Style 2:
-- Find departments whose average salary is above 60000.

SELECT *
FROM (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_salary
WHERE avg_salary > 60000;


-- TCS NQT / LeetCode Style 3:
-- Find the department with the highest average salary.

SELECT *
FROM (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_salary
ORDER BY avg_salary DESC
LIMIT 1;


-- Hard 1:
-- Display department name, employee count,
-- and average salary for departments having
-- more than 1 employee.

SELECT
    d.department_name,
    x.employee_count,
    x.avg_salary
FROM departments d
JOIN (
    SELECT
        department_id,
        COUNT(*) AS employee_count,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS x
ON d.department_id = x.department_id
WHERE x.employee_count > 1;


-- Hard 2:
-- Find departments whose average salary is greater
-- than the overall average salary.

SELECT
    d.department_name,
    x.avg_salary
FROM departments d
JOIN (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS x
ON d.department_id = x.department_id
WHERE x.avg_salary > (
    SELECT AVG(salary)
    FROM employees
);