SQL DAY 4 — AGGREGATION & SQL FUNCTIONS
========================================

1. COUNT()
----------------------------------------
Counts rows or non-NULL values.

COUNT(*)
COUNT(column)

COUNT(*)       -> Counts all rows
COUNT(column)  -> Counts only non-NULL values

Example:
SELECT COUNT(*) FROM transactions;

SELECT COUNT(transaction_id)
FROM transactions;


2. SUM()
----------------------------------------
Calculates the total of a numeric column.

Example:
SELECT SUM(amount)
FROM transactions;

Conditional SUM:

SELECT SUM(
    CASE
        WHEN transaction_status = 'Completed'
        THEN amount
        ELSE 0
    END
)
FROM transactions;

Business Question:
What is the total revenue?


3. AVG()
----------------------------------------
Calculates the average value.

Example:
SELECT AVG(amount)
FROM transactions;

Rounded average:

SELECT ROUND(AVG(amount), 2)
FROM transactions;

IMPORTANT:
AVG() ignores NULL values.


4. MIN() AND MAX()
----------------------------------------
MIN() -> Finds the smallest value
MAX() -> Finds the largest value

Example:

SELECT MIN(amount)
FROM transactions;

SELECT MAX(amount)
FROM transactions;

Together:

SELECT
    MIN(amount) AS minimum_amount,
    MAX(amount) AS maximum_amount
FROM transactions;


5. COUNT(DISTINCT)
----------------------------------------
Counts unique non-NULL values.

Example:

SELECT COUNT(DISTINCT customer_name)
FROM transactions;

Other examples:

SELECT COUNT(DISTINCT city)
FROM transactions;

SELECT COUNT(DISTINCT product)
FROM transactions;

Business Question:
How many unique customers do we have?


6. CONDITIONAL AGGREGATION
----------------------------------------
Combines aggregate functions with CASE WHEN.

Count condition:

SUM(
    CASE
        WHEN condition THEN 1
        ELSE 0
    END
)

Example:

SELECT
    SUM(
        CASE
            WHEN transaction_status = 'Completed'
            THEN 1
            ELSE 0
        END
    ) AS completed_transactions
FROM transactions;

Conditional revenue:

SELECT
    SUM(
        CASE
            WHEN transaction_status = 'Completed'
            THEN amount
            ELSE 0
        END
    ) AS completed_revenue
FROM transactions;

VERY IMPORTANT:
Common Data Analyst interview pattern.


7. COALESCE()
----------------------------------------
Returns the first non-NULL value.

Syntax:

COALESCE(value1, value2, value3)

Example:

SELECT COALESCE(amount, 0)
FROM transactions;

If amount = 5000
Result -> 5000

If amount = NULL
Result -> 0

Common pattern:

COALESCE(SUM(amount), 0)

Purpose:
Replace NULL with a fallback value.


8. NULLIF()
----------------------------------------
Returns NULL when two values are equal.

Syntax:

NULLIF(value1, value2)

Example:

SELECT NULLIF(100, 100);

Result:
NULL

Example:

SELECT NULLIF(100, 200);

Result:
100

IMPORTANT USE:
Prevent division by zero.

Example:

SELECT
    SUM(amount) / NULLIF(COUNT(*), 0)
FROM transactions;


========================================
MOST IMPORTANT SQL PATTERNS
========================================

1. TOTAL REVENUE

SELECT SUM(amount)
FROM transactions;


2. NUMBER OF TRANSACTIONS

SELECT COUNT(*)
FROM transactions;


3. AVERAGE TRANSACTION VALUE

SELECT AVG(amount)
FROM transactions;


4. HIGHEST TRANSACTION

SELECT MAX(amount)
FROM transactions;


5. LOWEST TRANSACTION

SELECT MIN(amount)
FROM transactions;


6. UNIQUE CUSTOMERS

SELECT COUNT(DISTINCT customer_name)
FROM transactions;


7. COMPLETED REVENUE

SELECT SUM(
    CASE
        WHEN transaction_status = 'Completed'
        THEN amount
        ELSE 0
    END
)
FROM transactions;


8. COMPLETED TRANSACTION COUNT

SELECT SUM(
    CASE
        WHEN transaction_status = 'Completed'
        THEN 1
        ELSE 0
    END
)
FROM transactions;


9. REPLACE NULL

COALESCE(amount, 0)


10. SAFE DIVISION

numerator / NULLIF(denominator, 0)


========================================
QUICK MEMORY TRICK
========================================

COUNT()
-> HOW MANY?

SUM()
-> TOTAL HOW MUCH?

AVG()
-> AVERAGE?

MIN()
-> LOWEST?

MAX()
-> HIGHEST?

COUNT(DISTINCT)
-> HOW MANY UNIQUE?

CASE + AGGREGATE
-> CONDITION-WISE RESULT

COALESCE()
-> REPLACE NULL

NULLIF()
-> RETURN NULL IF EQUAL


========================================
INTERVIEW QUICK REVISION
========================================

Q1. What is COUNT(*)?

COUNT(*) counts all rows.

Q2. What is COUNT(column)?

COUNT(column) counts only non-NULL values.

Q3. Does SUM() include NULL values?

No.
SUM() ignores NULL values.

Q4. Does AVG() include NULL values?

No.
AVG() ignores NULL values.

Q5. How do you count unique customers?

COUNT(DISTINCT customer_name)

Q6. What is conditional aggregation?

Using aggregate functions with conditions,
commonly using CASE WHEN.

Q7. Why use COALESCE()?

To replace NULL with a fallback value.

Q8. Why use NULLIF()?

A common use is preventing division-by-zero
errors.


========================================
DATA ANALYST QUERY THINKING
========================================

Business Question
       |
       v
Identify Condition
       |
       v
Choose Aggregate Function
       |
       v
Calculate Metric
       |
       v
Business Insight


HOW MANY?
-> COUNT()

TOTAL?
-> SUM()

AVERAGE?
-> AVG()

HIGHEST / LOWEST?
-> MAX() / MIN()

UNIQUE?
-> COUNT(DISTINCT)

CONDITION-WISE METRIC?
-> CASE WHEN + AGGREGATE

MISSING VALUE?
-> COALESCE()

DIVISION BY ZERO?
-> NULLIF()


========================================
CORE ANALYTICAL PATTERN
========================================

Business Question
       |
       v
Condition
       |
       v
CASE WHEN
       |
       v
Aggregate Function
       |
       v
Business Metric


Example:

SELECT
    SUM(
        CASE
            WHEN transaction_status = 'Completed'
            THEN amount
            ELSE 0
        END
    ) AS completed_revenue
FROM transactions;


Business Question
        ->
Condition
        ->
Calculation
        ->
Business Metric