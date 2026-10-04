============================================================
SQL WINDOW FUNCTIONS - CHEATSHEET
Day 12 - SQL Interview Mastery
PostgreSQL
============================================================


1. WINDOW FUNCTION
------------------------------------------------------------

Window functions perform calculations across related rows
without collapsing individual rows.

Basic syntax:

FUNCTION_NAME() OVER (
    PARTITION BY column
    ORDER BY column
)


------------------------------------------------------------
2. OVER()
------------------------------------------------------------

Applies a window function to the complete result set.

Example:

SELECT
    name,
    salary,
    AVG(salary) OVER () AS average_salary
FROM employees;

Common functions:

SUM()
AVG()
COUNT()
MIN()
MAX()


------------------------------------------------------------
3. PARTITION BY
------------------------------------------------------------

Divides rows into groups without combining them.

Example:

SELECT
    name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS department_average
FROM employees;

Shortcut:

PARTITION BY = Divide into groups


------------------------------------------------------------
4. ORDER BY WITH WINDOW FUNCTIONS
------------------------------------------------------------

Controls the order in which rows are processed.

Example:

SELECT
    name,
    salary,
    ROW_NUMBER() OVER (
        ORDER BY salary DESC
    ) AS row_number
FROM employees;

ASC  = Lowest to highest
DESC = Highest to lowest


------------------------------------------------------------
5. ROW_NUMBER()
------------------------------------------------------------

Assigns a unique sequential number to every row.

Example:

SELECT
    name,
    salary,
    ROW_NUMBER() OVER (
        ORDER BY salary DESC
    ) AS row_number
FROM employees;

Result:

90000 -> 1
85000 -> 2
75000 -> 3

Important:

Every row gets a unique number.


------------------------------------------------------------
6. RANK()
------------------------------------------------------------

Assigns ranking to rows.

Tied values receive the same rank.

Example:

SELECT
    name,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;

Example:

Salary     Rank
90000       1
90000       1
70000       3
60000       4

Important:

RANK() creates gaps after ties.


------------------------------------------------------------
7. DENSE_RANK()
------------------------------------------------------------

Similar to RANK(), but does not create gaps.

Example:

SELECT
    name,
    salary,
    DENSE_RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;

Example:

Salary     Dense Rank
90000          1
90000          1
70000          2
60000          3


------------------------------------------------------------
8. ROW_NUMBER vs RANK vs DENSE_RANK
------------------------------------------------------------

Salary     ROW_NUMBER     RANK     DENSE_RANK
90000          1            1          1
90000          2            1          1
70000          3            3          2
60000          4            4          3

Remember:

ROW_NUMBER  -> Unique numbers
RANK        -> Ties + gaps
DENSE_RANK  -> Ties + no gaps


------------------------------------------------------------
9. LAG()
------------------------------------------------------------

Returns a value from a previous row.

Example:

SELECT
    name,
    salary,
    LAG(salary) OVER (
        ORDER BY employee_id
    ) AS previous_salary
FROM employees;

Shortcut:

LAG() -> Previous


------------------------------------------------------------
10. LEAD()
------------------------------------------------------------

Returns a value from a following row.

Example:

SELECT
    name,
    salary,
    LEAD(salary) OVER (
        ORDER BY employee_id
    ) AS next_salary
FROM employees;

Shortcut:

LEAD() -> Next


------------------------------------------------------------
11. LAG() AND LEAD()
------------------------------------------------------------

Compare previous and next values.

Example:

SELECT
    employee_id,
    name,
    salary,

    LAG(salary) OVER (
        ORDER BY employee_id
    ) AS previous_salary,

    LEAD(salary) OVER (
        ORDER BY employee_id
    ) AS next_salary

FROM employees;


------------------------------------------------------------
12. FIRST_VALUE()
------------------------------------------------------------

Returns the first value according to the window ordering.

Example:

SELECT
    name,
    salary,
    FIRST_VALUE(name) OVER (
        ORDER BY salary DESC
    ) AS highest_paid_employee
FROM employees;


------------------------------------------------------------
13. LAST_VALUE()
------------------------------------------------------------

Returns the last value in the window frame.

Example:

SELECT
    name,
    salary,
    LAST_VALUE(salary) OVER (
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS highest_salary
FROM employees;

Important:

LAST_VALUE() often requires an explicit window frame.


------------------------------------------------------------
14. SUM() WITH WINDOW FUNCTION
------------------------------------------------------------

Calculate total while keeping every row.

Example:

SELECT
    name,
    salary,
    SUM(salary) OVER () AS total_salary
FROM employees;


Department total:

SELECT
    name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
    ) AS department_total
FROM employees;


