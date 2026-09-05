-- DAY 2 — FILTERING DATA
-- File: 06-LIKE-ILIKE.sql
-- Topic: LIKE / ILIKE
-- Database: PostgreSQL


-- 1. Names Starting With G
SELECT
    employee_name
FROM employees
WHERE employee_name LIKE 'G%';


-- 2. Names Starting With A
SELECT
    employee_name
FROM employees
WHERE employee_name LIKE 'A%';


-- 3. Names Ending With A
SELECT
    employee_name
FROM employees
WHERE employee_name LIKE '%a';


-- 4. Names Containing "an"
SELECT
    employee_name
FROM employees
WHERE employee_name LIKE '%an%';


-- 5. Names Containing "ri"
SELECT
    employee_name
FROM employees
WHERE employee_name LIKE '%ri%';


-- 6. Job Roles Starting With Data
SELECT
    employee_name,
    job_role
FROM employees
WHERE job_role LIKE 'Data%';


-- 7. Job Roles Containing Data
SELECT
    employee_name,
    job_role
FROM employees
WHERE job_role LIKE '%Data%';


-- 8. Job Roles Ending With Engineer
SELECT
    employee_name,
    job_role
FROM employees
WHERE job_role LIKE '%Engineer';


-- 9. ILIKE — Case-Insensitive Name Search
SELECT
    employee_name
FROM employees
WHERE employee_name ILIKE 'gaurav';


-- 10. ILIKE — Case-Insensitive Pattern
SELECT
    employee_name,
    job_role
FROM employees
WHERE job_role ILIKE '%data%';


-- 11. ILIKE — Names Starting With G
SELECT
    employee_name
FROM employees
WHERE employee_name ILIKE 'g%';


-- 12. NOT LIKE — Exclude Manager Roles
SELECT
    employee_name,
    job_role
FROM employees
WHERE job_role NOT LIKE '%Manager%';


-- 13. NOT ILIKE — Case-Insensitive Exclusion
SELECT
    employee_name,
    job_role
FROM employees
WHERE job_role NOT ILIKE '%manager%';


-- 14. Underscore Wildcard
-- G followed by exactly four characters
SELECT
    employee_name
FROM employees
WHERE employee_name LIKE 'G____';


-- 15. LIKE with Additional Condition
SELECT
    employee_name,
    department,
    job_role,
    salary
FROM employees
WHERE job_role ILIKE '%data%'
AND salary >= 60000;