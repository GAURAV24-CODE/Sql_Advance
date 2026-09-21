-- Day 7: SELECT Subquery
-- Dataset: employees and departments
-- SELECT subquery = subquery used to add a value to the result.


-- Example 1: Display every employee with overall average salary

SELECT
    employee_name,
    salary,
    (
        SELECT AVG(salary)
        FROM employees
    ) AS average_salary
FROM employees;


-- Example 2: Display salary difference from overall average

SELECT
    employee_name,
    salary,
    salary - (
        SELECT AVG(salary)
        FROM employees
    ) AS difference_from_average
FROM employees;


-- Example 3: Display employee with salary status

SELECT
    employee_name,
    salary,
    CASE
        WHEN salary > (
            SELECT AVG(salary)
            FROM employees
        )
        THEN 'Above Average'
        ELSE 'Below Average'
    END AS salary_status
FROM employees;


-- Example 4: Display employee with overall maximum salary

SELECT
    employee_name,
    salary,
    (
        SELECT MAX(salary)
        FROM employees
    ) AS maximum_salary
FROM employees;


-- Example 5: Display employee with overall average performance rating

SELECT
    employee_name,
    performance_rating,
    (
        SELECT AVG(performance_rating)
        FROM employees
    ) AS average_performance
FROM employees;


-- TCS NQT / LeetCode Style 1:
-- Display each employee and their difference
-- from the average salary.

SELECT
    employee_name,
    salary,
    salary - (
        SELECT AVG(salary)
        FROM employees
    ) AS salary_difference
FROM employees;


-- TCS NQT / LeetCode Style 2:
-- Display each employee and classify their salary
-- as Above Average or Below Average.

SELECT
    employee_name,
    salary,
    CASE
        WHEN salary > (
            SELECT AVG(salary)
            FROM employees
        )
        THEN 'Above Average'
        ELSE 'Below Average'
    END AS salary_status
FROM employees;


-- TCS NQT / LeetCode Style 3:
-- Display each employee along with the
-- highest salary in the company.

SELECT
    employee_name,
    salary,
    (
        SELECT MAX(salary)
        FROM employees
    ) AS highest_salary
FROM employees;


-- Hard 1:
-- Display employee name, department name, salary,
-- and overall average salary.

SELECT
    e.employee_name,
    d.department_name,
    e.salary,
    (
        SELECT AVG(salary)
        FROM employees
    ) AS overall_avg_salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;


-- Hard 2:
-- Display employee name, salary, average salary,
-- and percentage difference from average salary.

SELECT
    employee_name,
    salary,
    (
        SELECT AVG(salary)
        FROM employees
    ) AS average_salary,
    ROUND(
        (
            (salary - (
                SELECT AVG(salary)
                FROM employees
            ))
            /
            (
                SELECT AVG(salary)
                FROM employees
            )
        ) * 100,
        2
    ) AS percentage_difference
FROM employees;