# SQL Database Basics

## 1. What is SQL?

**SQL (Structured Query Language)** is used to communicate with relational databases.

We use SQL to:

* Read data
* Insert data
* Update data
* Delete data
* Analyze data

---

## 2. What is a Database?

A **database** is an organized collection of data.

Example:

```text
Company Database
│
├── Employees
├── Customers
├── Products
└── Orders
```

---

## 3. What is a Relational Database?

A relational database stores data in **tables**.

```text
Table
│
├── Rows    → Records
└── Columns → Attributes
```

Example:

| employee_id | employee_name | department | salary |
| ----------: | ------------- | ---------- | -----: |
|           1 | Amit          | IT         |  55000 |
|           2 | Priya         | HR         |  45000 |

---

## 4. What is PostgreSQL?

**PostgreSQL** is an open-source **Relational Database Management System (RDBMS)**.

We use PostgreSQL for this entire SQL Interview Mastery journey.

---

## 5. Table, Row and Column

### Table

Stores related data.

```text
employees
```

### Row

One complete record.

```text
1 | Amit | IT | 55000
```

### Column

One attribute.

```text
employee_id
employee_name
department
salary
```

---

## 6. Primary Key

A **Primary Key** uniquely identifies each row.

```sql
employee_id INT PRIMARY KEY
```

Properties:

* Unique
* Cannot be NULL
* Identifies one record

---

## 7. Foreign Key

A **Foreign Key** connects two tables.

```text
customers
    │
    │ customer_id
    ↓
orders
```

It is mainly used to establish relationships between tables.

---

## 8. SQL Command Categories

| Category | Purpose             | Commands               |
| -------- | ------------------- | ---------------------- |
| DQL      | Retrieve data       | SELECT                 |
| DML      | Modify data         | INSERT, UPDATE, DELETE |
| DDL      | Define structure    | CREATE, ALTER, DROP    |
| TCL      | Manage transactions | COMMIT, ROLLBACK       |
| DCL      | Manage permissions  | GRANT, REVOKE          |

---

## 9. Our PostgreSQL Practice Database

Database:

```text
sql_interview_mastery
```

Main practice table:

```text
employees
```

Columns:

```text
employee_id
employee_name
department
job_title
salary
hire_date
city
```

---

## 10. Basic PostgreSQL Query

Retrieve all data:

```sql
SELECT *
FROM employees;
```

Retrieve specific columns:

```sql
SELECT employee_name, salary
FROM employees;
```

---

## 11. Quick Revision

```text
SQL
 ↓
Communicates with Database
 ↓
Database
 ↓
Tables
 ↓
Rows + Columns
```

```text
Primary Key → Uniquely identifies a row

Foreign Key → Connects tables
```

---

## Interview Questions

1. What is SQL?
2. What is a database?
3. What is a relational database?
4. What is PostgreSQL?
5. What is a table?
6. What is a row?
7. What is a column?
8. What is a primary key?
9. What is a foreign key?
10. What are DDL, DML, DQL, TCL and DCL?

---

## Next
