# SQL Fundamentals — Interview Questions

## 1. What is SQL?

**Answer:**
SQL (Structured Query Language) is used to communicate with relational databases. It allows us to create, retrieve, update, delete, and analyze data.

---

## 2. What is a Database?

**Answer:**
A database is an organized collection of data that can be stored, managed, and retrieved efficiently.

**Example:**
A company database can contain employee, department, salary, and customer information.

---

## 3. What is a Table?

**Answer:**
A table stores data in the form of **rows and columns**.

```text
employees
--------------------------------
id | name  | department | salary
--------------------------------
1  | Amit  | IT         | 50000
2  | Rahul | HR         | 60000
```

---

## 4. What is a Row?

**Answer:**
A row represents a single record in a table.

Example:

```text
1 | Amit | IT | 50000
```

is one employee record.

---

## 5. What is a Column?

**Answer:**
A column represents a specific attribute or field.

Examples:

```text
id
name
department
salary
```

---

## 6. What are the main SQL command categories?

**Answer:**

| Category | Full Form                    | Commands                      |
| -------- | ---------------------------- | ----------------------------- |
| DDL      | Data Definition Language     | CREATE, ALTER, DROP, TRUNCATE |
| DML      | Data Manipulation Language   | INSERT, UPDATE, DELETE        |
| DQL      | Data Query Language          | SELECT                        |
| DCL      | Data Control Language        | GRANT, REVOKE                 |
| TCL      | Transaction Control Language | COMMIT, ROLLBACK, SAVEPOINT   |

---

## 7. What is DDL?

**Answer:**
DDL is used to define and modify the structure of database objects such as tables.

Examples:

```sql
CREATE
ALTER
DROP
TRUNCATE
```

---

## 8. What is DML?

**Answer:**
DML is used to manipulate data stored in tables.

Examples:

```sql
INSERT
UPDATE
DELETE
```

---

## 9. What is DQL?

**Answer:**
DQL is used to retrieve data from a database.

The primary command is:

```sql
SELECT
```

Example:

```sql
SELECT *
FROM employees;
```

---

## 10. What is a Primary Key?

**Answer:**
A primary key uniquely identifies each record in a table.

Properties:

* Must be unique
* Cannot contain NULL
* Identifies a record
* A table can have one primary key constraint

Example:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100)
);
```

---

## 11. What is a Foreign Key?

**Answer:**
A foreign key is a column that references a key in another table.

It is commonly used to establish relationships between tables.

Example:

```sql
FOREIGN KEY (department_id)
REFERENCES departments(department_id);
```

---

## 12. What is NULL?

**Answer:**
`NULL` represents a missing or unknown value.

To find NULL values:

```sql
SELECT *
FROM employees
WHERE salary IS NULL;
```

To find non-NULL values:

```sql
SELECT *
FROM employees
WHERE salary IS NOT NULL;
```

---

## 13. Can we use `= NULL`?

**Answer:**
No.

Incorrect:

```sql
WHERE salary = NULL;
```

Correct:

```sql
WHERE salary IS NULL;
```

---

## 14. What is SELECT?

**Answer:**
`SELECT` retrieves data from a table.

```sql
SELECT name, salary
FROM employees;
```

---

## 15. What does `SELECT *` mean?

**Answer:**
It selects all columns from a table.

```sql
SELECT *
FROM employees;
```

For production queries, selecting only required columns is generally preferable.

---

## 16. What is DISTINCT?

**Answer:**
`DISTINCT` removes duplicate values from the result.

```sql
SELECT DISTINCT department
FROM employees;
```

---

## 17. What is WHERE?

**Answer:**
`WHERE` filters rows according to a condition.

```sql
SELECT *
FROM employees
WHERE salary > 50000;
```

---

## 18. What are comparison operators in SQL?

**Answer:**

| Operator | Meaning               |
| -------- | --------------------- |
| `=`      | Equal                 |
| `<>`     | Not equal             |
| `!=`     | Not equal             |
| `>`      | Greater than          |
| `<`      | Less than             |
| `>=`     | Greater than or equal |
| `<=`     | Less than or equal    |

---

## 19. What is AND?

**Answer:**
`AND` requires all specified conditions to be TRUE.

```sql
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 50000;
```

---

## 20. What is OR?

**Answer:**
`OR` returns records when at least one condition is TRUE.

```sql
SELECT *
FROM employees
WHERE department = 'IT'
OR department = 'HR';
```

---

## 21. What is NOT?

**Answer:**
`NOT` reverses a condition.

```sql
SELECT *
FROM employees
WHERE NOT department = 'HR';
```

---

## 22. What is ORDER BY?

**Answer:**
`ORDER BY` sorts query results.

Ascending:

```sql
SELECT *
FROM employees
ORDER BY salary ASC;
```

Descending:

```sql
SELECT *
FROM employees
ORDER BY salary DESC;
```

---

## 23. What is LIMIT?

**Answer:**
`LIMIT` restricts the number of rows returned.

```sql
SELECT *
FROM employees
LIMIT 5;
```

Top 5 salaries:

```sql
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;
```

---

## 24. What is an Alias?

**Answer:**
An alias gives a temporary name to a column or table.

```sql
SELECT
    name AS employee_name,
    salary AS monthly_salary
