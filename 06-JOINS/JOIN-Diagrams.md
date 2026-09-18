SQL JOINS — TEXT DIAGRAMS

Quick Memory: INNER -> MATCHING ONLY LEFT -> ALL LEFT + MATCHING RIGHT
RIGHT -> ALL RIGHT + MATCHING LEFT FULL -> ALL ROWS FROM BOTH SELF ->
SAME TABLE JOINED WITH ITSELF CROSS -> EVERY POSSIBLE COMBINATION

1. INNER JOIN

Meaning: Returns only rows that have a match in BOTH tables.

Diagram:

        TABLE A              TABLE B
       _________            _________
      /         \          /         \
     /           \        /           \
    |             |######|             |
    |             | MATCH|             |
     \           /        \           /
      \_________/          \_________/

              OUTPUT
              ######
            MATCHING
              ROWS

Example:

employees departments +—-+——+ +—-+———-+ | id | name | | id | dept |
+—-+——+ +—-+———-+ | 1 | A | | 1 | IT | | 2 | B | | 2 | HR | | 3 | C | |
4 | Finance | +—-+——+ +—-+———-+

Result: A -> IT B -> HR

SQL: SELECT * FROM employees e INNER JOIN departments d ON e.dept_id =
d.dept_id;

2. LEFT JOIN

Meaning: Returns ALL rows from the LEFT table, plus matching rows from
the RIGHT table.

Diagram:

        TABLE A              TABLE B
       _________            _________
      /#########\          /         \
     /###########\        /           \
    |#############|######|             |
    |#############| MATCH|             |
     \###########/        \           /
      \#########/          \_________/

        KEEP ALL A
        + MATCHING B

If there is no match: RIGHT-side columns = NULL

Example:

employees departments +—-+——+ +—-+———-+ | id | name | | id | dept |
+—-+——+ +—-+———-+ | 1 | A | | 1 | IT | | 2 | B | | 2 | HR | | 3 | C | |
4 | Finance | +—-+——+ +—-+———-+

Result: A -> IT B -> HR C -> NULL

SQL: SELECT * FROM employees e LEFT JOIN departments d ON e.dept_id =
d.dept_id;

3. RIGHT JOIN

Meaning: Returns ALL rows from the RIGHT table, plus matching rows from
the LEFT table.

Diagram:

        TABLE A              TABLE B
       _________            _________
      /         \          /#########\
     /           \        /###########\
    |             |######|#############|
    |             | MATCH|#############|
     \           /        \###########/
      \_________/          \#########/

                     KEEP ALL B
                  + MATCHING A

If there is no match: LEFT-side columns = NULL

Example:

employees departments +—-+——+ +—-+———-+ | id | name | | id | dept |
+—-+——+ +—-+———-+ | 1 | A | | 1 | IT | | 2 | B | | 2 | HR | +—-+——+ | 4
| Finance | +—-+———-+

Result: A -> IT B -> HR NULL -> Finance

SQL: SELECT * FROM employees e RIGHT JOIN departments d ON e.dept_id =
d.dept_id;

4. FULL JOIN / FULL OUTER JOIN

Meaning: Returns ALL rows from BOTH tables.

Diagram:

        TABLE A              TABLE B
       _________            _________
      /#########\          /#########\
     /###########\        /###########\
    |#############|######|#############|
    |#############| MATCH|#############|
     \###########/        \###########/
      \#########/          \#########/

          KEEP EVERYTHING
        FROM BOTH TABLES

If there is no match: Missing side = NULL

Example:

employees departments +—-+——+ +—-+———-+ | id | name | | id | dept |
+—-+——+ +—-+———-+ | 1 | A | | 1 | IT | | 2 | B | | 2 | HR | | 3 | C | |
4 | Finance | +—-+——+ +—-+———-+

Result: A -> IT B -> HR C -> NULL NULL -> Finance

SQL: SELECT * FROM employees e FULL JOIN departments d ON e.dept_id =
d.dept_id;

5. SELF JOIN

Meaning: A table is joined with ITSELF.

There is no separate SELF JOIN keyword. We use JOIN/LEFT JOIN/etc. with
the same table twice.

Diagram:

             SAME TABLE
          +--------------+
          |  employees   |
          +--------------+
             /        \
            /          \
           v            v
      e = employee   m = manager
           |            |
           +-----JOIN---+
             manager_id
                  =
                emp_id

Example employees:

  ---- -------- ------------
  id   name     manager_id

  1 2  Rahul    NULL 1 1 2
  3 4  Priya    
       Amit     
       Sneha    
  ---- -------- ------------

Result: Priya -> Rahul Amit -> Rahul Sneha -> Priya

SQL: SELECT e.name AS employee, m.name AS manager FROM employees e JOIN
employees m ON e.manager_id = m.id;

Key idea: e = first logical copy of employees m = second logical copy of
employees

6. CROSS JOIN

Meaning: Every row from Table A is combined with EVERY row from Table B.

Diagram:

       TABLE A                 TABLE B
      +-------+               +-------+
      | A1    |               | B1    |
      | A2    |       X       | B2    |
      | A3    |               +-------+
      +-------+

Combinations:

A1 -> B1 A1 -> B2

A2 -> B1 A2 -> B2

A3 -> B1 A3 -> B2

Formula:

Number of output rows

Rows in A x Rows in B

Example: 3 employees x 2 departments = 6 rows

SQL: SELECT e.name, d.dept FROM employees e CROSS JOIN departments d;

JOIN COMPARISON

INNER JOIN: A B ( ###### ) MATCH OUTPUT = MATCH ONLY

LEFT JOIN: A B (########## ) KEEP ALL A

RIGHT JOIN: A B ( ##########) KEEP ALL B

FULL JOIN: A B (##########) KEEP BOTH

SELF JOIN: A /
A A SAME TABLE

CROSS JOIN: A X B EVERYTHING x EVERYTHING

ONE-LINE MEMORY TRICK

INNER -> MATCH LEFT -> LEFT RIGHT -> RIGHT FULL -> BOTH SELF -> SAME
TABLE CROSS -> EVERYTHING x EVERYTHING
