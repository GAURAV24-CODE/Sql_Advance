<div align="center">

# 🟢 Day 1 — SQL Fundamentals

### 🧠 Database Basics • SELECT • DISTINCT • Aliases • Calculated Columns • LIMIT • NULL

<p>
  <img src="https://img.shields.io/badge/Day-01-0F766E?style=for-the-badge" alt="Day 1">
  <img src="https://img.shields.io/badge/SQL-Fundamentals-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="SQL Fundamentals">
  <img src="https://img.shields.io/badge/PostgreSQL-Practice-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL">
  <img src="https://img.shields.io/badge/Level-Beginner-22C55E?style=for-the-badge" alt="Beginner">
</p>

**A structured Day 1 module for building the foundation required for practical SQL and interview problem solving.**

</div>

---

## 📌 Day 1 Overview

Day 1 focuses on the basic building blocks of SQL.

The module is organized around:

- 🗄️ Database basics
- 🔎 `SELECT` and `FROM`
- ✨ `DISTINCT`
- 🏷️ Column aliases
- 🧮 Calculated columns
- 🔢 `LIMIT`
- ❓ NULL basics
- 🧪 Hands-on practice
- 💼 Interview questions
- 📋 Quick revision with a cheatsheet

The goal is to understand the fundamentals before moving into filtering, sorting, aggregation, and more advanced SQL.

---

# 🗂️ Topics Covered

| # | Topic | File | Purpose |
|---|---|---|---|
| 01 | Database Basics | `01-Database-Basics.md` | Understand databases, tables, rows, columns, and basic SQL concepts |
| 02 | SELECT & FROM | `02-SELECT-FROM.sql` | Retrieve data from tables |
| 03 | DISTINCT | `03-DISTINCT.sql` | Return unique values |
| 04 | Column Aliases | `04-Column-Aliases.sql` | Rename columns in query output |
| 05 | Calculated Columns | `05-Calculated-Columns.sql` | Create values using expressions |
| 06 | LIMIT | `06-LIMIT.sql` | Restrict the number of returned rows |
| 07 | NULL Basics | `07-NULL-Basics.sql` | Understand missing/unknown values |
| 08 | Practice | `Practice.sql` | Apply Day 1 concepts |
| 09 | Cheatsheet | `Cheatsheet.md` | Quick revision |
| 10 | Interview Questions | `Interview-Questions.md` | Practice common interview-style questions |
| 11 | Dataset | `dataset.sql` | SQL dataset used for practice |

---

# 🔄 Day 1 Learning Flow

```text
                    🟢 DAY 1
                       │
                       ▼
              ┌─────────────────┐
              │ 🗄️ DATABASE     │
              │    BASICS       │
              └────────┬────────┘
                       │
                       ▼
              ┌─────────────────┐
              │ 🔎 SELECT +     │
              │    FROM         │
              └────────┬────────┘
                       │
                       ▼
              ┌─────────────────┐
              │ ✨ DISTINCT     │
              │ Unique Values   │
              └────────┬────────┘
                       │
                       ▼
              ┌─────────────────┐
              │ 🏷️ ALIASES      │
              │ Rename Output   │
              └────────┬────────┘
                       │
                       ▼
              ┌─────────────────┐
              │ 🧮 CALCULATED   │
              │    COLUMNS      │
              └────────┬────────┘
                       │
                       ▼
              ┌─────────────────┐
              │ 🔢 LIMIT        │
              │ Control Rows    │
              └────────┬────────┘
                       │
                       ▼
              ┌─────────────────┐
              │ ❓ NULL BASICS  │
              │ Missing Values  │
              └────────┬────────┘
                       │
                       ▼
              ┌─────────────────┐
              │ 🧪 PRACTICE     │
              └────────┬────────┘
                       │
                       ▼
              ┌─────────────────┐
              │ 💼 INTERVIEW    │
              │   QUESTIONS     │
              └────────┬────────┘
                       │
                       ▼
              🎯 DAY 1 COMPLETE
```

---

# 🧠 Core SQL Flow

A simple Day 1 SQL query can be understood like this:

```text
TABLE
  │
  ▼
FROM
  │
  ▼
SELECT
  │
  ├── DISTINCT
  │
  ├── Calculated Columns
  │
  └── Aliases
  │
  ▼
LIMIT
  │
  ▼
RESULT
```

### Example

```sql
SELECT
    name,
    salary,
    salary * 12 AS annual_salary
FROM employees
LIMIT 5;
```

Conceptually:

```text
employees table
      ↓
FROM employees
      ↓
Select name + salary
      ↓
Calculate salary × 12
      ↓
Rename result → annual_salary
      ↓
Return first 5 rows
```

---

# 🔎 Topic Breakdown

## 01 — Database Basics

File:

```text
01-Database-Basics.md
```

Focus on understanding the basic database structure and terminology required before writing SQL queries.

Think of the structure as:

```text
DATABASE
   │
   ├── TABLE
   │    │
   │    ├── ROW
   │    ├── ROW
   │    └── ROW
   │
   └── TABLE
```

---

## 02 — SELECT & FROM

File:

```text
02-SELECT-FROM.sql
```

`SELECT` is used to specify the data you want to retrieve.

`FROM` identifies the table from which the data is retrieved.

Basic structure:

```sql
SELECT column_name
FROM table_name;
```

Multiple columns:

```sql
SELECT
    column1,
    column2,
    column3
FROM table_name;
```

---

## 03 — DISTINCT

File:

```text
03-DISTINCT.sql
```

`DISTINCT` is used when you want unique values in the result.