------------------------------------------------------------
15. AVG() WITH WINDOW FUNCTION
------------------------------------------------------------

Calculate average without grouping rows.

Example:

SELECT
    name,
    department,
    salary,
    ROUND(
        AVG(salary) OVER (
            PARTITION BY department
        ), 2
    ) AS department_average
FROM employees;


------------------------------------------------------------
16. RUNNING TOTAL
-----------------------------------------------

A cumulative total calculated row by row.

Example:

SELECT
    employee_id,
    name,
    salary,
    SUM(salary) OVER (
        ORDER BY employee_id
    ) AS running_total
FROM employees;

Concept:

Row 1 = Salary 1
Row 2 = Salary 1 + Salary 2
Row 3 = Salary 1 + Salary 2 + Salary 3


------------------------------------------------------------
17. DEPARTMENT-WISE RANKING
------------------------------------------------------------

Rank employees separately within each department.

Example:

SELECT
    name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;


Logic:

PARTITION BY department
        +
ORDER BY salary DESC
        +
RANK()
        =
Department-wise ranking


------------------------------------------------------------
18. PREVIOUS & NEXT ROW ANALYSIS
------------------------------------------------------------

Use LAG() and LEAD() to compare rows.

Example:

SELECT
    employee_id,
    name,
    salary,

    LAG(salary) OVER (
        ORDER BY employee_id
    ) AS previous_salary,

    LEAD(salary) OVER (
        ORDER BY employee_id
    ) AS next_salary

FROM employees;


------------------------------------------------------------
19. PARTITION BY + ORDER BY
------------------------------------------------------------

Very common window-function combination.

Example:

RANK() OVER (
    PARTITION BY department
    ORDER BY salary DESC
)

Meaning:

1. Divide employees by department.
2. Sort employees by salary.
3. Rank employees inside each department.


------------------------------------------------------------
20. GROUP BY vs PARTITION BY
------------------------------------------------------------

GROUP BY:

- Combines rows.
- Usually returns one row per group.
- Used for aggregation.

Example:

SELECT
    department,
    AVG(salary)
FROM employees
GROUP BY department;


PARTITION BY:

- Does not collapse rows.
- Keeps individual employee rows.
- Performs calculations across each partition.


------------------------------------------------------------
21. WINDOW FUNCTION EXECUTION IDEA
------------------------------------------------------------

FROM
  ↓
WHERE
  ↓
GROUP BY
  ↓
HAVING
  ↓
Window Functions
  ↓
SELECT
  ↓
ORDER BY


------------------------------------------------------------
22. COMMON WINDOW FUNCTION PATTERNS
------------------------------------------------------------

Overall average:

AVG(salary) OVER ()


Department average:

AVG(salary) OVER (
    PARTITION BY department
)


Salary ranking:

RANK() OVER (
    ORDER BY salary DESC
)


Department ranking:

RANK() OVER (
    PARTITION BY department
    ORDER BY salary DESC
)


Previous value:

LAG(salary) OVER (
    ORDER BY employee_id
)


Next value:

LEAD(salary) OVER (
    ORDER BY employee_id
)


Running total:

SUM(salary) OVER (
    ORDER BY employee_id
)


Running average:

AVG(salary) OVER (
    ORDER BY employee_id
)


------------------------------------------------------------
23. INTERVIEW SHORTCUTS
------------------------------------------------------------

OVER()
-> Defines the window.

PARTITION BY
-> Divides rows into groups.

ORDER BY
-> Defines processing order.

ROW_NUMBER()
-> Unique row number.

RANK()
-> Same rank for ties + gaps.

DENSE_RANK()
-> Same rank for ties + no gaps.

LAG()
-> Previous row.

LEAD()
-> Next row.

FIRST_VALUE()
-> First value.

LAST_VALUE()
-> Last value.

SUM() OVER()
-> Window total.

AVG() OVER()
-> Window average.


------------------------------------------------------------
24. MOST IMPORTANT FORMULA
------------------------------------------------------------

FUNCTION() OVER (
    PARTITION BY group_column
    ORDER BY sort_column
)


Example:

RANK() OVER (
    PARTITION BY department
    ORDER BY salary DESC
)


------------------------------------------------------------
25. QUICK REVISION
------------------------------------------------------------

ROW_NUMBER -> Unique numbering
RANK       -> Ranking with gaps
DENSE_RANK -> Ranking without gaps
LAG        -> Previous
LEAD       -> Next
FIRST_VALUE -> First
LAST_VALUE  -> Last
SUM        -> Total
AVG        -> Average
PARTITION BY -> Groups
ORDER BY -> Processing order
OVER() -> Window definition


============================================================
END OF DAY 12 - WINDOW FUNCTIONS CHEATSHEET
============================================================