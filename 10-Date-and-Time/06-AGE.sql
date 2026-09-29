-- DAY 10 - TOPIC 6
-- AGE

-- Regular Example 1
SELECT
    AGE(
        DATE '2026-09-29',
        DATE '2020-09-29'
    ) AS duration;

-- Regular Example 2
SELECT
    AGE(CURRENT_DATE, DATE '2020-01-15')
    AS duration;

-- Regular Example 3
SELECT
    employee_name,
    AGE(CURRENT_DATE, joining_date) AS experience
FROM employees;

-- Regular Example 4
SELECT
    employee_name,
    EXTRACT(
        YEAR FROM AGE(CURRENT_DATE, joining_date)
    ) AS experience_years
FROM employees;

-- Regular Example 5
SELECT
    customer_name,
    AGE(CURRENT_DATE, birth_date) AS age
FROM customers;

-- TCS NQT / LeetCode 1
-- Employees with at least 2 years experience
SELECT
    employee_name,
    joining_date
FROM employees
WHERE AGE(CURRENT_DATE, joining_date)
      >= INTERVAL '2 years';

-- TCS NQT / LeetCode 2
-- Employees with at least 5 years experience
SELECT
    employee_name,
    joining_date
FROM employees
WHERE AGE(CURRENT_DATE, joining_date)
      >= INTERVAL '5 years';

-- TCS NQT / LeetCode 3
-- Completed years of experience
SELECT
    employee_name,
    EXTRACT(
        YEAR FROM AGE(CURRENT_DATE, joining_date)
    ) AS experience_years
FROM employees;

-- Hard SQL 1
-- Experience level classification
SELECT
    employee_name,
    EXTRACT(
        YEAR FROM AGE(CURRENT_DATE, joining_date)
    ) AS experience_years,
    CASE
        WHEN EXTRACT(
            YEAR FROM AGE(CURRENT_DATE, joining_date)
        ) >= 5 THEN 'Senior'
        WHEN EXTRACT(
            YEAR FROM AGE(CURRENT_DATE, joining_date)
        ) >= 2 THEN 'Mid-Level'
        ELSE 'Junior'
    END AS experience_level
FROM employees;

-- Hard SQL 2
-- Average employee experience
SELECT
    AVG(
        EXTRACT(
            YEAR FROM AGE(CURRENT_DATE, joining_date)
        )
    ) AS average_experience_years
FROM employees;