FROM employees;
```

Table alias:

```sql
SELECT e.name, e.salary
FROM employees AS e;
```

---

## 25. What is the difference between DELETE and TRUNCATE?

**Answer:**

| DELETE                         | TRUNCATE                   |
| ------------------------------ | -------------------------- |
| Removes rows                   | Removes all rows           |
| Can use WHERE                  | Cannot use WHERE           |
| DML command                    | Commonly classified as DDL |
| Can selectively delete records | Removes all table rows     |
| Table structure remains        | Table structure remains    |

Example:

```sql
DELETE FROM employees
WHERE employee_id = 5;
```

```sql
TRUNCATE TABLE employees;
```

---

## 26. What is the difference between DROP and TRUNCATE?

**Answer:**

### DROP

Removes the table itself.

```sql
DROP TABLE employees;
```

### TRUNCATE

Removes all rows but keeps the table structure.

```sql
TRUNCATE TABLE employees;
```

---

## 27. What is UPDATE?

**Answer:**
`UPDATE` modifies existing records.

```sql
UPDATE employees
SET salary = 65000
WHERE employee_id = 2;
```

**Important:** Always carefully check the `WHERE` condition.

---

## 28. What is INSERT?

**Answer:**
`INSERT` adds new records.

```sql
INSERT INTO employees
(employee_id, name, department, salary)
VALUES
(10, 'Gaurav', 'IT', 60000);
```

---

## 29. What is ALTER TABLE?

**Answer:**
`ALTER TABLE` modifies the structure of an existing table.

Add a column:

```sql
ALTER TABLE employees
ADD COLUMN email VARCHAR(100);
```

Rename a column:

```sql
ALTER TABLE employees
RENAME COLUMN name TO employee_name;
```

---

## 30. What are SQL Constraints?

**Answer:**
Constraints are rules applied to table columns to maintain data integrity.

Common constraints:

```text
PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
CHECK
DEFAULT
```

Example:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary NUMERIC(10,2) CHECK (salary > 0)
);
```

---

# TCS NQT / Interview Practice

## 31. Find employees earning more than 50,000.

```sql
SELECT *
FROM employees
WHERE salary > 50000;
```

---

## 32. Find employees from the IT department.

```sql
SELECT *
FROM employees
WHERE department = 'IT';
```

---

## 33. Find the 5 highest-paid employees.

```sql
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;
```

---

## 34. Find unique departments.

```sql
SELECT DISTINCT department
FROM employees;
```

---

## 35. Find employees whose salary is between 40,000 and 60,000.

```sql
SELECT *
FROM employees
WHERE salary BETWEEN 40000 AND 60000;
```

---

## 36. Find employees whose department is IT or HR.

```sql
SELECT *
FROM employees
WHERE department IN ('IT', 'HR');
```

---

## 37. Find employees whose name starts with 'A'.

```sql
SELECT *
FROM employees
WHERE name LIKE 'A%';
```

---

## 38. Find employees whose name ends with 'a'.

```sql
SELECT *
FROM employees
WHERE name LIKE '%a';
```

---

## 39. Find employees with missing salaries.

```sql
SELECT *
FROM employees
WHERE salary IS NULL;
```

---

## 40. Find the highest salary.

```sql
SELECT MAX(salary) AS highest_salary
FROM employees;
```

---

# Quick Interview Revision

```text
SQL
│
├── SELECT     → Retrieve data
├── INSERT     → Add data
├── UPDATE     → Modify data
├── DELETE     → Remove data
│
├── WHERE      → Filter rows
├── DISTINCT   → Remove duplicates
├── ORDER BY   → Sort results
├── LIMIT      → Restrict rows
│
├── PRIMARY KEY → Unique identifier
├── FOREIGN KEY → Table relationship
├── NULL        → Missing/unknown value
│
├── CREATE     → Create object
├── ALTER      → Modify structure
├── TRUNCATE   → Remove all rows
└── DROP       → Remove object
```

## ⭐ Interview Tip

When answering SQL interview questions, use this pattern:

**Definition → Purpose → Syntax → Example**

Example:

> **WHERE** is used to filter rows based on a condition. It is applied before grouping and aggregation in the logical query-processing order.

---

## Important SQL Query Pattern

```sql
SELECT column1, column2
FROM table_name
WHERE condition
ORDER BY column1 DESC
LIMIT 10;
```

Master this pattern first, then move to:

**Functions → Aggregations → GROUP BY → HAVING → JOINs → Subqueries → CTEs → Window Functions**
