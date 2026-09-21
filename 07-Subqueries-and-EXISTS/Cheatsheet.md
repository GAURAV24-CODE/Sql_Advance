DAY 7 — SUBQUERIES & EXISTS CHEATSHEET
=======================================

1. SUBQUERY
-----------

A subquery is a query written inside another SQL query.

Basic Structure:

SELECT column
FROM table
WHERE column = (
    SELECT column
    FROM table
);


Main Types:

1. Scalar Subquery
2. WHERE Subquery
3. FROM Subquery
4. SELECT Subquery
5. Correlated Subquery
6. EXISTS
7. NOT EXISTS


2. SCALAR SUBQUERY
------------------

A scalar subquery returns exactly one value.

Example:

SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

Common operators:

=
>
<
>=
<=
<>


Common aggregate functions:

AVG()
MAX()
MIN()
SUM()
COUNT()


3. WHERE SUBQUERY
-----------------

Used to filter rows based on the result of another query.

Single value:

SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


Multiple values with IN:

SELECT employee_name, department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Pune'
);


NOT IN:

SELECT employee_name, department_id
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Mumbai'
);


Rule:

One value
-> =, >, <, >=, <=

Multiple values
-> IN / NOT IN

Existence check
-> EXISTS / NOT EXISTS


4. FROM SUBQUERY
----------------

A subquery inside FROM creates a derived table.

Example:

SELECT *
FROM (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_salary;


Important:

A FROM subquery needs an alias in PostgreSQL.

Example:

) AS result


Common flow:

Inner Query
    ->
Aggregation
    ->
Derived Table
    ->
Outer Query


5. SELECT SUBQUERY
------------------

A SELECT subquery adds an additional value to the result.

Example:

SELECT
    employee_name,
    salary,
    (
        SELECT AVG(salary)
        FROM employees
    ) AS average_salary
FROM employees;


Salary difference:

SELECT
    employee_name,
    salary,
    salary - (
        SELECT AVG(salary)
        FROM employees
    ) AS difference_from_average
FROM employees;


CASE + SELECT Subquery:

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


6. CORRELATED SUBQUERY
----------------------

A correlated subquery references a column from the outer query.

Example:

SELECT
    e.employee_name,
    e.department_id,
    e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


Here:

e  = Outer Query
e2 = Inner Query


Important condition:

e2.department_id = e.department_id


Highest salary in each department:

SELECT
    e.employee_name,
    e.department_id,
    e.salary
FROM employees e
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


Normal Subquery:

Independent of outer query.


Correlated Subquery:

Depends on the current row of the outer query.


7. EXISTS
----------

EXISTS checks whether a subquery returns at least one row.

Syntax:

SELECT columns
FROM table1 t1
WHERE EXISTS (
    SELECT 1
    FROM table2 t2
    WHERE t2.key = t1.key
);


Example:

SELECT d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


Why SELECT 1?

EXISTS only checks whether a matching row exists.

The selected value is not important.

Common pattern:

SELECT 1


EXISTS Logic:

Matching row found?
        |
     YES
        |
      TRUE

No matching row?
        |
       NO
        |
      FALSE


8. NOT EXISTS
-------------

NOT EXISTS checks whether the subquery returns no rows.

Example:

SELECT d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


Common use cases:

- Departments without employees
- Customers without orders
- Products without sales
- Students without attendance
- Employees without matching departments


9. EXISTS VS NOT EXISTS
-----------------------

EXISTS
-> At least one matching row exists.

NOT EXISTS
-> No matching row exists.


Memory Trick:

EXISTS
-> Match FOUND -> Return

NOT EXISTS
-> Match NOT FOUND -> Return


10. IN VS EXISTS
----------------

IN:

SELECT department_name
FROM departments
WHERE department_id IN (
    SELECT department_id
    FROM employees
);


EXISTS:

SELECT d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


Difference:

IN
-> Is this value in that set?

EXISTS
-> Does a matching row exist?


11. NOT IN VS NOT EXISTS
------------------------

NOT IN:

