
## 2. `12-Window-Functions/README.md`

```markdown
# Day 12: SQL Window Functions

## 📌 Overview
Window functions perform calculations across a set of related rows
without combining those rows into a single result.

They are useful for ranking, running totals, and analytical queries.

## 🎯 Learning Objectives
- Understand window functions.
- Use `OVER()` and `PARTITION BY`.
- Apply ranking functions.
- Calculate running totals and moving averages.
- Compare window functions with aggregate functions.

## 📚 Topics Covered
- Introduction to window functions
- OVER() clause
- PARTITION BY
- ORDER BY inside OVER()
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LAG() and LEAD()
- Running totals
- Moving averages

## 💻 Example

```sql
SELECT
    employee_name,
    department_id,
    salary,
    RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;