::: {align="center"}
# 🟣 Day 10 --- SQL Date & Time

### 📅 DATE Basics • CURRENT_DATE • CURRENT_TIMESTAMP • EXTRACT • DATE Arithmetic • INTERVAL • AGE • DATE_TRUNC • TO_CHAR • Date Filtering • CASE

```{=html}
<p>
```
`<img src="https://img.shields.io/badge/Day-10-7C3AED?style=for-the-badge" alt="Day 10">`{=html}
`<img src="https://img.shields.io/badge/SQL-Date%20%26%20Time-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="SQL Date and Time">`{=html}
`<img src="https://img.shields.io/badge/PostgreSQL-Practice-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL">`{=html}
`<img src="https://img.shields.io/badge/Level-Intermediate-22C55E?style=for-the-badge" alt="Intermediate">`{=html}
```{=html}
</p>
```
**A structured Day 10 module focused on working with dates, timestamps,
intervals, date calculations, formatting, filtering, and time-based
analysis in PostgreSQL.**
:::

------------------------------------------------------------------------

# 📌 Day 10 Overview

Day 10 focuses on learning how to **store, calculate, extract, format,
filter, and analyze date and time information** using PostgreSQL.

The module covers:

-   📅 DATE Basics
-   🕐 CURRENT_DATE & CURRENT_TIMESTAMP
-   🔎 EXTRACT
-   ➕ DATE Arithmetic
-   ⏳ INTERVAL
-   🧮 AGE
-   🗓️ DATE_TRUNC
-   📝 TO_CHAR
-   🔍 Date Filtering & Ranges
-   🔀 Date Functions with CASE
-   🧪 Hands-on practice
-   🎯 TCS NQT / LeetCode-style practice
-   🔥 Hard SQL practice
-   📋 Quick revision

### 🎯 Main Goal

Learn how to **work confidently with dates and timestamps and solve
real-world time-based SQL analysis problems**.

------------------------------------------------------------------------

# 🗂️ Topics Covered

  -------------------------------------------------------------------------------------------
  \#                Topic             File                                  Purpose
  ----------------- ----------------- ------------------------------------- -----------------
  01                DATE Basics       `01-DATE-Basics.sql`                  Understand DATE
                                                                            and TIMESTAMP
                                                                            values

  02                CURRENT DATE &    `02-CURRENT-DATE-and-TIMESTAMP.sql`   Work with current
                    TIME                                                    date and time

  03                EXTRACT           `03-EXTRACT.sql`                      Extract year,
                                                                            month, day,
                                                                            quarter and other
                                                                            parts

  04                DATE Arithmetic   `04-DATE-Arithmetic.sql`              Add, subtract and
                                                                            compare dates

  05                INTERVAL          `05-INTERVAL.sql`                     Work with time
                                                                            durations

  06                AGE               `06-AGE.sql`                          Calculate date
                                                                            differences

  07                DATE_TRUNC        `07-DATE-TRUNC.sql`                   Get the beginning
                                                                            of a time period

  08                TO_CHAR           `08-TO-CHAR.sql`                      Format dates and
                                                                            timestamps as
                                                                            text

  09                Date Filtering &  `09-Date-Filtering-and-Ranges.sql`    Filter records
                    Ranges                                                  using date
                                                                            conditions

  10                Date Functions    `10-Date-Functions-with-CASE.sql`     Classify records
                    with CASE                                               using date logic

  11                Practice          `Practice.sql`                        Day 10 hands-on
                                                                            practice

  12                TCS NQT Practice  `TCS-NQT-Practice.sql`                Placement-style
                                                                            date/time
                                                                            problems

  13                Hard SQL Practice `Hard-SQL-Practice.sql`               Advanced
                                                                            date/time
                                                                            problems

  14                Cheatsheet        `Cheatsheet.txt`                      Quick revision

  15                Interview         `Interview-Questions.txt`             Date/time
                    Questions                                               interview
                                                                            preparation

  16                Dataset           `dataset.sql`                         Day 10 tables and
                                                                            sample data
  -------------------------------------------------------------------------------------------

------------------------------------------------------------------------

# 🗃️ Dataset

Day 10 uses three practical tables:

### `orders`

Used for order dates, timestamps, delivery dates, filtering, formatting
and time-based sales analysis.

### `employees`

Used for joining dates, employee tenure and date calculations.

### `customers`

Used for birth dates, customer age and last-order recency.

------------------------------------------------------------------------

# 🔄 Day 10 Learning Flow

``` text
DAY 10
  ↓
DATE Basics
  ↓
CURRENT DATE & TIME
  ↓
EXTRACT
  ↓
DATE Arithmetic
  ↓
INTERVAL
  ↓
AGE
  ↓
DATE_TRUNC
  ↓
TO_CHAR
  ↓
Date Filtering & Ranges
  ↓
Date Functions with CASE
  ↓
Practice
  ↓
TCS NQT Practice
  ↓
Hard SQL Practice
  ↓
Cheatsheet
  ↓
DAY 10 COMPLETE
```

------------------------------------------------------------------------

# 📚 Topic Details

## 01 --- DATE Basics

Learn PostgreSQL date and timestamp data types.

**Concepts:** - `DATE` - `TIMESTAMP` - `TIMESTAMP WITH TIME ZONE` - Date
literals - Timestamp literals - DATE vs TIMESTAMP

``` text
DATE      → Date only
TIMESTAMP → Date + time
```

## 02 --- CURRENT DATE & TIME

Learn functions that return current date and time.

**Concepts:** - `CURRENT_DATE` - `CURRENT_TIME` - `CURRENT_TIMESTAMP` -
`NOW()` - `LOCALTIME` - `LOCALTIMESTAMP` - `clock_timestamp()`

