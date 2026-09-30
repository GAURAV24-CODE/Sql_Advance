
## 4. `14-SQL-Data-Cleaning/README.md`

```markdown
# Day 14: SQL Data Cleaning

## 📌 Overview
SQL data cleaning is the process of identifying and correcting
inconsistent, missing, duplicated, or invalid data using SQL.

Clean data improves the reliability of analysis and reporting.

## 🎯 Learning Objectives
- Identify missing values.
- Detect and remove duplicate records.
- Standardize inconsistent data.
- Handle NULL values.
- Validate data quality.

## 📚 Topics Covered
- Identifying NULL values
- Handling missing data
- Finding duplicate records
- Removing duplicates safely
- TRIM() and string cleaning
- UPPER() and LOWER()
- CASE-based standardization
- Type conversion
- Date validation
- Data quality checks

## 💻 Example: Find Duplicate Emails

```sql
SELECT
    email,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;