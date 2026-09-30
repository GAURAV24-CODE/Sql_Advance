
## 3. `13-Advanced-SQL-Patterns/README.md`

```markdown
# Day 13: Advanced SQL Patterns

## 📌 Overview
Advanced SQL patterns combine SQL features to solve complex
data retrieval, transformation, and analytical problems.

These techniques are useful for SQL interviews and real-world
data analysis.

## 🎯 Learning Objectives
- Write complex SQL queries.
- Combine multiple SQL techniques.
- Solve analytical problems.
- Improve query readability.
- Practice interview-style SQL problems.

## 📚 Topics Covered
- Complex joins
- CTE-based query patterns
- Subqueries and correlated subqueries
- CASE expressions
- EXISTS and NOT EXISTS
- Conditional aggregation
- Top-N-per-group problems
- Duplicate detection
- Finding missing records
- Query optimization fundamentals

## 💻 Example: Find the Highest-Paid Employee
in Each Department

```sql
WITH ranked_employees AS (
    SELECT
        employee_name,
        department_id,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE salary_rank = 1;