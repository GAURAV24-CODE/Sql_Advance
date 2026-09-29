<div align="center">

# 🟣 Day 10 — SQL Date & Time

### 📅 DATE Basics • CURRENT_DATE • CURRENT_TIMESTAMP • EXTRACT • DATE Arithmetic • INTERVAL • AGE • DATE_TRUNC • TO_CHAR • Date Filtering • CASE

<p>
  <img src="https://img.shields.io/badge/Day-10-7C3AED?style=for-the-badge" alt="Day 10">
  <img src="https://img.shields.io/badge/SQL-Date%20%26%20Time-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="SQL Date and Time">
  <img src="https://img.shields.io/badge/PostgreSQL-Practice-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL">
  <img src="https://img.shields.io/badge/Level-Intermediate-22C55E?style=for-the-badge" alt="Intermediate">
</p>

**A structured Day 10 module focused on working with dates, timestamps, intervals, date calculations, formatting, filtering, and time-based analysis in PostgreSQL.**

</div>

---

# 📌 Day 10 Overview

Day 10 focuses on learning how to **store, calculate, extract, format, filter, and analyze date and time information** using PostgreSQL.

The module builds on the SQL concepts learned during previous days and introduces date/time techniques used in real-world data analysis, reporting, dashboards, and SQL interviews.

The module is organized around:

- 📅 `DATE` Basics
- 🕐 `CURRENT_DATE` & `CURRENT_TIMESTAMP`
- 🔎 `EXTRACT`
- ➕ DATE Arithmetic
- ⏳ `INTERVAL`
- 🧮 `AGE`
- 🗓️ `DATE_TRUNC`
- 📝 `TO_CHAR`
- 🔍 Date Filtering & Ranges
- 🔀 Date Functions with `CASE`
- 🧪 Hands-on practice
- 🎯 TCS NQT / LeetCode-style practice
- 🔥 Hard SQL practice
- 📋 Quick revision with a cheatsheet
- 💼 Interview preparation

### 🎯 Main Goal

Learn how to **work confidently with dates and timestamps and solve real-world time-based SQL analysis problems**.

---

# 🗂️ Topics Covered

| # | Topic | File | Purpose |
|---|---|---|---|
| 01 | DATE Basics | `01-DATE-Basics.sql` | Understand DATE and TIMESTAMP values |
| 02 | CURRENT DATE & TIME | `02-CURRENT-DATE-and-TIMESTAMP.sql` | Work with current date and time |
| 03 | EXTRACT | `03-EXTRACT.sql` | Extract year, month, day, quarter and other parts |
| 04 | DATE Arithmetic | `04-DATE-Arithmetic.sql` | Add, subtract and compare dates |
| 05 | INTERVAL | `05-INTERVAL.sql` | Work with time durations |
| 06 | AGE | `06-AGE.sql` | Calculate date differences |
| 07 | DATE_TRUNC | `07-DATE-TRUNC.sql` | Get the beginning of a time period |
| 08 | TO_CHAR | `08-TO-CHAR.sql` | Format dates and timestamps as text |
| 09 | Date Filtering & Ranges | `09-Date-Filtering-and-Ranges.sql` | Filter records using date conditions |
| 10 | Date Functions with CASE | `10-Date-Functions-with-CASE.sql` | Classify records using date logic |
| 11 | Practice | `Practice.sql` | Apply Day 10 concepts through hands-on problems |
| 12 | TCS NQT Practice | `TCS-NQT-Practice.sql` | Practice placement-style date/time problems |
| 13 | Hard SQL Practice | `Hard-SQL-Practice.sql` | Solve advanced date/time SQL problems |
| 14 | Cheatsheet | `Cheatsheet.txt` | Quick revision of Day 10 concepts |
| 15 | Interview Questions | `Interview-Questions.txt` | Practice date/time interview questions |
| 16 | Dataset | `Dataset.sql` | SQL tables and data used for Day 10 |

---

# 🗃️ Day 10 Dataset

Day 10 uses a fresh practical dataset containing three tables.

## `orders`

Used for:

- Order date analysis
- Timestamp analysis
- Delivery date calculations
- Date filtering
- Date formatting
- Monthly sales analysis
- Delivery status analysis

Main columns:

```text
order_id
customer_name
city
product
amount
order_date
order_timestamp
expected_delivery_date
delivery_date
order_status
