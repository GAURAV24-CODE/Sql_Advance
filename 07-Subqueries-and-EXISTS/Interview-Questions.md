DAY 7 — SUBQUERIES & EXISTS
SQL INTERVIEW QUESTIONS & ANSWERS
==================================


SECTION 1 — BASIC QUESTIONS
===========================

Q1. What is a subquery?

Answer:
A subquery is a SQL query written inside another SQL query.

Example:

SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


Q2. Why are subqueries used?

Answer:
Subqueries are used when the result of one query is required by another query.

Common uses:

- Filtering data
- Comparing values
- Finding averages
- Finding maximum/minimum values
- Checking relationships
- Creating derived tables
- Solving complex SQL problems


Q3. Where can a subquery be used?

Answer:

A subquery can commonly be used in:

- SELECT
- FROM
- WHERE
- HAVING

It can also appear with operators such as:

- IN
- EXISTS
- NOT EXISTS
- ANY
- ALL


Q4. What is a scalar subquery?

Answer:
A scalar subquery returns exactly one value.

Example:

SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


Q5. What happens if a scalar subquery returns multiple rows?

Answer:
PostgreSQL generates an error because a scalar comparison expects a single value.

For multiple values, use operators such as:

IN
ANY
ALL

depending on the requirement.


SECTION 2 — WHERE SUBQUERIES
============================

Q6. What is a WHERE subquery?

Answer:
A WHERE subquery is used to filter rows based on the result of another query.

Example:

SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


Q7. When should you use IN with a subquery?

Answer:
Use IN when the subquery can return multiple values and you want to check whether a value belongs to that result set.

Example:

SELECT employee_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Pune'
);


Q8. What is the difference between = and IN with a subquery?

Answer:

=
-> Usually expects one value.

IN
-> Can compare against multiple returned values.

Example:

WHERE department_id = (
    SELECT department_id
    FROM departments
    WHERE department_name = 'Analytics'
);


Multiple values:

WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Pune'
);


Q9. Can a subquery return multiple rows?

Answer:
Yes.

However, the outer operator must support multiple rows.

For example:

IN
ANY
ALL
EXISTS


Q10. What is the difference between IN and NOT IN?

Answer:

IN
-> Returns rows whose value exists in the subquery result.

NOT IN
-> Returns rows whose value does not exist in the subquery result.

Important:
NULL values can affect NOT IN behavior.


SECTION 3 — FROM SUBQUERIES
===========================

Q11. What is a derived table?

Answer:
A derived table is a subquery used inside the FROM clause.

Example:

SELECT *
FROM (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_salary;


Q12. Why is an alias required for a FROM subquery in PostgreSQL?

Answer:
The derived table needs a table reference that the outer query can use.

Example:

FROM (
    SELECT department_id
    FROM employees
) AS result;


Q13. What is the advantage of a derived table?

Answer:
It allows us to first calculate or transform data and then query the result as if it were a table.

Typical pattern:

Inner Query
    ->
Calculate
    ->
Derived Table
    ->
Outer Query


SECTION 4 — SELECT SUBQUERIES
=============================

Q14. What is a SELECT subquery?

Answer:
A SELECT subquery returns an additional value or calculation for each outer row.

Example:

SELECT
    employee_name,
    salary,
    (
        SELECT AVG(salary)
        FROM employees
    ) AS average_salary
FROM employees;


Q15. Can a SELECT subquery return multiple rows?

Answer:
Usually no when used as a scalar expression.

The subquery should return one value for each outer row unless a different SQL construct is being used.


Q16. How can you calculate salary difference from average salary?

Answer:

SELECT
    employee_name,
    salary,
    salary - (
        SELECT AVG(salary)
        FROM employees
    ) AS salary_difference
FROM employees;


SECTION 5 — CORRELATED SUBQUERIES
================================

Q17. What is a correlated subquery?

Answer:
A correlated subquery is a subquery that references a column from the outer query.

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


Q18. What is the main difference between a normal and correlated subquery?

Answer:

Normal Subquery:
-> Independent of the outer query.

Correlated Subquery:
-> References the outer query.


Q19. How do you find employees earning more than their department average?

Answer:

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


Q20. How do you find the highest-paid employee in each department?

Answer:

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


Q21. Why are aliases important in correlated subqueries?

Answer:
Aliases distinguish the outer and inner references to the same table.

Example:

e
-> Outer employees table

e2
-> Inner employees table


SECTION 6 — EXISTS
==================

Q22. What is EXISTS?

Answer:
EXISTS checks whether a subquery returns at least one row.

Example:

SELECT d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


Q23. Why is SELECT 1 commonly used with EXISTS?

Answer:
EXISTS only checks whether a row exists.

It does not need the actual column value.

Therefore:

SELECT 1

is commonly used.


Q24. Does EXISTS return the rows from the subquery?

Answer:
No.

EXISTS returns TRUE or FALSE based on whether at least one matching row exists.


Q25. How do you find departments that have employees?

Answer:

SELECT d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


Q26. How do you find departments having at least one employee with salary above 80000?

Answer:

SELECT d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.salary > 80000
);


