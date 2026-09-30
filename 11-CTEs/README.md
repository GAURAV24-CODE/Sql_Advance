# Day 11: Common Table Expressions (CTEs)

## 📌 Overview
A Common Table Expression (CTE) is a temporary named result set
that makes complex SQL queries easier to read and maintain.

CTEs are defined using the `WITH` clause and can be referenced
within the SQL statement that follows.

## 🎯 Learning Objectives
- Understand CTEs and their syntax.
- Write queries using the `WITH` clause.
- Use multiple CTEs in a single query.
- Understand recursive CTEs.
- Compare CTEs with subqueries.

## 📚 Topics Covered
- Introduction to CTEs
- Basic CTE syntax
- CTEs with filtering
- CTEs with aggregate functions
- Multiple CTEs
- Recursive CTEs
- CTEs vs. subqueries

## 💻 Example

```sql
WITH department_salary AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT *
FROM department_salary
WHERE avg_salary > 50000;