SELECT department_name
FROM departments
WHERE department_id NOT IN (
    SELECT department_id
    FROM employees
);


NOT EXISTS:

SELECT d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


IMPORTANT:

NOT IN can produce unexpected results when the subquery contains NULL.

NOT EXISTS avoids that particular NULL behavior.

Always understand NULL behavior before choosing between them.


12. SUBQUERY LOCATION
---------------------

Scalar Subquery
-> Returns one value.

WHERE Subquery
-> Filters rows.

FROM Subquery
-> Creates a derived table.

SELECT Subquery
-> Adds a calculated/retrieved value.

Correlated Subquery
-> Depends on the outer query.

EXISTS
-> Checks whether matching rows exist.

NOT EXISTS
-> Checks whether matching rows do not exist.


13. IMPORTANT INTERVIEW PATTERNS
--------------------------------

Above Overall Average:

SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


Highest Salary:

SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


Highest Salary in Each Department:

SELECT
    e.employee_name,
    e.department_id,
    e.salary
FROM employees e
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


Departments With Employees:

SELECT d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


Departments Without Employees:

SELECT d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


14. COMMON MISTAKES
-------------------

Mistake 1:
Using a multi-row subquery with =

Incorrect:

WHERE department_id = (
    SELECT department_id
    FROM departments
);


Correct:

WHERE department_id IN (
    SELECT department_id
    FROM departments
);


Mistake 2:
Forgetting the FROM subquery alias.

Incorrect:

FROM (
    SELECT department_id
    FROM employees
);


Correct:

FROM (
    SELECT department_id
    FROM employees
) AS result;


Mistake 3:
Confusing IN with EXISTS.

IN
-> Value membership

EXISTS
-> Row existence


Mistake 4:
Missing correlation condition.

Example:

e2.department_id = e.department_id


Without the relationship condition, the inner query may not represent the intended department-level calculation.


15. QUICK INTERVIEW QUESTIONS
----------------------------

Q1. What is a subquery?
A query written inside another SQL query.


Q2. What is a scalar subquery?
A subquery that returns exactly one value.


Q3. What is a derived table?
A subquery placed inside the FROM clause.


Q4. What is a correlated subquery?
A subquery that references a column from the outer query.


Q5. What does EXISTS do?
Checks whether the subquery returns at least one row.


Q6. What does NOT EXISTS do?
Checks whether the subquery returns no rows.


Q7. Why is SELECT 1 commonly used with EXISTS?
Because EXISTS only needs to know whether a matching row exists.


Q8. What is the difference between IN and EXISTS?
IN compares a value against a set of values.
EXISTS checks whether a matching row exists.


Q9. Why can NOT IN be problematic with NULL?
SQL uses three-valued logic, so NULL comparisons can produce UNKNOWN.


Q10. Does a FROM subquery need an alias in PostgreSQL?
Yes.


16. DAY 7 QUICK MEMORY MAP
--------------------------

              SUBQUERIES
                   |
        +----------+----------+
        |          |          |
        v          v          v
     Scalar      WHERE       FROM
        |          |          |
    One Value   Filter     Derived
                Rows       Table
        |
        v
     SELECT
        |
   Extra Value

        |
        v
 Correlated Subquery
        |
     +--+--+
     |     |
     v     v
 EXISTS  NOT EXISTS
     |       |
   Match   No Match


17. DAY 7 FINAL CHECKLIST
-------------------------

Dataset
[✓]

Scalar Subquery
[✓]

WHERE Subquery
[✓]

FROM Subquery
[✓]

SELECT Subquery
[✓]

Correlated Subquery
[✓]

EXISTS
[✓]

NOT EXISTS
[✓]

Topic SQL Files
[✓]

Cheatsheet
[✓]


DAY 7 COMPLETE
==============

Topic:
Subqueries & EXISTS

Main Interview Focus:

1. Above Average Salary
2. Maximum / Minimum Salary
3. Subquery Filtering
4. Derived Tables
5. Correlated Subqueries
6. EXISTS
7. NOT EXISTS
8. IN vs EXISTS
9. NOT IN vs NOT EXISTS
10. NULL behavior