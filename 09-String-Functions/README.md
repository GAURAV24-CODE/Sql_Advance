<div align="center">

# 🟣 Day 9 — SQL String Functions

### 🔤 UPPER • LOWER • LENGTH • TRIM • SUBSTRING • LEFT • RIGHT • CONCAT • REPLACE • POSITION • STRPOS • SPLIT_PART • CASE

<p>
  <img src="https://img.shields.io/badge/Day-09-8E44AD?style=for-the-badge" alt="Day 9">
  <img src="https://img.shields.io/badge/SQL-String%20Functions-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="SQL String Functions">
  <img src="https://img.shields.io/badge/PostgreSQL-Practice-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL">
  <img src="https://img.shields.io/badge/Level-Intermediate-22C55E?style=for-the-badge" alt="Intermediate">
</p>

**A structured Day 9 module focused on cleaning, standardizing, extracting, transforming, and analyzing text data using PostgreSQL String Functions.**

</div>

---

# 📌 Day 9 Overview

Day 9 focuses on **SQL String Functions**, which are essential for working with names, emails, phone numbers, job roles, addresses, codes, and other text-based data.

String functions are frequently used in:

- Data Cleaning
- Data Transformation
- Data Standardization
- Customer Analytics
- Reporting
- ETL Pipelines
- Data Validation
- SQL Interviews

The module builds on SQL concepts learned in previous days, including:

- `SELECT`
- `WHERE`
- `CASE`
- `LIKE`
- `GROUP BY`
- `JOIN`
- Subqueries
- Set Operations

The module introduces practical PostgreSQL string functions such as:

- 🔠 `UPPER()` / `LOWER()`
- 📏 `LENGTH()`
- 🧹 `TRIM()` / `LTRIM()` / `RTRIM()`
- ✂️ `SUBSTRING()`
- ◀️ `LEFT()` / `RIGHT()`
- 🔗 `CONCAT()` / `CONCAT_WS()`
- 🔄 `REPLACE()`
- 🔎 `POSITION()` / `STRPOS()`
- 🧩 `SPLIT_PART()`
- 🧠 String Functions with `CASE`
- 🧪 TCS NQT Practice
- 🔥 Hard SQL Practice
- 💼 Interview Questions
- 📋 Quick revision with a cheatsheet

### 🎯 Main Goal

Learn how to **clean, standardize, extract, combine, search, split, and classify text data** using practical PostgreSQL queries.

---

# 🗂️ Topics Covered

| # | Topic | File | Purpose |
|---|---|---|---|
| 01 | UPPER & LOWER | `01-UPPER-LOWER.sql` | Standardize text capitalization |
| 02 | LENGTH | `02-LENGTH.sql` | Calculate string length |
| 03 | TRIM, LTRIM & RTRIM | `03-TRIM-LTRIM-RTRIM.sql` | Remove unwanted spaces |
| 04 | SUBSTRING | `04-SUBSTRING.sql` | Extract a specific portion of text |
| 05 | LEFT & RIGHT | `05-LEFT-RIGHT.sql` | Extract characters from either side |
| 06 | CONCAT & CONCAT_WS | `06-CONCAT-CONCAT_WS.sql` | Combine multiple text values |
| 07 | REPLACE | `07-REPLACE.sql` | Replace or remove characters/text |
| 08 | POSITION & STRPOS | `08-POSITION-STRPOS.sql` | Find the position of text |
| 09 | SPLIT_PART | `09-SPLIT_PART.sql` | Extract text using delimiters |
| 10 | String Functions with CASE | `10-String-Functions-with-CASE.sql` | Combine string functions with conditional logic |
| 11 | TCS NQT Practice | `TCS-NQT-Practice.sql` | Solve 7 TCS NQT-pattern string problems |
| 12 | Hard SQL Practice | `Hard-SQL-Practice.sql` | Solve advanced multi-step string problems |
| 13 | Practice | `Practice.sql` | Apply Day 9 concepts through hands-on SQL problems |
| 14 | Cheatsheet | `Cheatsheet.md` | Quick revision |
| 15 | Interview Questions | `Interview-Questions.md` | Practice common interview-style questions |

---

# 🗄️ Dataset