```sql
SELECT DISTINCT department
FROM employees;
```

Flow:

```text
Table
  ↓
Select column
  ↓
Remove duplicate values
  ↓
Unique result
```

---

## 04 — Column Aliases

File:

```text
04-Column-Aliases.sql
```

Aliases provide a temporary name for a column or expression in the query result.

```sql
SELECT
    salary AS monthly_salary
FROM employees;
```

Flow:

```text
Original Column
      ↓
     salary
      ↓
   AS alias
      ↓
monthly_salary
```

---

## 05 — Calculated Columns

File:

```text
05-Calculated-Columns.sql
```

Calculated columns allow expressions to be created directly inside a query.

Example:

```sql
SELECT
    salary,
    salary * 12 AS annual_salary
FROM employees;
```

Flow:

```text
salary
  │
  ├── × 12
  │
  ▼
annual_salary
```

---

## 06 — LIMIT

File:

```text
06-LIMIT.sql
```

`LIMIT` controls how many rows are returned.

```sql
SELECT *
FROM employees
LIMIT 10;
```

Flow:

```text
Table
  ↓
Query Result
  ↓
LIMIT 10
  ↓
First 10 Rows
```

---

## 07 — NULL Basics

File:

```text
07-NULL-Basics.sql
```

NULL represents a missing or unknown value.

Important idea:

```text
NULL ≠ 0
NULL ≠ ''
NULL ≠ FALSE
```

When checking for NULL, SQL commonly uses:

```sql
IS NULL
```

or:

```sql
IS NOT NULL
```

Example:

```sql
SELECT *
FROM employees
WHERE manager_id IS NULL;
```

---

# 🧪 Practice Workflow

Use the Day 1 material in this order:

```text
01. Read the concept
        ↓
02. Understand the syntax
        ↓
03. Run the example
        ↓
04. Modify the query
        ↓
05. Write your own query
        ↓
06. Solve Practice.sql
        ↓
07. Attempt Interview-Questions.md
        ↓
08. Revise Cheatsheet.md
```

### ⭐ Practice Rule

> **Don't only copy the query. Type it yourself and experiment with it.**

Try changing:

- column names
- table names
- calculations
- aliases
- `LIMIT` values
- selected columns

---

# 📁 File Guide

| File | What to do |
|---|---|
| `01-Database-Basics.md` | Read and understand the concepts |
| `02-SELECT-FROM.sql` | Practice retrieving data |
| `03-DISTINCT.sql` | Practice unique-value queries |
| `04-Column-Aliases.sql` | Practice readable output names |
| `05-Calculated-Columns.sql` | Practice expressions and calculations |
| `06-LIMIT.sql` | Practice limiting result rows |
| `07-NULL-Basics.sql` | Practice NULL concepts |
| `dataset.sql` | Load/use the practice dataset |
| `Practice.sql` | Solve exercises |
| `Cheatsheet.md` | Revise quickly |
| `Interview-Questions.md` | Test interview readiness |

---

# 💼 Interview Focus

After completing Day 1, you should be able to explain and use:

### Fundamentals
- What is a database?
- What is a table?
- What are rows and columns?
- What does `SELECT` do?
- What does `FROM` do?
- What is `DISTINCT`?
- What is a column alias?
- What is a calculated column?
- What does `LIMIT` do?
- What is NULL?

### Query-writing skills

You should be comfortable writing queries such as:

```sql
SELECT *
FROM employees;
```

```sql
SELECT name, department
FROM employees;
```

```sql
SELECT DISTINCT department
FROM employees;
```

```sql
SELECT
    name,
    salary AS monthly_salary
FROM employees;
```

```sql
SELECT
    name,
    salary,
    salary * 12 AS annual_salary
FROM employees;
```

```sql
SELECT *
FROM employees
LIMIT 5;
```

---

# 🎯 Day 1 Completion Checklist

- [ ] Read `01-Database-Basics.md`
- [ ] Complete `02-SELECT-FROM.sql`
- [ ] Complete `03-DISTINCT.sql`
- [ ] Complete `04-Column-Aliases.sql`
- [ ] Complete `05-Calculated-Columns.sql`
- [ ] Complete `06-LIMIT.sql`
- [ ] Complete `07-NULL-Basics.sql`
- [ ] Run the dataset
- [ ] Complete `Practice.sql`
- [ ] Review `Cheatsheet.md`
- [ ] Attempt `Interview-Questions.md`

---

# 🚀 What Comes Next?

After Day 1, the learning path continues toward:

```text
DAY 1
SQL Fundamentals
      ↓
DAY 2
Filtering Data
      ↓
DAY 3
Sorting & Conditional Logic
      ↓
DAY 4
Aggregation & SQL Functions
      ↓
DAY 5
GROUP BY & HAVING
      ↓
DAY 6+
JOINs → Subqueries → CTEs → Window Functions
      ↓
Advanced SQL
      ↓
SQL Projects
      ↓
Mock Interviews
```

---

# 🏆 Learning Philosophy

### Learn → Write → Practice → Debug → Explain → Repeat

The purpose of Day 1 is not to finish SQL quickly.

It is to build a foundation that makes the advanced topics easier to understand.

```text
SQL KNOWLEDGE
     ↓
QUERY WRITING
     ↓
PROBLEM SOLVING
     ↓
ANALYTICAL THINKING
     ↓
INTERVIEW READINESS
```

---

<div align="center">

## 🟢 DAY 1 — FOUNDATION BUILT

**SQL → PRACTICE → PROBLEM SOLVING**

### Keep learning. Keep practicing. Keep solving. 🚀

</div>
