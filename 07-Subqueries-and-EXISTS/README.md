<div align="center">

# 🟣 Day 7 — Subqueries & EXISTS

### 🔍 Scalar Subquery • WHERE Subquery • FROM Subquery • SELECT Subquery • Correlated Subquery • EXISTS • NOT EXISTS

<p>
  <img src="https://img.shields.io/badge/Day-07-7C3AED?style=for-the-badge" alt="Day 7">
  <img src="https://img.shields.io/badge/SQL-Subqueries%20%26%20EXISTS-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="SQL Subqueries">
  <img src="https://img.shields.io/badge/PostgreSQL-Practice-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL">
  <img src="https://img.shields.io/badge/Level-Intermediate-22C55E?style=for-the-badge" alt="Intermediate">
</p>

**A structured Day 7 module focused on writing nested SQL queries, using correlated subqueries, and checking the existence or absence of related records with PostgreSQL.**

</div>

---

# 📌 Day 7 Overview

Day 7 focuses on learning how to **use one SQL query inside another query** to solve problems that require multiple levels of analysis.

The module builds on the JOIN, GROUP BY, HAVING, and aggregate concepts learned in previous days and introduces subqueries and existence checks.

The module is organized around:

- 🔢 Scalar Subqueries
- 🔎 `WHERE` Subqueries
- 📦 `FROM` Subqueries
- 🎯 `SELECT` Subqueries
- 🔄 Correlated Subqueries
- ✅ `EXISTS`
- ❌ `NOT EXISTS`
- 🧪 Hands-on practice
- 💼 Interview questions
- 📋 Quick revision with a cheatsheet

### 🎯 Main Goal

Learn how to **use nested queries to compare, filter, calculate, and validate data across related records**.

---

# 🗂️ Topics Covered

| # | Topic | File | Purpose |
|---|---|---|---|
| 01 | Scalar Subquery | `01-Scalar-Subquery.sql` | Return a single value from a subquery |
| 02 | WHERE Subquery | `02-WHERE-Subquery.sql` | Filter records using the result of another query |
| 03 | FROM Subquery | `03-FROM-Subquery.sql` | Use a subquery as a temporary result set |
| 04 | SELECT Subquery | `04-SELECT-Subquery.sql` | Use a subquery to calculate a value in the SELECT list |
| 05 | Correlated Subquery | `05-Correlated-Subquery.sql` | Execute a subquery based on values from the outer query |
| 06 | EXISTS | `06-EXISTS.sql` | Check whether related records exist |
| 07 | NOT EXISTS | `07-NOT-EXISTS.sql` | Check whether related records do not exist |
| 08 | Practice | `Practice.sql` | Apply Day 7 concepts through hands-on SQL problems |
| 09 | Cheatsheet | `Cheatsheet.md` | Quick revision |
| 10 | Interview Questions | `Interview-Questions.md` | Practice common interview-style questions |

---

# 🔄 Day 7 Learning Flow

```text
                         🟣 DAY 7
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🔢 SCALAR       │
                   │ SUBQUERY        │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🔎 WHERE        │
                   │ SUBQUERY        │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 📦 FROM         │
                   │ SUBQUERY        │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🎯 SELECT       │
                   │ SUBQUERY        │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🔄 CORRELATED   │
                   │ SUBQUERY        │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ ✅ EXISTS       │
                   │ Check Records   │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ ❌ NOT EXISTS   │
                   │ Missing Records │
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
                     🎯 DAY 7 COMPLETE