Day 9 uses a fresh PostgreSQL dataset designed specifically for practicing SQL String Functions.

### Main Table

```text
customers
```

### Important Columns

```text
customer_id
customer_name
email
phone
city
job_role
```

### Example Data

```text
Gaurav Kumbhar
Priya Sharma
Rahul Patil
Sneha Joshi
Amit Verma
Neha Kulkarni
Pooja Deshmukh
Nitin Jadhav
Hema More
Vishal Pawar
```

The dataset contains realistic text variations such as:

- Leading/trailing spaces
- Different email domains
- Phone numbers containing spaces
- Phone numbers containing `-`
- Different job roles
- Multiple cities

These variations make the dataset suitable for realistic **data-cleaning and interview practice**.

---

# 🔤 01 — UPPER & LOWER

`UPPER()` converts text to uppercase.

```sql
SELECT UPPER(customer_name) AS customer_name
FROM customers;
```

`LOWER()` converts text to lowercase.

```sql
SELECT LOWER(email) AS email
FROM customers;
```

### Practical Uses

- Standardizing names
- Normalizing emails
- Case-insensitive comparisons
- Preparing data for reporting

---

# 📏 02 — LENGTH

`LENGTH()` returns the number of characters in a string.

```sql
SELECT
    customer_name,
    LENGTH(customer_name) AS name_length
FROM customers;
```

### Practical Uses

- Finding unusually long names
- Data validation
- Checking text length
- Interview string problems

---

# 🧹 03 — TRIM, LTRIM & RTRIM

`TRIM()` removes leading and trailing spaces.

```sql
SELECT TRIM(customer_name) AS clean_name
FROM customers;
```

`LTRIM()` removes spaces from the left.

```sql
SELECT LTRIM(customer_name)
FROM customers;
```

`RTRIM()` removes spaces from the right.

```sql
SELECT RTRIM(customer_name)
FROM customers;
```

### Data Cleaning Pattern

```sql
SELECT TRIM(customer_name) AS clean_name
FROM customers;
```

---

# ✂️ 04 — SUBSTRING

`SUBSTRING()` extracts part of a string.

```sql
SELECT
    SUBSTRING(customer_name FROM 1 FOR 5) AS extracted_text
FROM customers;
```

PostgreSQL string positions are **1-based**.

---

# ◀️ 05 — LEFT & RIGHT

`LEFT()` extracts characters from the beginning.

```sql
SELECT LEFT(customer_name, 3)
FROM customers;
```

`RIGHT()` extracts characters from the end.

```sql
SELECT RIGHT(customer_name, 4)
FROM customers;
```

### Practical Uses

- Codes
- Prefixes
- Suffixes
- Phone-number extraction
- Identifier processing

---

# 🔗 06 — CONCAT & CONCAT_WS

`CONCAT()` combines values.

```sql
SELECT CONCAT(customer_name, ' - ', city)
FROM customers;
```

`CONCAT_WS()` combines values using a separator.

```sql
SELECT CONCAT_WS(' | ', customer_name, city, job_role)
FROM customers;
```

### Example Output

```text
Gaurav Kumbhar | Nashik | Data Analyst
```

---

# 🔄 07 — REPLACE

`REPLACE()` replaces one piece of text with another.

```sql
SELECT
    REPLACE(phone, '-', '') AS clean_phone
FROM customers;
```

To remove both `-` and spaces:

```sql
SELECT
    REPLACE(REPLACE(phone, '-', ''), ' ', '') AS clean_phone
FROM customers;
```

This is a common **SQL data-cleaning interview pattern**.

---

# 🔎 08 — POSITION & STRPOS

`POSITION()` finds the location of text.

```sql
SELECT
    POSITION('@' IN email) AS at_position
FROM customers;
```

PostgreSQL also provides `STRPOS()`:

```sql
SELECT
    STRPOS(email, '@') AS at_position
FROM customers;
```

If the searched text is not found, PostgreSQL returns `0`.

---

# 🧩 09 — SPLIT_PART

`SPLIT_PART()` extracts a specific part of a string using a delimiter.

For an email:

```sql
SELECT
    SPLIT_PART(email, '@', 1) AS username,
    SPLIT_PART(email, '@', 2) AS domain
FROM customers;
```

