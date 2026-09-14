# SQL — DAY 3: SORTING & CONDITIONAL LOGIC

1. ORDER BY
   Sorts query results.

   Example:

```sql
ORDER BY total_amount DESC;
```

ASC → Low to High / A to Z
DESC → High to Low / Z to A

2. ASC / DESC
   ASC → Ascending order.
   DESC → Descending order.

   Default order → ASC

3. MULTIPLE COLUMN SORTING
   Sorts using more than one column.

   Example:

```sql
ORDER BY city ASC, total_amount DESC;
```

First → city
Then → total_amount when city is the same.

4. LIMIT
   Returns only a specific number of rows.

   Example:

```sql
LIMIT 5;
```

Top 5:

```sql
ORDER BY total_amount DESC
LIMIT 5;
```

5. TOP-N ANALYSIS
   Used to find highest/lowest N records.

   Highest:

```sql
ORDER BY total_amount DESC
LIMIT 3;
```

Lowest:

```sql
ORDER BY total_amount ASC
LIMIT 3;
```

6. CASE WHEN
   Used for conditional logic and classification.

   Example:

```sql
CASE
    WHEN total_amount >= 50000 THEN 'High'
    WHEN total_amount >= 20000 THEN 'Medium'
    ELSE 'Low'
END
```

First TRUE condition is returned.

7. CONDITIONAL LOGIC
   CASE can use AND, OR and calculations.

   Example:

```sql
CASE
    WHEN total_amount >= 50000
         AND payment_status = 'Paid'
    THEN 'High Value Paid'
    ELSE 'Normal'
END
```

INTERVIEW QUICK REVISION:

ORDER BY       → Sort rows
ASC            → Ascending
DESC           → Descending
LIMIT          → Restrict number of rows
TOP-N          → Find highest/lowest N records
CASE WHEN      → Conditional logic
WHEN           → Checks condition
THEN           → Returns result
ELSE           → Default result
END            → Ends CASE
WHERE          → Filters rows
CASE           → Classifies/creates values
