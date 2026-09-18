SQL JOINs — Quick Cheat Sheet
=============================

1. INNER JOIN
--------------
Returns only matching rows from both tables.

Syntax:
SELECT columns
FROM table1 AS a
INNER JOIN table2 AS b
    ON a.id = b.id;

Use:
→ Find records that exist in both tables.


2. LEFT JOIN
------------
Returns ALL rows from the left table
and matching rows from the right table.

Syntax:
SELECT columns
FROM table1 AS a
LEFT JOIN table2 AS b
    ON a.id = b.id;

Use:
→ Find all customers, including customers without orders.


3. RIGHT JOIN
-------------
Returns ALL rows from the right table
and matching rows from the left table.

Syntax:
SELECT columns
FROM table1 AS a
RIGHT JOIN table2 AS b
    ON a.id = b.id;

Use:
→ Preserve every row from the right-side table.

Remember:
RIGHT JOIN = Reverse LEFT JOIN.


4. FULL OUTER JOIN
------------------
Returns ALL rows from both tables.

Syntax:
SELECT columns
FROM table1 AS a
FULL OUTER JOIN table2 AS b
    ON a.id = b.id;

Use:
→ Find matching + unmatched records.


5. SELF JOIN
------------
Joins a table with itself.

Syntax:
SELECT ...
FROM employees AS e
JOIN employees AS m
    ON e.manager_id = m.employee_id;

Use:
→ Employee-manager relationships
→ Hierarchies
→ Compare rows within the same table.


6. CROSS JOIN
-------------
Returns every possible combination.

Syntax:
SELECT columns
FROM table1
CROSS JOIN table2;

Formula:
Rows A × Rows B = Result rows

Example:
10 customers × 11 products = 110 rows.

Use:
→ Generate combinations.

Warning:
Can create a very large result.


7. MULTIPLE JOINS
-----------------
Joins more than two tables.

Example:
SELECT
    c.customer_name,
    o.order_id,
    p.product_name
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN products AS p
    ON o.product_id = p.product_id;


8. JOIN + GROUP BY
------------------
Join tables first, then group and aggregate.

Example:
SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_sales
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name;


9. JOIN + HAVING
----------------
HAVING filters groups after aggregation.

Example:
SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_sales
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.total_amount) > 50000;


JOIN Comparison
---------------

INNER → Matching rows
LEFT  → All LEFT + matching RIGHT
RIGHT → All RIGHT + matching LEFT
FULL  → All rows from BOTH
SELF  → Same table with itself
CROSS → Every combination


Important NULL Patterns
-----------------------

Customers without orders:
WHERE o.order_id IS NULL

Orders without customers:
WHERE c.customer_id IS NULL

Unmatched records:
WHERE c.customer_id IS NULL
   OR o.order_id IS NULL


JOIN Query Thinking
-------------------

1. Identify required tables
2. Find relationship/key
3. Choose JOIN type
4. Write ON condition
5. Select required columns
6. Apply WHERE
7. GROUP BY if needed
8. HAVING for aggregate filters
9. ORDER BY final result


Interview One-Liners
--------------------

INNER JOIN:
"Returns matching records from both tables."

LEFT JOIN:
"Returns all records from the left table and matching records from the right."

RIGHT JOIN:
"Returns all records from the right table and matching records from the left."

FULL OUTER JOIN:
"Returns all records from both tables."

SELF JOIN:
"Joins a table with itself using different aliases."

CROSS JOIN:
"Returns the Cartesian product of two tables."