
-- ==================================================
-- DAY 13: ADVANCED SQL PATTERNS
-- FILE: 01-Second-Highest-Salary.sql
-- TOPIC: SECOND-HIGHEST SALARY
-- ==================================================


-- EASY LEVEL
-- Q1. Find the highest salary from employees.

SELECT MAX(salary) AS highest_salary
FROM employees;

-- Answer: 90000


-- Q2. Display the second-highest DISTINCT salary.

SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
OFFSET 1 LIMIT 1;

-- Answer: 80000


-- MEDIUM LEVEL
-- Q3. Find the second-highest salary using a subquery.

SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

-- Answer: 80000


-- Q4. Display the names of employees earning
-- the second-highest salary.

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

-- Answer: Priya - 80000
--         Rahul - 80000


-- HARD LEVEL
-- Q5. Find the third-highest DISTINCT salary
-- using DENSE_RANK().

SELECT DISTINCT salary
FROM (
    SELECT salary,
           DENSE_RANK() OVER (
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees
) AS ranked
WHERE salary_rank = 3;

-- Answer: 70000


-- Q6. Find the second-highest salary in each department.

SELECT employee_name, department_id, salary
FROM (
    SELECT employee_name,
           department_id,
           salary,
           DENSE_RANK() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees
) AS ranked
WHERE salary_rank = 2
ORDER BY department_id;

-- Answer:
-- IT: Priya, Rahul - 80000
-- HR: Sneha - 50000
-- Sales: Pooja - 60000





-- TCS NQT-STYLE SQL QUERY
-- Q9. Find the Nth-highest DISTINCT salary.
-- Change the value of n to select another rank.

WITH ranked AS (
    SELECT DISTINCT salary,
           DENSE_RANK() OVER (
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees
)
SELECT salary
FROM ranked
WHERE salary_rank = 2;

-- Answer: 80000
-- For the third-highest salary, use salary_rank = 3.


-- INTERVIEW CHALLENGE
-- Q10. Find employees earning more than
-- the average salary.

SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY salary DESC;

-- Answer: Employees earning above the average salary.
-- AVG() calculates the average; WHERE filters employees.


-- END OF FILE
