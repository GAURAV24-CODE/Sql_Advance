 <div align="center">

# 🟣 Day 13 — Advanced SQL Patterns

### 🔢 Top N • Nth Highest Salary • Running Total • Moving Average • LAG() • LEAD() • PERCENT_RANK() • NTILE() • Conditional Aggregation • Gaps & Islands • Repeat Customers

<p>
  <img src="https://img.shields.io/badge/Day-13-7C3AED?style=for-the-badge" alt="Day 13">
  <img src="https://img.shields.io/badge/SQL-Advanced_Patterns-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="Advanced SQL Patterns">
  <img src="https://img.shields.io/badge/PostgreSQL-Practice-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL">
  <img src="https://img.shields.io/badge/Level-Advanced-DC2626?style=for-the-badge" alt="Advanced">
</p>

**A structured Day 13 module focused on solving advanced SQL problems using PostgreSQL.**

</div>

---

# 📌 Day 13 Overview

Day 13 focuses on solving **advanced SQL interview questions and real-world data analysis problems** using PostgreSQL.

Building on previous SQL concepts, this module covers ranking, analytical calculations, customer behavior, data reshaping, and sequence analysis. These patterns are useful in technical interviews, data analytics, reporting, and business intelligence.

The module is organized around:

- 🏆 Second-Highest and Nth-Highest Salary
- 🔢 Top N Records
- 🏢 Top N Employees per Group
- ➕ Running Total and Cumulative Sum
- 📊 Moving Average and Rolling Average
- ⬅️ `LAG()` and ➡️ `LEAD()`
- 🥇 `FIRST_VALUE()` and `LAST_VALUE()`
- 📈 `PERCENT_RANK()` and `CUME_DIST()`
- 🪣 `NTILE()` and Salary Quartiles
- 🧮 Conditional Aggregation using `CASE WHEN`
- 🔀 Pivot and Unpivot Operations
- 🧩 Gaps and Islands Problems
- 👥 Repeat Customer Analysis
- 📅 Customer Retention and Cohort Analysis
- 🧪 Hands-on SQL Practice
- 📋 Quick Revision with a Cheatsheet
- 💼 Interview Preparation

### 🎯 Main Goal

Learn how to **solve advanced SQL problems using window functions, aggregate functions, CTEs, ranking techniques, and analytical query patterns**.

---

# 🗂️ Topics Covered

| # | Topic | File | Purpose |
|---:|---|---|---|
| 01 | Second-Highest Salary | `01-Second-Highest-Salary.sql` | Find the second-highest distinct salary |
| 02 | Nth-Highest Salary | `02-Nth-Highest-Salary.sql` | Find the Nth-highest distinct salary |
| 03 | Top N Records | `03-Top-N.sql` | Retrieve top records and salary rankings |
| 04 | Top N per Group | `04-Top-N-Per-Group.sql` | Find top employees in each department |
| 05 | Running Total | `05-Running-Total-and-Cumulative-Sum.sql` | Calculate cumulative totals |
| 06 | Moving Average | `06-Moving-Average.sql` | Calculate rolling averages |
| 07 | `LAG()` and `LEAD()` | `07-LAG-and-LEAD.sql` | Compare previous and next rows |
| 08 | `FIRST_VALUE()` and `LAST_VALUE()` | `08-FIRST-LAST-VALUE.sql` | Retrieve first and last values in a window |
| 09 | Percentile Ranking | `09-PERCENT-RANK-AND-CUME-DIST.sql` | Analyze relative ranks and distributions |
| 10 | `NTILE()` and Quartiles | `10-NTILE-Quartiles-and-Buckets.sql` | Divide records into ordered buckets |
| 11 | Conditional Aggregation | `11-Conditional-Aggregation.sql` | Calculate conditional counts and totals |
| 12 | Pivot | `12-Pivot-and-Rows-to-Columns.sql` | Convert category rows into columns |
| 13 | Unpivot | `13-Unpivot-Columns-to-Rows.sql` | Convert columns into rows |
| 14 | Gaps and Islands | `14-Gaps-and-Islands.sql` | Find missing dates and consecutive sequences |
| 15 | Repeat Customers | `15-Repeat-Customers.sql` | Identify repeat customers and spending patterns |
| 16 | Customer Retention and Cohorts | `16-Customer-Retention-and-Cohort-Analysis.sql` | Analyze customer return behavior over time |

