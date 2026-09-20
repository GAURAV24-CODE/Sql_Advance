<div align="center">

# 🟣 Day 4 — Aggregation & SQL Functions

### 📊 COUNT • SUM • AVG • MIN/MAX • COUNT DISTINCT • Conditional Aggregation • COALESCE • NULLIF

<p>
  <img src="https://img.shields.io/badge/Day-04-7C3AED?style=for-the-badge" alt="Day 4">
  <img src="https://img.shields.io/badge/SQL-Aggregation%20%26%20SQL%20Functions-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="SQL Aggregation and Functions">
  <img src="https://img.shields.io/badge/PostgreSQL-Practice-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL">
  <img src="https://img.shields.io/badge/Level-Beginner-22C55E?style=for-the-badge" alt="Beginner">
</p>

**A structured Day 4 module focused on aggregate functions, conditional aggregation, and handling NULL values using PostgreSQL.**

</div>

---

# 📌 Day 4 Overview

Day 4 focuses on learning how to **summarize, calculate, and analyze data using SQL aggregate functions**.

The module builds on the filtering and sorting concepts learned in previous days and introduces functions that are commonly used in **Data Analytics, reporting, dashboards, and SQL interviews**.

The module is organized around:

- 🔢 `COUNT()`
- ➕ `SUM()`
- 📊 `AVG()`
- ⬇️ `MIN()` and `MAX()`
- 🔍 `COUNT(DISTINCT)`
- 🧮 Conditional Aggregation
- 🛠️ `COALESCE()`
- ⚠️ `NULLIF()`
- 🧪 Hands-on practice
- 💼 Interview questions
- 📋 Quick revision with a cheatsheet

### 🎯 Main Goal

Learn how to **summarize data, calculate important metrics, perform conditional calculations, and handle NULL or zero values using SQL functions**.

---

# 🗂️ Topics Covered

| # | Topic | File | Purpose |
|---|---|---|---|
| 01 | COUNT() | `01-COUNT.sql` | Count rows and values |
| 02 | SUM() | `02-SUM.sql` | Calculate the total of numeric values |
| 03 | AVG() | `03-AVG.sql` | Calculate average values |
| 04 | MIN() / MAX() | `04-MIN-MAX.sql` | Find minimum and maximum values |
| 05 | COUNT DISTINCT | `05-COUNT-DISTINCT.sql` | Count unique values |
| 06 | Conditional Aggregation | `06-Conditional-Aggregation.sql` | Calculate metrics based on conditions |
| 07 | COALESCE() | `07-COALESCE.sql` | Replace NULL values with a specified value |
| 08 | NULLIF() | `08-NULLIF.sql` | Convert matching values into NULL |
| 09 | Cheatsheet | `Cheatsheet.md` | Quick revision of aggregation and SQL functions |
| 10 | Dataset | `dataset.sql` | SQL dataset used for practice |
| 11 | Day 4 Guide | `Day-4-Aggregation-and-SQL-Functions.md` | Detailed Day 4 learning notes |
| 12 | README | `README.md` | Day 4 module overview |

---

# 🔄 Day 4 Learning Flow

```text
                         🟣 DAY 4
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🔢 COUNT()      │
                   │ Count Records   │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ ➕ SUM()        │
                   │ Total Values    │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 📊 AVG()        │
                   │ Average Values  │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ ⬇️ MIN / MAX    │
                   │ Range Analysis  │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🔍 COUNT        │
                   │ DISTINCT        │
                   │ Unique Values   │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🧮 CONDITIONAL  │
                   │ AGGREGATION     │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🛠️ COALESCE()   │
                   │ Handle NULL     │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ ⚠️ NULLIF()     │
                   │ Handle Zero /   │
                   │ NULL Logic      │
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
                   │ QUESTIONS       │
                   └────────┬────────┘
                            │
                            ▼
                     🎯 DAY 4 COMPLETE
