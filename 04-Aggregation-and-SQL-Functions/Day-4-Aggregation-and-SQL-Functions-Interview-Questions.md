# SQL Interview Questions — Day 4
# Aggregation and SQL Functions
# Database: PostgreSQL

## Topics Covered
1. COUNT()
2. SUM()
3. AVG()
4. MIN()
5. MAX()
6. COUNT(DISTINCT)
7. Conditional Aggregation
8. COALESCE()
9. NULLIF()

---

# BASIC INTERVIEW QUESTIONS

## Q1. What is an aggregate function?
An aggregate function performs a calculation on multiple rows and returns a single result.

Examples: COUNT(), SUM(), AVG(), MIN(), MAX().

```sql
SELECT COUNT(*)
FROM employees;
```

## Q2. What is the difference between aggregate and scalar functions?
Aggregate functions work on multiple rows and return a summary result. Scalar functions generally return a value for each row.

## Q3. What does COUNT(*) do?
It counts all rows returned by the query, including rows containing NULL values.

```sql
SELECT COUNT(*)
FROM employees;
```

## Q4. COUNT(*) vs COUNT(column)?
COUNT(*) counts all rows. COUNT(column) counts only non-NULL values in that column.

## Q5. What does SUM() do?
It calculates the total of a numeric column.

```sql
SELECT SUM(salary)
FROM employees;
```

## Q6. What does AVG() do?
It calculates the average of numeric values and ignores NULL values.

```sql
SELECT AVG(salary)
FROM employees;
```

## Q7. What do MIN() and MAX() do?
MIN() returns the smallest value. MAX() returns the largest value.

```sql
SELECT MIN(salary), MAX(salary)
FROM employees;
```

## Q8. What is COUNT(DISTINCT)?
It counts unique non-NULL values.

```sql
SELECT COUNT(DISTINCT department)
FROM employees;
```

## Q9. What is NULL?
NULL represents a missing, unknown, or unavailable value. It is not the same as 0, an empty string, or FALSE.

## Q10. How do aggregate functions handle NULL?
Most aggregate functions ignore NULL values. COUNT(*) is the important exception because it counts rows.

---

# INTERMEDIATE INTERVIEW QUESTIONS

## Q11. Find the total number of employees.

```sql
SELECT COUNT(*)
FROM employees;
```

## Q12. Find total salary.

```sql
SELECT SUM(salary)
FROM employees;
```

## Q13. Find average salary.

```sql
SELECT AVG(salary)
FROM employees;
```

## Q14. Find highest salary.

```sql
SELECT MAX(salary)
FROM employees;
```

## Q15. Find lowest salary.

```sql
SELECT MIN(salary)
FROM employees;
```

## Q16. Find the number of unique departments.

```sql
SELECT COUNT(DISTINCT department)
FROM employees;
```

## Q17. Find total salary of IT employees.

```sql
SELECT SUM(salary)
FROM employees
WHERE department = 'IT';
```

## Q18. Find average salary of IT employees.

```sql
SELECT AVG(salary)
FROM employees
WHERE department = 'IT';
```

## Q19. Find highest salary in IT.

```sql
SELECT MAX(salary)
FROM employees
WHERE department = 'IT';
```

## Q20. Find lowest salary in IT.

```sql
SELECT MIN(salary)
FROM employees
WHERE department = 'IT';
```

## Q21. Count employees in IT.

```sql
SELECT COUNT(*)
FROM employees
WHERE department = 'IT';
```

## Q22. What is conditional aggregation?
Conditional aggregation applies an aggregate function to rows satisfying a condition.

PostgreSQL:

```sql
SELECT
    COUNT(*) FILTER (WHERE department = 'IT') AS it_employees,
    COUNT(*) FILTER (WHERE department = 'HR') AS hr_employees
FROM employees;
```

Using CASE:

```sql
SELECT
    SUM(CASE WHEN department = 'IT' THEN 1 ELSE 0 END) AS it_employees
FROM employees;
```

## Q23. What is COALESCE()?
COALESCE() returns the first non-NULL value.

```sql
SELECT COALESCE(salary, 0)
FROM employees;
```

## Q24. Why is COALESCE() useful?
It is useful for handling missing values.

```sql
SELECT employee_name, COALESCE(salary, 0) AS salary
FROM employees;
```

## Q25. What is NULLIF()?
NULLIF() returns NULL when two expressions are equal.

```sql
SELECT NULLIF(10, 10);
```

Result: NULL.

```sql
SELECT NULLIF(10, 5);
```

Result: 10.

---

# ADVANCED INTERVIEW QUESTIONS

## Q26. How do you calculate average salary without NULL values?

```sql
SELECT AVG(salary)
FROM employees;
```

AVG() ignores NULL values.

## Q27. How do you replace NULL salary with zero?

```sql
SELECT employee_name, COALESCE(salary, 0) AS salary
FROM employees;
```

## Q28. How do you count employees who have a salary?

```sql
SELECT COUNT(salary)
FROM employees;
```