---

# 🗃️ Day 13 Dataset

Day 13 uses a PostgreSQL practice dataset containing employee, department, customer, and order records.

### `00-Create-Dataset.sql`

The dataset setup file creates and populates the following tables:

**1. `departments`**

Used for department-wise ranking, payroll reports, and employee comparisons.

Main columns:
```text
department_id
department_name
```

**2. `employees`**

Used for salary rankings, Top N queries, moving averages, and employee analysis.

Main columns:
```text
employee_id
employee_name
department_id
salary
hire_date
```

**3. `customers`**

Used for customer analysis, repeat purchases, and retention queries.

Main columns:
```text
customer_id
customer_name
city
```

**4. `orders`**

Used for running totals, moving averages, customer spending, and purchase history analysis.

Main columns:
```text
order_id
customer_id
order_date
amount
```

### Dataset Setup

Run `00-Create-Dataset.sql` in your PostgreSQL practice database before executing the query files. It contains the sample records required for the examples.

---

# 🧠 Key SQL Concepts

| Concept | Application |
|---|---|
| `ROW_NUMBER()` | Assign unique row numbers |
| `RANK()` | Rank records while allowing gaps after ties |
| `DENSE_RANK()` | Rank records without gaps after ties |
| `SUM() OVER()` | Calculate running and cumulative totals |
| `AVG() OVER()` | Calculate moving and group averages |
| `LAG()` / `LEAD()` | Compare preceding and following rows |
| `FIRST_VALUE()` / `LAST_VALUE()` | Retrieve values from a window frame |
| `PERCENT_RANK()` / `CUME_DIST()` | Analyze relative position and distribution |
| `NTILE()` | Divide ordered records into buckets |
| `CASE WHEN` | Implement conditional logic |
| `GROUP BY` / `HAVING` | Aggregate and filter grouped results |
| CTEs | Break complex queries into readable steps |
| `CROSS JOIN LATERAL` | Reshape columns into rows |
| `GENERATE_SERIES()` | Generate date sequences for gap analysis |

---

# 💼 Interview Preparation

The module includes five practice patterns for each topic:

- 🟢 **Easy:** Basic syntax and fundamental queries.
- 🟡 **Medium:** Multi-step queries and practical analysis.
- 🔴 **Hard:** Complex ranking, analytical, and date-sequence problems.
- 🎯 **TCS NQT:** Multiple-choice questions and placement-style SQL practice.
- 🚀 **Advanced Interview:** CTEs, window functions, and real-world analytical problems.

These patterns help build SQL problem-solving skills for Data Analyst, Data Scientist, and SQL Developer interviews.

---

# 🚀 Learning Objectives

By completing Day 13, you should be able to:

- Find the second-highest and Nth-highest salary.
- Retrieve Top N records within individual groups.
- Calculate running totals and moving averages.
- Compare previous and next records.
- Apply percentile functions and divide records into buckets.
- Build conditional summary reports.
- Pivot and unpivot tabular data.
- Identify gaps, islands, and consecutive-date sequences.
- Identify repeat customers and analyze purchasing behavior.
- Write more readable and maintainable analytical SQL queries.

---

# 🛠️ Tools and Technologies

- **Database:** PostgreSQL
- **Editor:** Visual Studio Code
- **Version Control:** Git and GitHub
- **Language:** SQL

---

# 📈 Progress Tracker

- [ ] Complete the dataset setup.
- [ ] Practice all 16 topic files.
- [ ] Run queries against the sample tables.
- [ ] Review the cheatsheet.
- [ ] Solve the interview questions.
- [ ] Upload the completed work to GitHub.

---

# 🎯 Final Note

Day 13 is focused on moving beyond basic SQL queries and developing the ability to solve analytical SQL problems efficiently.

**Practice consistently, understand the logic behind every query, and build the confidence to explain your solutions in interviews.**

`#100DaysOfLearning` `#SQL` `#PostgreSQL` `#AdvancedSQL` `#DataAnalytics` `#SQLInterviewPreparation`
