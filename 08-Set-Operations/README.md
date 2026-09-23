<div align="center">

# 🟠 Day 8 — SQL Set Operations

### 🔗 UNION • UNION ALL • INTERSECT • EXCEPT • ORDER BY • WHERE • JOIN • Real-World Patterns

<p>
  <img src="https://img.shields.io/badge/Day-08-F97316?style=for-the-badge" alt="Day 8">
  <img src="https://img.shields.io/badge/SQL-Set%20Operations-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="SQL Set Operations">
  <img src="https://img.shields.io/badge/PostgreSQL-Practice-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL">
  <img src="https://img.shields.io/badge/Level-Intermediate-22C55E?style=for-the-badge" alt="Intermediate">
</p>

**A structured Day 8 module focused on combining, comparing, filtering, and analyzing SQL result sets using PostgreSQL Set Operations.**

</div>

---

# 📌 Day 8 Overview

Day 8 focuses on **SQL Set Operations**, which allow multiple `SELECT` queries to be combined or compared to solve practical data-analysis problems.

The module builds on the SQL concepts learned in previous days, including:

- `SELECT`
- `WHERE`
- `JOIN`
- `GROUP BY`
- Aggregate Functions
- Subqueries

The module introduces powerful techniques for comparing datasets such as customers from different years and orders from different sales channels.

The module is organized around:

- 🔗 `UNION`
- ➕ `UNION ALL`
- 🔄 `INTERSECT`
- ➖ `EXCEPT`
- ↕️ Set Operations with `ORDER BY`
- 🔎 Set Operations with `WHERE`
- 🔗 Set Operations with `JOIN`
- 💼 Real-world Set Operation Patterns
- 🧪 Hands-on practice
- 💼 Interview questions
- 📋 Quick revision with a cheatsheet

### 🎯 Main Goal

Learn how to **combine, compare, filter, and analyze multiple SQL result sets** using practical PostgreSQL queries.

---

# 🗂️ Topics Covered

| # | Topic | File | Purpose |
|---|---|---|---|
| 01 | UNION | `01-UNION.sql` | Combine result sets and remove duplicates |
| 02 | UNION ALL | `02-UNION-ALL.sql` | Combine result sets while keeping duplicates |
| 03 | INTERSECT | `03-INTERSECT.sql` | Find records common to both result sets |
| 04 | EXCEPT | `04-EXCEPT.sql` | Find records present in the first result but not the second |
| 05 | UNION vs UNION ALL | `05-UNION-vs-UNION-ALL.sql` | Compare duplicate handling and use cases |
| 06 | Set Operations with ORDER BY | `06-Set-Operations-with-ORDER-BY.sql` | Sort the final combined result |
| 07 | Set Operations with WHERE | `07-Set-Operations-with-WHERE.sql` | Filter individual result sets before combining |
| 08 | Set Operations with JOIN | `08-Set-Operations-with-JOIN.sql` | Combine Set Operations with related table data |
| 09 | Real-World Set Operation Patterns | `09-Real-World-Set-Operation-Patterns.sql` | Solve practical business-analysis scenarios |
| 10 | Practice | `Practice.sql` | Apply Day 8 concepts through hands-on SQL problems |
| 11 | Cheatsheet | `Cheatsheet.md` | Quick revision |
| 12 | Interview Questions | `Interview-Questions.md` | Practice common interview-style questions |

---

# 🗄️ Dataset

Day 8 uses a fresh PostgreSQL dataset designed specifically for practicing Set Operations.

### Tables

```text
customers_2025
customers_2026
online_orders
store_orders