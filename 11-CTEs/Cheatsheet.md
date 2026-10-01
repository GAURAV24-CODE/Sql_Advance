============================================================
DAY 11 — CTEs CHEAT SHEET
PostgreSQL
============================================================

1. CTE — Common Table Expression
--------------------------------
Definition:
A temporary named result set created using WITH.

Purpose:
Break complex SQL into smaller logical steps.

Basic Syntax:
WITH cte_name AS (
    SELECT ...
    FROM table_name
)
SELECT *
FROM cte_name;


2. CTE WITH SELECT
------------------
Used to select specific columns from a CTE.

WITH employee_data AS (
    SELECT employee_name, salary
    FROM employees
)
SELECT employee_name, salary
FROM employee_data;


3. CTE WITH WHERE
-----------------
Used to filter rows.

WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 60000
)
SELECT *
FROM high_salary;


4. CTE WITH GROUP BY
--------------------
Used for aggregation.

WITH department_summary AS (
    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM department_summary;


5. CTE WITH HAVING
------------------
HAVING filters grouped results.

WITH department_summary AS (
    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
    HAVING AVG(salary) > 60000
)
SELECT *
FROM department_summary;


6. MULTIPLE CTEs
----------------
Multiple CTEs are separated by commas.

WITH cte1 AS (
    SELECT ...
),
cte2 AS (
    SELECT ...
    FROM cte1
)
SELECT *
FROM cte2;


7. CTE WITH JOIN
----------------
CTE result can be joined with a table or another CTE.

WITH department_salary AS (
    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
)
SELECT
    e.employee_name,
    e.salary,
    d.average_salary
FROM employees e
JOIN department_salary d
    ON e.department = d.department;


8. CTE WITH CASE
----------------
Used to apply business classification.

WITH employee_data AS (
    SELECT employee_name, salary
    FROM employees
)
SELECT
    employee_name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employee_data;


9. CTE vs SUBQUERY
------------------
Subquery:
A query inside another query.

SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

CTE:
A named intermediate result using WITH.

WITH avg_salary AS (
    SELECT AVG(salary) AS average_salary
    FROM employees
)
SELECT *
FROM employees e
CROSS JOIN avg_salary a
WHERE e.salary > a.average_salary;


10. ADVANCED CTE
----------------
Multiple logical steps.

WITH step1 AS (
    ...
),
step2 AS (
    ...
),
step3 AS (
    ...
)
SELECT *
FROM step3;


IMPORTANT CTE PATTERNS
----------------------
Filter → Aggregate → Filter
Filter → Calculate → CASE
CTE → JOIN → CASE
CTE → GROUP BY → HAVING
CTE → Window Function → Filter
Multiple CTEs → JOIN → Final Report


IMPORTANT RULES
---------------
1. CTE starts with WITH.
2. Multiple CTEs are separated by commas.
3. Later CTEs can reference earlier CTEs.
4. CTE exists only for the current SQL statement.
5. One CTE = One logical step.
6. Always understand CTE granularity.
7. CTE is mainly useful for readability and organization.
8. Do NOT assume CTE is automatically faster than a subquery.


WHERE vs HAVING
---------------
WHERE  → filters rows
GROUP BY → creates groups
HAVING → filters groups


CTE MENTAL MODEL
----------------
CTE
 ↓
Prepare
 ↓
Transform
 ↓
Analyze
 ↓
Final Result


INTERVIEW MEMORY
----------------
CTE = Named temporary result set.

Subquery = Nested query.

CTE → Better for multi-step complex SQL.
Subquery → Convenient for simple nested logic.


GOLDEN FORMULA
--------------
WITH → Prepare
JOIN → Combine
WHERE → Filter rows
GROUP BY → Create groups
HAVING → Filter groups
CASE → Classify
WINDOW → Rank/Analyze
SELECT → Present


DAY 11 STATUS
-------------
Basic CTE              ✅
CTE + SELECT           ✅
CTE + WHERE            ✅
CTE + GROUP BY         ✅
CTE + HAVING           ✅
Multiple CTEs          ✅
CTE + JOIN             ✅
CTE + CASE             ✅
CTE vs Subquery        ✅
Advanced CTE Patterns  ✅

DAY 11 — COMPLETE 🚀
============================================================