SECTION 7 — NOT EXISTS
======================

Q27. What is NOT EXISTS?

Answer:
NOT EXISTS checks whether the subquery returns no rows.

Example:

SELECT d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


Q28. How do you find departments without employees?

Answer:

SELECT d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


Q29. Why is NOT EXISTS useful?

Answer:
It is useful for finding missing relationships.

Examples:

- Customers without orders
- Products without sales
- Departments without employees
- Students without attendance
- Employees without matching departments


SECTION 8 — IN VS EXISTS
========================

Q30. What is the difference between IN and EXISTS?

Answer:

IN:
Checks whether a value belongs to a set of values.

EXISTS:
Checks whether a matching row exists.


IN example:

SELECT department_name
FROM departments
WHERE department_id IN (
    SELECT department_id
    FROM employees
);


EXISTS example:

SELECT d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


Q31. Which is better: IN or EXISTS?

Answer:
There is no universal answer.

The appropriate choice depends on:

- Query structure
- Data distribution
- NULL behavior
- PostgreSQL query planning
- Readability
- Specific business requirement

Use the construct that clearly represents the required logic and verify performance with EXPLAIN when performance matters.


SECTION 9 — NOT IN VS NOT EXISTS
===============================

Q32. What is the difference between NOT IN and NOT EXISTS?

Answer:

NOT IN:
Checks that a value is not present in the returned set.

NOT EXISTS:
Checks that no matching row exists.

NOT EXISTS is often safer for anti-join logic when NULL values could be present.


Q33. Why can NOT IN behave unexpectedly with NULL?

Answer:
SQL uses three-valued logic:

TRUE
FALSE
UNKNOWN

If the subquery contains NULL, comparisons involving NOT IN can result in UNKNOWN.


SECTION 10 — INTERVIEW QUERY PATTERNS
=====================================

Q34. Find employees earning above the overall average salary.

Answer:

SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


Q35. Find employees earning the maximum salary.

Answer:

SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


Q36. Find employees earning above their department average.

Answer:

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


Q37. Find the highest-paid employee in each department.

Answer:

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


Q38. Find departments that have at least one employee.

Answer:

SELECT d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


Q39. Find departments that have no employees.

Answer:

SELECT d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


Q40. Find departments having an employee with performance rating above 4.5.

Answer:

SELECT d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.performance_rating > 4.5
);


SECTION 11 — HARD INTERVIEW QUESTIONS
=====================================

Q41. Find employees whose salary and performance rating are both above their department average.

Answer:

SELECT
    e.employee_name,
    e.department_id,
    e.salary,
    e.performance_rating
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
)
AND e.performance_rating > (
    SELECT AVG(e3.performance_rating)
    FROM employees e3
    WHERE e3.department_id = e.department_id
);


Q42. Find the second-highest distinct salary using a subquery.

Answer:

SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);


Q43. Find departments where the average salary is greater than the overall company average.

Answer:

SELECT
    department_id,
    AVG(salary) AS department_avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM employees
);


Q44. Find departments where at least one employee earns more than the overall average salary.

Answer:

SELECT d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.salary > (
          SELECT AVG(salary)
          FROM employees
      )
);


Q45. Find departments where no employee earns more than 70000.

Answer:

SELECT d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.salary > 70000
);


SECTION 12 — TCS NQT / LEETCODE STYLE PATTERNS
===============================================

Pattern 1:
Above Average

SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


Pattern 2:
Maximum Value

SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


Pattern 3:
Group Maximum

SELECT *
FROM employees e
WHERE salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


Pattern 4:
Group Average

SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


Pattern 5:
Existence Check

SELECT d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


Pattern 6:
Missing Relationship

SELECT d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


SECTION 13 — QUICK REVISION
===========================

SUBQUERY
-> Query inside another query.

SCALAR SUBQUERY
-> Returns one value.

WHERE SUBQUERY
-> Filters rows.

FROM SUBQUERY
-> Creates a derived table.

SELECT SUBQUERY
-> Adds a value/calculation.

CORRELATED SUBQUERY
-> Depends on the outer query.

EXISTS
-> At least one matching row exists.

NOT EXISTS
-> No matching row exists.

IN
-> Checks value membership.

NOT IN
-> Checks value absence, but NULL requires care.

SELECT 1
-> Commonly used with EXISTS because only existence matters.


DAY 7 INTERVIEW PREPARATION COMPLETE
====================================

Topics Covered:

[✓] Scalar Subquery
[✓] WHERE Subquery
[✓] FROM Subquery
[✓] SELECT Subquery
[✓] Correlated Subquery
[✓] EXISTS
[✓] NOT EXISTS
[✓] IN vs EXISTS
[✓] NOT IN vs NOT EXISTS
[✓] NULL behavior
[✓] Interview Query Patterns
[✓] Hard SQL Questions
[✓] TCS NQT / LeetCode Patterns