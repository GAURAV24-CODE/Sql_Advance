# SQL FUNDAMENTALS — CHEAT SHEET

## 1. What is SQL?

**SQL (Structured Query Language)** is used to communicate with and manage data stored in relational databases.

### Common Uses

* Create databases and tables
* Insert data
* Retrieve data
* Update data
* Delete data
* Filter and sort data
* Perform calculations
* Analyze data

---

# 2. SQL Command Categories

| Category | Meaning                      | Examples                      |
| -------- | ---------------------------- | ----------------------------- |
| DDL      | Data Definition Language     | CREATE, ALTER, DROP, TRUNCATE |
| DML      | Data Manipulation Language   | INSERT, UPDATE, DELETE        |
| DQL      | Data Query Language          | SELECT                        |
| DCL      | Data Control Language        | GRANT, REVOKE                 |
| TCL      | Transaction Control Language | COMMIT, ROLLBACK, SAVEPOINT   |

---

# 3. Database

A **database** is an organized collection of data.

### Create Database

```sql
CREATE DATABASE company_db;
```

### Connect to Database

In PostgreSQL:

```sql
\c company_db
```

---

# 4. Table

A **table** stores data in rows and columns.

Example:

```text
employees
--------------------------------
employee_id | name | salary
--------------------------------
1           | Amit | 50000
2           | Rahul| 60000
3           | Priya| 55000
```

---

# 5. CREATE TABLE

Used to create a new table.

```sql
CREATE TABLE employees (
    employee_id INT,
    name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2)
);
```

---

# 6. INSERT

Used to add records.

```sql
INSERT INTO employees
(employee_id, name, department, salary)
VALUES
(1, 'Amit', 'IT', 50000);
```

Multiple rows:

```sql
INSERT INTO employees
(employee_id, name, department, salary)
VALUES
(2, 'Rahul', 'HR', 60000),
(3, 'Priya', 'IT', 55000);
```

---

# 7. SELECT

Used to retrieve data.

### Select all columns

```sql
SELECT *
FROM employees;
```

### Select specific columns

```sql
SELECT name, salary
FROM employees;
```

---

# 8. DISTINCT

Removes duplicate values.

```sql
SELECT DISTINCT department
FROM employees;
```

Example result:

```text
IT
HR
Finance
```

---

# 9. WHERE

Used to filter records.

```sql
SELECT *
FROM employees
WHERE salary > 50000;
```

Example:

```sql
SELECT *
FROM employees
WHERE department = 'IT';
```

---

# 10. Comparison Operators

| Operator | Meaning               |
| -------- | --------------------- |
| =        | Equal                 |
| <>       | Not equal             |
| !=       | Not equal             |
| >        | Greater than          |
| <        | Less than             |
| >=       | Greater than or equal |
| <=       | Less than or equal    |

Example:

```sql
SELECT *
FROM employees
WHERE salary >= 50000;
```

---

# 11. AND

All conditions must be TRUE.

```sql
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 50000;
```

---

# 12. OR

At least one condition must be TRUE.

```sql
SELECT *
FROM employees
WHERE department = 'IT'
OR department = 'HR';
```

---

# 13. NOT

Negates a condition.

```sql
SELECT *
FROM employees
WHERE NOT department = 'HR';
```

---

# 14. ORDER BY

Used to sort results.

### Ascending

```sql
SELECT *
FROM employees
ORDER BY salary ASC;
```

### Descending

```sql
SELECT *
FROM employees
ORDER BY salary DESC;
```

**ASC** = lowest → highest
**DESC** = highest → lowest

---

# 15. LIMIT

Restricts the number of rows returned.

```sql
SELECT *
FROM employees
LIMIT 5;
```

Top 5 highest salaries:

```sql
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;
```

---

# 16. NULL

`NULL` means **missing/unknown value**.

Incorrect:

```sql
WHERE salary = NULL
```

Correct:

```sql
WHERE salary IS NULL;
```

Not NULL:

```sql
WHERE salary IS NOT NULL;
```

---

# 17. SQL Query Execution Order

Although we normally write:

```sql
SELECT
FROM
WHERE
ORDER BY
LIMIT
```

SQL logically processes it approximately as:

```text
FROM
  ↓
WHERE
  ↓
GROUP BY
  ↓
HAVING
  ↓
SELECT
  ↓
ORDER BY
  ↓
LIMIT
```

Remember:

**FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT**

---

# 18. Basic Query Template

```sql
SELECT column1, column2
FROM table_name
WHERE condition
ORDER BY column1 ASC
LIMIT 10;
```

---

# 19. UPDATE

Used to modify existing records.

```sql
UPDATE employees
SET salary = 65000
WHERE employee_id = 2;
```

⚠️ Always use `WHERE` carefully.

Without `WHERE`:

```sql
UPDATE employees
SET salary = 65000;
```

This can update **every row**.

---

# 20. DELETE

Used to remove records.

```sql
DELETE FROM employees
WHERE employee_id = 3;
```

⚠️ Without `WHERE`, all records may be deleted:

```sql
DELETE FROM employees;
```

---

# 21. ALTER TABLE

Used to modify table structure.

### Add column

```sql
ALTER TABLE employees
ADD COLUMN email VARCHAR(100);
```

### Rename column

```sql
ALTER TABLE employees
RENAME COLUMN name TO employee_name;
```

### Rename table

```sql
ALTER TABLE employees
RENAME TO staff;
```

---

# 22. DROP

Deletes the database object itself.

```sql
DROP TABLE employees;
```

⚠️ The table and its data are removed.

---

# 23. TRUNCATE

Removes all rows from a table while keeping the table stru
