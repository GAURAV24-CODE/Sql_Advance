<div align="center">

# 🟣 Day 12 — SQL Window Functions

### 🔢 OVER() • PARTITION BY • ORDER BY • ROW_NUMBER() • RANK() • DENSE_RANK() • LAG() • LEAD() • FIRST_VALUE() • LAST_VALUE() • SUM() • AVG()

<p>

  <img src="https://img.shields.io/badge/Day-12-7C3AED?style=for-the-badge" alt="Day 12">

  <img src="https://img.shields.io/badge/SQL-Window_Functions-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="SQL Window Functions">

  <img src="https://img.shields.io/badge/PostgreSQL-Practice-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL">

  <img src="https://img.shields.io/badge/Level-Intermediate-22C55E?style=for-the-badge" alt="Intermediate">

</p>

**A structured Day 12 module focused on analyzing rows using SQL Window Functions in PostgreSQL.**

</div>

---

# 📌 Day 12 Overview

Day 12 focuses on learning how to **perform advanced row-level analysis using SQL Window Functions** without grouping rows into a single result.

The module builds on SQL concepts learned during previous days and introduces Window Functions commonly used in real-world data analysis, reporting, business intelligence, and SQL interviews.

The module is organized around:

* 🔹 `OVER()`
* 📊 `PARTITION BY`
* 🔢 `ORDER BY` with Window Functions
* 🔢 `ROW_NUMBER()`
* 🏆 `RANK()`
* 🏅 `DENSE_RANK()`
* ⬅️ `LAG()`
* ➡️ `LEAD()`
* 🥇 `FIRST_VALUE()`
* 🏁 `LAST_VALUE()`
* ➕ `SUM()` with Window Functions
* 📊 `AVG()` with Window Functions
* 🔄 Running Total
* 🏢 Department-wise Ranking
* 🔀 Previous & Next Row Analysis
* 🧪 Hands-on SQL practice
* 📋 Quick revision with a cheatsheet
* 💼 Interview preparation

### 🎯 Main Goal

Learn how to **analyze individual rows while calculating rankings, totals, averages, previous/next values, and cumulative results using Window Functions.**

---

# 🗂️ Topics Covered

| # | Topic | File | Purpose |
| -- | ------------------------- | ------------------------------- | ----------------------------------------- |
| 01 | `OVER()` | `01-OVER.sql` | Perform calculations across a window of rows |
| 02 | `PARTITION BY` | `02-PARTITION-BY.sql` | Divide rows into groups for calculations |
| 03 | `ORDER BY` with Window Functions | `03-ORDER-BY-Window.sql` | Control row processing order |
| 04 | `ROW_NUMBER()` | `04-ROW-NUMBER.sql` | Assign unique row numbers |
| 05 | `RANK()` | `05-RANK.sql` | Rank rows with gaps after ties |
| 06 | `DENSE_RANK()` | `06-DENSE-RANK.sql` | Rank rows without gaps after ties |
| 07 | `LAG()` & `LEAD()` | `07-LAG-LEAD.sql` | Analyze previous and next rows |
| 08 | `FIRST_VALUE()` & `LAST_VALUE()` | `08-FIRST-LAST-VALUE.sql` | Find first and last values |
| 09 | `SUM()` with Window Functions | `09-SUM-Window.sql` | Calculate totals and cumulative sums |
| 10 | `AVG()` with Window Functions | `10-AVG-Window.sql` | Calculate overall and group averages |
| 11 | Running Total | `11-Running-Total.sql` | Calculate cumulative totals |
| 12 | Department-wise Ranking | `12-Department-Ranking.sql` | Rank employees within departments |
| 13 | Previous & Next Row Analysis | `13-Previous-Next-Analysis.sql` | Compare previous and next row values |
| 14 | Cheatsheet | `Cheatsheet.txt` | Quick revision of Window Functions |
| 15 | Interview Questions | `Interview-Questions.txt` | Prepare for Window Function interviews |
| 16 | Dataset | `Dataset.sql` | Create and populate the employee table |

---

# 🗃️ Day 12 Dataset

Day 12 uses an employee dataset containing sample employee records across multiple departments.

## `employees`

Used for:

* Employee salary analysis
* Department-wise salary calculations
* Employee ranking
* Running totals
* Average salary analysis
* Previous and next row analysis
* Department-wise comparisons
* Window Function interview queries

Main columns:

```text
employee_id
name
department
salary