## Q29. How do you count all employees?

```sql
SELECT COUNT(*)
FROM employees;
```

## Q30. COUNT(*) vs COUNT(DISTINCT department)?
COUNT(*) counts rows. COUNT(DISTINCT department) counts unique department values.

If departments are IT, IT, HR, Sales, Sales:
COUNT(*) = 5
COUNT(DISTINCT department) = 3.

## Q31. Can aggregate functions be used with WHERE?
Yes. WHERE filters rows first, then the aggregate calculates the result.

```sql
SELECT AVG(salary)
FROM employees
WHERE department = 'IT';
```

## Q32. Can aggregate functions be used with GROUP BY?
Yes.

```sql
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;
```

## Q33. What happens when an aggregate is used without GROUP BY?
It produces one summary result for the complete filtered dataset.

```sql
SELECT AVG(salary)
FROM employees;
```

## Q34. Why can't normal columns always be selected with aggregate functions?
Because an aggregate may return one result while a normal column can contain many different values. Use GROUP BY or another appropriate query design.

## Q35. SUM() vs COUNT()?
COUNT() counts rows/values. SUM() adds numeric values.

## Q36. AVG() vs SUM()?
SUM() returns a total. AVG() returns an average.

For 30000, 40000, 50000:
SUM = 120000
AVG = 40000.

## Q37. How can NULLIF() prevent division-by-zero?

```sql
SELECT total_sales / NULLIF(total_orders, 0)
FROM sales;
```

If total_orders is zero, NULLIF() returns NULL instead of zero.

---

# SQL INTERVIEW QUERY PATTERNS

## Q38. Find the second-highest salary.

```sql
SELECT MAX(salary)
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);
```

## Q39. Find total salary by department.

```sql
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;
```

## Q40. Find average salary by department.

```sql
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;
```

## Q41. Find highest salary by department.

```sql
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;
```

## Q42. Find number of employees in each department.

```sql
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;
```

## Q43. Find departments having more than 5 employees.

```sql
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
```

## Q44. Find departments where average salary is greater than 50000.

```sql
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;
```

---

# SCENARIO-BASED QUESTIONS

## Q45. Find total company salary expense.

```sql
SELECT SUM(salary) AS total_salary
FROM employees;
```

## Q46. Find average salary for every department.

```sql
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;
```

## Q47. Find the department with the most employees.

```sql
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC
LIMIT 1;
```

## Q48. Find the department with the highest total salary expense.

```sql
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;
```

## Q49. Find departments where highest salary is greater than 100000.

```sql
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department
HAVING MAX(salary) > 100000;
```

## Q50. Find number of employees earning more than 50000.

```sql
SELECT COUNT(*) AS employee_count
FROM employees
WHERE salary > 50000;
```

---

# MOST IMPORTANT INTERVIEW QUESTIONS

1. What is an aggregate function?
2. What is COUNT(*)?
3. COUNT(*) vs COUNT(column)?
4. COUNT(column) vs COUNT(DISTINCT column)?
5. What does SUM() do?
6. What does AVG() do?
7. How does AVG() handle NULL?
8. What do MIN() and MAX() do?
9. What is conditional aggregation?
10. What is COALESCE()?
11. What is NULLIF()?
12. Why is NULLIF() useful in division?
13. Can aggregate functions be used with WHERE?
14. Can aggregate functions be used with GROUP BY?
15. How do you find the highest salary?
16. How do you find the second-highest salary?
17. How do you find average salary by department?
18. How do you find departments with more than 5 employees?
19. How do you find the department with the highest total salary?
20. What is the difference between WHERE and HAVING?

---

# QUICK REVISION

| Function | Purpose |
|---|---|
| COUNT() | Count rows/values |
| SUM() | Calculate total |
| AVG() | Calculate average |
| MIN() | Find minimum |
| MAX() | Find maximum |
| COUNT(DISTINCT) | Count unique values |
| COALESCE() | Handle/replace NULL |
| NULLIF() | Return NULL when values are equal |

# INTERVIEW CHEAT PATTERNS

```sql
-- Count rows
SELECT COUNT(*) FROM employees;

-- Total
SELECT SUM(salary) FROM employees;

-- Average
SELECT AVG(salary) FROM employees;

-- Highest
SELECT MAX(salary) FROM employees;

-- Lowest
SELECT MIN(salary) FROM employees;

-- Unique count
SELECT COUNT(DISTINCT department) FROM employees;

-- Aggregate by category
SELECT department, AVG(salary)
FROM employees
GROUP BY department;

-- Filter groups
SELECT department, AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;
```

# DAY 4 KEY TAKEAWAY

Aggregation turns many rows into useful summary information.

Core flow:

ROWS
↓
WHERE
↓
GROUP BY
↓
COUNT / SUM / AVG / MIN / MAX
↓
HAVING
↓
ORDER BY

These concepts are important for Data Analyst, Data Scientist,
BI, and SQL interview preparation.