Example:

```text
gaurav@gmail.com
```

Result:

```text
username → gaurav
domain   → gmail.com
```

### Another Example

```sql
SELECT
    SPLIT_PART(customer_name, ' ', 1) AS first_name
FROM customers;
```

---

# 🧠 10 — String Functions with CASE

String functions become more powerful when combined with `CASE`.

Example:

```sql
SELECT
    customer_name,
    CASE
        WHEN POSITION('@' IN email) > 0
        THEN 'VALID FORMAT'
        ELSE 'CHECK EMAIL'
    END AS email_status
FROM customers;
```

### Job Role Classification

```sql
SELECT
    customer_name,
    job_role,
    CASE
        WHEN job_role LIKE '%Data%' THEN 'DATA'
        WHEN job_role LIKE '%BI%' THEN 'BI'
        WHEN job_role LIKE '%ML%' THEN 'AI/ML'
        ELSE 'OTHER'
    END AS career_category
FROM customers;
```

---

# 🎯 5 + 3 + 2 Topic Practice Pattern

Each individual Day 9 topic file follows the standard interview-practice structure:

```text
5 Regular Practical Examples
        +
3 TCS NQT / LeetCode-Style Questions
        +
2 Hard SQL Questions
        =
10 Solved SQL Problems per Topic
```

This structure is designed to move from:

```text
Concept
  ↓
Basic Practice
  ↓
Interview Pattern
  ↓
Advanced Reasoning
```

---

# 🟢 TCS NQT Practice

The dedicated:

```text
TCS-NQT-Practice.sql
```

contains:

- Dataset inside the same file
- 7 TCS NQT-pattern questions
- Complete solutions
- String manipulation problems
- Data-cleaning problems
- Interview-oriented query writing

### Main Focus

```text
UPPER
LOWER
TRIM
LENGTH
LEFT
SPLIT_PART
REPLACE
CASE
```

---

# 🔴 Hard SQL Practice

The dedicated:

```text
Hard-SQL-Practice.sql
```

contains:

- Separate dataset inside the same file
- 6 Hard SQL questions
- Complete solutions
- Multi-step string transformations
- Data-cleaning scenarios
- Validation and classification problems

### Main Focus

```text
Nested String Functions
Email Processing
Phone Cleaning
Code Extraction
CASE + String Functions
CONCAT_WS
Multiple String Operations
```

---

# 🧪 Practice Workflow

```text
Read Concept
     ↓
Understand Syntax
     ↓
Run Regular Examples
     ↓
Modify Queries
     ↓
Solve 5+3+2 Topic Pattern
     ↓
TCS NQT Practice
     ↓
Hard SQL Practice
     ↓
Interview Questions
     ↓
Review Cheatsheet
     ↓
GitHub Upload
```

---

# 💼 Real-World SQL Patterns

## 📧 Email Cleaning

```sql
SELECT LOWER(TRIM(email)) AS clean_email
FROM customers;
```

## 🌐 Email Domain Extraction

```sql
SELECT
    SPLIT_PART(email, '@', 2) AS email_domain
FROM customers;
```

## 📱 Phone Number Cleaning

```sql
SELECT
    REPLACE(REPLACE(phone, '-', ''), ' ', '') AS clean_phone
FROM customers;
```

## 👤 First Name Extraction

```sql
SELECT
    SPLIT_PART(TRIM(customer_name), ' ', 1) AS first_name
FROM customers;
```

## 🏷️ Standardized Customer Name

```sql
SELECT
    UPPER(TRIM(customer_name)) AS standardized_name
FROM customers;
```

## 🧠 Role Classification

```sql
SELECT
    customer_name,
    CASE
        WHEN job_role LIKE '%Data%' THEN 'DATA'
        WHEN job_role LIKE '%BI%' THEN 'BI'
        WHEN job_role LIKE '%ML%' THEN 'AI/ML'
        ELSE 'OTHER'
    END AS career_category
FROM customers;
```

---

# 💼 Interview Preparation

Day 9 prepares for questions such as:

- What is `UPPER()`?
- What is the difference between `UPPER()` and `LOWER()`?
- How does `LENGTH()` work?
- What is the difference between `TRIM()` and `REPLACE()`?
- What is the difference between `LTRIM()` and `RTRIM()`?
- How does PostgreSQL `SUBSTRING()` work?
- What is the difference between `LEFT()` and `SUBSTRING()`?
- What is the difference between `CONCAT()` and `CONCAT_WS()`?
- How can you remove special characters from a phone number?
- How do you extract an email domain?
- What does `POSITION()` return if a value is not found?
- What is the difference between `POSITION()` and `STRPOS()`?
- How does `SPLIT_PART()` work?
- How can string functions be combined with `CASE`?
- How can SQL string functions be used for data cleaning?

---

# 🛠️ Tools Used

- PostgreSQL 18
- VS Code
- SQLTools
- pgAdmin
- Git
- GitHub

---

# 📈 Progress

| Day | Topic | Status |
|---|---|---|
| Day 1 | SQL Fundamentals | ✅ |
| Day 2 | Filtering Data | ✅ |
| Day 3 | Sorting & Conditional Logic | ✅ |
| Day 4 | Aggregation & SQL Functions | ✅ |
| Day 5 | GROUP BY & HAVING | ✅ |
| Day 6 | JOINs | ✅ |
| Day 7 | Subqueries & EXISTS | ✅ |
| Day 8 | Set Operations | ✅ |
| **Day 9** | **String Functions** | **✅** |

---

# 🧠 Day 9 Memory Map

```text
SQL STRING FUNCTIONS
│
├── Standardization
│   ├── UPPER()
│   └── LOWER()
│
├── Measurement
│   └── LENGTH()
│
├── Cleaning
│   ├── TRIM()
│   ├── LTRIM()
│   └── RTRIM()
│
├── Extraction
│   ├── SUBSTRING()
│   ├── LEFT()
│   ├── RIGHT()
│   └── SPLIT_PART()
│
├── Combining
│   ├── CONCAT()
│   └── CONCAT_WS()
│
├── Replacement
│   └── REPLACE()
│
├── Searching
│   ├── POSITION()
│   └── STRPOS()
│
└── Conditional Processing
    └── CASE + String Functions
```

---

# 🎯 Key Takeaways

1. `UPPER()` and `LOWER()` standardize text.
2. `LENGTH()` measures the number of characters.
3. `TRIM()` removes unwanted surrounding spaces.
4. `SUBSTRING()` extracts a specific portion of text.
5. `LEFT()` and `RIGHT()` extract characters from either side.
6. `CONCAT()` and `CONCAT_WS()` combine text values.
7. `REPLACE()` is useful for data cleaning.
8. `POSITION()` and `STRPOS()` locate text inside strings.
9. `SPLIT_PART()` is useful for delimiter-based extraction.
10. `CASE` combined with string functions supports classification and validation.
11. String functions are highly useful in SQL data-cleaning and interview problems.

---

# 🚀 Day 9 Completion Checklist

```text
[✓] Dataset Created
[✓] UPPER & LOWER
[✓] LENGTH
[✓] TRIM / LTRIM / RTRIM
[✓] SUBSTRING
[✓] LEFT / RIGHT
[✓] CONCAT / CONCAT_WS
[✓] REPLACE
[✓] POSITION / STRPOS
[✓] SPLIT_PART
[✓] String Functions with CASE
[✓] 5 + 3 + 2 Topic Practice Pattern
[✓] TCS NQT Practice
[✓] Hard SQL Practice
[✓] Cheatsheet
[✓] Interview Questions
[✓] README
```

---

# 🔜 Next Step

## Day 10 — SQL Date & Time Functions 📅

Planned concepts:

```text
DATE
TIME
TIMESTAMP
EXTRACT
DATE_PART
DATE Arithmetic
INTERVAL
AGE
DATE_TRUNC
Date Filtering
Real-World Date Patterns
```

---

## 👨‍💻 Author

**Gaurav Kumbhar**

Building practical skills in:

```text
SQL
Data Analytics
Data Science
Machine Learning
Power BI
AI/ML
```

---

⭐ **Day 9 — SQL String Functions completed successfully.**

**Learn → Practice → Solve → Document → Build → Repeat 🚀**