## 03 --- EXTRACT

`EXTRACT` retrieves individual date/time components.

**Common components:** - YEAR - MONTH - DAY - HOUR - MINUTE - SECOND -
DOW - DOY - QUARTER - WEEK

## 04 --- DATE Arithmetic

Learn how to calculate using dates.

**Concepts:** - Add days - Subtract days - Date differences - Add
intervals - Subtract intervals - Date comparisons

## 05 --- INTERVAL

`INTERVAL` represents a duration of time.

**Common units:** - Days - Months - Years - Hours - Minutes - Seconds

## 06 --- AGE

`AGE()` calculates the difference between two dates.

**Uses:** - Employee tenure - Customer age - Completed years -
Years/months/days difference

## 07 --- DATE_TRUNC

`DATE_TRUNC()` returns the beginning of a selected period.

**Common units:** - Year - Quarter - Month - Week - Day - Hour -
Minute - Second

**Key idea:**

``` text
EXTRACT    → Get a date part
DATE_TRUNC → Get period start
```

## 08 --- TO_CHAR

`TO_CHAR()` formats date/time values as text.

**Common formats:**

``` text
YYYY  → Year
MM    → Month
DD    → Day
Mon   → Short month
Month → Full month
Day   → Weekday
HH24  → 24-hour
MI    → Minutes
SS    → Seconds
Q     → Quarter
```

**Important:** `TO_CHAR()` returns text.

## 09 --- Date Filtering & Ranges

Learn to filter records by date.

**Concepts:** - Exact dates - Before/after dates - `>=` and `<=` -
`BETWEEN` - Recent dates - Current month - Current year - Timestamp
ranges

## 10 --- Date Functions with CASE

Combine date functions with conditional logic.

**Concepts:** - Recent vs Old - Past vs Future - Today - Delivery
status - Customer recency - Employee tenure classification - Quarter
classification - Weekend / weekday

------------------------------------------------------------------------

# 🧩 Topic Practice Structure

Every topic follows the standard structure:

``` text
5 Regular Practical Examples
        ↓
3 TCS NQT / LeetCode-style Questions
        ↓
2 Hard SQL Questions
        ↓
Topic Complete
```

------------------------------------------------------------------------

# 💼 Real-World Applications

-   📊 Monthly sales reports
-   📈 Revenue analysis
-   👥 Customer recency
-   🛒 Recent orders
-   🚚 Delivery tracking
-   ⏱️ Employee tenure
-   🎂 Customer age
-   📅 Monthly and quarterly reporting
-   🔎 Date-range filtering
-   📊 BI dashboard preparation

------------------------------------------------------------------------

# 🧠 Day 10 Concept Map

``` text
DATE / TIMESTAMP
        ↓
CURRENT DATE & TIME
        ↓
EXTRACT
        ↓
DATE ARITHMETIC
        ↓
INTERVAL
        ↓
AGE
        ↓
DATE_TRUNC
        ↓
TO_CHAR
        ↓
DATE FILTERING
        ↓
CASE + DATE
```

------------------------------------------------------------------------

# 🛠️ Tools Used

-   🐘 PostgreSQL 18
-   💻 VS Code
-   🔌 SQLTools
-   🗄️ pgAdmin
-   🌿 Git
-   🐙 GitHub

------------------------------------------------------------------------

# 📈 Progress

``` text
Day 01 → SQL Fundamentals              ✅
Day 02 → Filtering Data                ✅
Day 03 → Sorting & Conditional Logic   ✅
Day 04 → Aggregation & SQL Functions  ✅
Day 05 → GROUP BY & HAVING             ✅
Day 06 → SQL JOINs                     ✅
Day 07 → Subqueries & EXISTS           ✅
Day 08 → Set Operations                ✅
Day 09 → String Functions              ✅
Day 10 → Date & Time                   ✅
```

------------------------------------------------------------------------

# ✅ Day 10 Completion Checklist

-   [x] DATE Basics
-   [x] CURRENT_DATE & CURRENT_TIMESTAMP
-   [x] EXTRACT
-   [x] DATE Arithmetic
-   [x] INTERVAL
-   [x] AGE
-   [x] DATE_TRUNC
-   [x] TO_CHAR
-   [x] Date Filtering & Ranges
-   [x] Date Functions with CASE
-   [x] Fresh Day 10 Dataset
-   [x] Topic SQL Files
-   [x] Practice SQL
-   [x] TCS NQT Practice
-   [x] Hard SQL Practice
-   [x] Cheatsheet
-   [x] Interview Questions
-   [x] README Documentation

------------------------------------------------------------------------

# 🎯 Key Takeaways

``` text
DATE
→ Store calendar dates

TIMESTAMP
→ Store date + time

EXTRACT
→ Get a date/time component

DATE Arithmetic
→ Calculate using dates

INTERVAL
→ Represent a duration

AGE
→ Calculate date differences

DATE_TRUNC
→ Get the beginning of a period

TO_CHAR
→ Format date/time as text

Date Filtering
→ Retrieve records using date conditions

CASE + Date
→ Classify records using date logic
```

------------------------------------------------------------------------

# 🚀 Next Step

## 🔵 DAY 11 --- CTEs

``` text
DAY 10 — Date & Time
        ↓
DAY 11 — CTEs
        ↓
DAY 12 — Window Functions
```

------------------------------------------------------------------------

::: {align="center"}
### 🎯 DAY 10 COMPLETE

**DATE & TIME SQL \| PostgreSQL \| SQL Interview Preparation**

⭐ Keep learning • Keep practicing • Keep building
:::
