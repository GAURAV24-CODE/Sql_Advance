==================================================
              SQL QUICK COMMANDS — DAY 1
==================================================

Select All:
SELECT *
FROM employees;

Select Column:
SELECT employee_name
FROM employees;

Select Multiple Columns:
SELECT employee_name, salary
FROM employees;

Distinct Values:
SELECT DISTINCT department
FROM employees;

Column Alias:
SELECT employee_name AS name
FROM employees;

Calculated Column:
SELECT salary * 12 AS annual_salary
FROM employees;

Salary Hike:
SELECT salary * 1.10 AS new_salary
FROM employees;

Limit Rows:
SELECT *
FROM employees
LIMIT 5;

Find NULL:
SELECT *
FROM employees
WHERE salary IS NULL;

Find NOT NULL:
SELECT *
FROM employees
WHERE salary IS NOT NULL;

Table Alias:
SELECT e.employee_name
FROM employees AS e;

Addition:
salary + 1000

Subtraction:
salary - 1000

Multiplication:
salary * 12

Division:
salary / 12

Modulo:
salary % 2

End Query:
;

==================================================
              SQL MEMORY COMMANDS
==================================================

SELECT       → Get Data
FROM         → Table
DISTINCT     → Unique Values
AS           → Rename
CALCULATION  → Derived Value
LIMIT        → Restrict Rows
NULL         → Missing Value
IS NULL      → Find Missing
IS NOT NULL  → Find Present
*            → All Columns
;            → End Query

==================================================
              SUPER MEMORY
==================================================

SELECT   → WHAT?
FROM     → WHERE?
DISTINCT → UNIQUE?
AS       → RENAME?
CALC     → DERIVE?
LIMIT    → HOW MANY?
NULL     → MISSING?
==================================================