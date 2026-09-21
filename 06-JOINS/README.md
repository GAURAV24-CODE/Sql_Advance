<div align="center">

# 🔵 Day 6 — SQL JOINs

### 🔗 INNER JOIN • LEFT JOIN • RIGHT JOIN • FULL OUTER JOIN • SELF JOIN • CROSS JOIN • Multiple JOINs • JOIN with GROUP BY • JOIN with HAVING

<p>
  <img src="https://img.shields.io/badge/Day-06-2563EB?style=for-the-badge" alt="Day 6">
  <img src="https://img.shields.io/badge/SQL-JOINs-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="SQL JOINs">
  <img src="https://img.shields.io/badge/PostgreSQL-Practice-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL">
  <img src="https://img.shields.io/badge/Level-Intermediate-22C55E?style=for-the-badge" alt="Intermediate">
</p>

**A structured Day 6 module focused on combining data from multiple tables using SQL JOINs and applying JOINs with aggregation and filtering techniques in PostgreSQL.**

</div>

---

# 📌 Day 6 Overview

Day 6 focuses on learning how to **combine related data from multiple tables** using SQL JOINs.

The module builds on the `GROUP BY`, `HAVING`, and aggregate concepts learned in Day 5 and introduces different JOIN types used in real-world data analysis and SQL interviews.

The module is organized around:

- 🔗 `INNER JOIN`
- ⬅️ `LEFT JOIN`
- ➡️ `RIGHT JOIN`
- 🔄 `FULL OUTER JOIN`
- 🪞 `SELF JOIN`
- ✖️ `CROSS JOIN`
- 🔗 Multiple JOINs
- 📊 JOIN with `GROUP BY`
- 🔎 JOIN with `HAVING`
- 🧪 Hands-on practice
- 💼 Interview questions
- 📋 Quick revision with a cheatsheet
- 🖼️ JOIN diagrams

### 🎯 Main Goal

Learn how to **combine information from multiple related tables and perform meaningful analysis using different SQL JOIN techniques**.

---

# 🗂️ Topics Covered

| # | Topic | File | Purpose |
|---|---|---|---|
| 01 | INNER JOIN | `01-INNER-JOIN.sql` | Return matching records from both tables |
| 02 | LEFT JOIN | `02-LEFT-JOIN.sql` | Return all records from the left table and matching records from the right |
| 03 | RIGHT JOIN | `03-RIGHT-JOIN.sql` | Return all records from the right table and matching records from the left |
| 04 | FULL OUTER JOIN | `04-FULL-OUTER-JOIN.sql` | Return matching and non-matching records from both tables |
| 05 | SELF JOIN | `05-SELF-JOIN.sql` | Join a table with itself |
| 06 | CROSS JOIN | `06-CROSS-JOIN.sql` | Generate combinations between two tables |
| 07 | Multiple JOINs | `07-Multiple-JOINs.sql` | Combine data from multiple tables |
| 08 | JOIN with GROUP BY | `08-JOIN-with-GROUP-BY.sql` | Aggregate joined data by groups |
| 09 | JOIN with HAVING | `09-JOIN-with-HAVING.sql` | Filter aggregated JOIN results |
| 10 | JOIN Diagrams | `JOIN-Diagrams.md` | Visual understanding of JOIN types |
| 11 | Practice | `Practice.sql` | Apply JOIN concepts through hands-on problems |
| 12 | Cheatsheet | `Cheatsheet.md` | Quick revision |
| 13 | Interview Questions | `Day_6_SQL_JOINS_Interview_Questions.txt` | Practice common JOIN interview questions |
| 14 | Dataset | `Dataset.sql` | SQL tables and data used for JOIN practice |

---

# 🔄 Day 6 Learning Flow

```text
                         🔵 DAY 6
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🔗 INNER JOIN   │
                   │ Matching Rows   │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ ⬅️ LEFT JOIN    │
                   │ All Left Rows   │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ ➡️ RIGHT JOIN   │
                   │ All Right Rows  │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🔄 FULL OUTER   │
                   │ JOIN            │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🪞 SELF JOIN    │
                   │ Same Table      │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ ✖️ CROSS JOIN   │
                   │ Combinations    │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🔗 MULTIPLE     │
                   │ JOINs           │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 📊 JOIN +       │
                   │ GROUP BY        │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🔎 JOIN +       │
                   │ HAVING          │
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
                     🎯 DAY 6 COMPLETE