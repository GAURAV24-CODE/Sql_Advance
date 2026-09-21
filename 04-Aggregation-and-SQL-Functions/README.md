<div align="center">

# 🟢 Day 4 — Aggregation & SQL Functions

### 🔢 COUNT • SUM • AVG • MIN/MAX • COUNT DISTINCT • Conditional Aggregation • COALESCE • NULLIF

<p>
  <img src="https://img.shields.io/badge/Day-04-16A34A?style=for-the-badge" alt="Day 4">
  <img src="https://img.shields.io/badge/SQL-Aggregation%20%26%20Functions-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="SQL Aggregation">
  <img src="https://img.shields.io/badge/PostgreSQL-Practice-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL">
  <img src="https://img.shields.io/badge/Level-Beginner-22C55E?style=for-the-badge" alt="Beginner">
</p>

**A structured Day 4 module focused on summarizing data, performing calculations, handling NULL values, and applying aggregation techniques using PostgreSQL.**

</div>

---

# 📌 Day 4 Overview

Day 4 focuses on learning how to **summarize and analyze data using SQL aggregate functions**.

The module builds on the sorting and conditional logic concepts learned in Day 3 and introduces functions that are commonly used in data analysis and SQL interviews.

The module is organized around:

- 🔢 `COUNT()`
- 💰 `SUM()`
- 📊 `AVG()`
- ⬇️ `MIN()` / `MAX()`
- 🎯 `COUNT(DISTINCT)`
- 🧠 Conditional Aggregation
- 🛡️ `COALESCE()`
- ⚠️ `NULLIF()`
- 🧪 Hands-on practice
- 💼 Interview questions
- 📋 Quick revision with a cheatsheet

### 🎯 Main Goal

Learn how to **summarize, calculate, compare, and analyze groups of data using SQL aggregation functions**.

---

# 🗂️ Topics Covered

| # | Topic | File | Purpose |
|---|---|---|---|
| 01 | COUNT | `01-COUNT.sql` | Count rows and values |
| 02 | SUM | `02-SUM.sql` | Calculate the total of numeric values |
| 03 | AVG | `03-AVG.sql` | Calculate average values |
| 04 | MIN / MAX | `04-MIN-MAX.sql` | Find minimum and maximum values |
| 05 | COUNT DISTINCT | `05-COUNT-DISTINCT.sql` | Count unique values |
| 06 | Conditional Aggregation | `06-Conditional-Aggregation.sql` | Calculate aggregates based on conditions |
| 07 | COALESCE | `07-COALESCE.sql` | Replace NULL values with alternative values |
| 08 | NULLIF | `08-NULLIF.sql` | Convert specific values into NULL and prevent calculation issues |
| 09 | Practice | `Practice.sql` | Apply Day 4 aggregation concepts |
| 10 | Cheatsheet | `Cheatsheet.md` | Quick revision |
| 11 | Interview Questions | `Interview-Questions.md` | Practice common interview-style questions |
| 12 | Dataset | `dataset.sql` | SQL dataset used for practice |

---

# 🔄 Day 4 Learning Flow

```text
                         🟢 DAY 4
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🔢 COUNT()      │
                   │ Count Records   │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 💰 SUM()        │
                   │ Calculate Total │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 📊 AVG()        │
                   │ Calculate Avg   │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ ⬇️ MIN / MAX    │
                   │ Find Range      │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🎯 COUNT        │
                   │ DISTINCT        │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🧠 CONDITIONAL  │
                   │ AGGREGATION     │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ 🛡️ COALESCE()   │
                   │ Handle NULL     │
                   └────────┬────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │ ⚠️ NULLIF()     │
                   │ Handle Values   │
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