DAY 3 — SORTING AND CONDITIONAL LOGIC
SQL INTERVIEW QUESTIONS & ANSWERS

Topics:

1. ORDER BY
2. ASC / DESC
3. Multiple Column Sorting
4. LIMIT with ORDER BY
5. CASE WHEN
6. Conditional Logic

==================================================

1. What is ORDER BY?

ORDER BY is used to sort query results in ascending or descending order.

2. What is the default sorting order of ORDER BY?

The default sorting order is ASC (ascending).

3. What is the difference between ASC and DESC?

ASC sorts values from low to high or A to Z.
DESC sorts values from high to low or Z to A.

4. Can we sort data using multiple columns?

Yes. SQL can sort using multiple columns.

Example:
ORDER BY city ASC, total_amount DESC;

5. How does multiple-column sorting work?

SQL first sorts by the first column. If values are equal, it uses the second column to break the tie.

6. What is LIMIT?

LIMIT restricts the number of rows returned by a query.

7. How do you find the top 5 highest-value orders?

SELECT *
FROM sales_orders
ORDER BY total_amount DESC
LIMIT 5;

8. Why should ORDER BY be used with LIMIT for Top-N problems?

LIMIT only restricts the number of rows. ORDER BY determines which rows are considered highest or lowest.

9. How do you find the 3 lowest-value orders?

SELECT *
FROM sales_orders
ORDER BY total_amount ASC
LIMIT 3;

10. How do you find the latest 5 orders?

SELECT *
FROM sales_orders
ORDER BY order_date DESC
LIMIT 5;

11. What is CASE WHEN?

CASE WHEN is SQL's conditional logic. It works similarly to IF/ELSE logic in programming.

12. What is the basic syntax of CASE WHEN?

CASE
WHEN condition THEN result
ELSE result
END

13. Can CASE WHEN create a new column?

Yes. We can use an alias with AS.

Example:

CASE
WHEN total_amount >= 50000 THEN 'High'
ELSE 'Low'
END AS sales_level

14. Can CASE WHEN have multiple WHEN conditions?

Yes. Multiple WHEN conditions can be used. SQL checks them from top to bottom and returns the result of the first true condition.

15. Why is the order of WHEN conditions important?

Because SQL stops at the first condition that is true. Therefore, conditions should be arranged carefully, usually from the most specific/highest threshold to the broader conditions.

16. What is the difference between WHERE and CASE WHEN?

WHERE filters rows from the result.
CASE WHEN creates conditional values or classifications.

17. Can CASE WHEN use AND and OR?

Yes. CASE WHEN can contain complex conditions using AND, OR, IN, BETWEEN, and other operators.

18. Can CASE WHEN perform calculations?

Yes. CASE WHEN can return calculated values.

Example:

CASE
WHEN total_amount >= 50000
THEN total_amount * 0.10
ELSE 0
END

19. Can CASE WHEN be used with ORDER BY?

Yes. CASE can be used in ORDER BY to create custom business sorting.

Example:

ORDER BY
CASE
WHEN payment_status = 'Pending' THEN 1
ELSE 2
END;

20. Can CASE WHEN be used inside aggregate functions?

Yes. This is called conditional aggregation.

Example:

SELECT
SUM(
CASE
WHEN payment_status = 'Paid'
THEN total_amount
ELSE 0
END
) AS paid_revenue
FROM sales_orders;

==================================================
IMPORTANT INTERVIEW PATTERNS
============================

Pattern 1 — Top N

ORDER BY total_amount DESC
LIMIT N;

Pattern 2 — Bottom N

ORDER BY total_amount ASC
LIMIT N;

Pattern 3 — Multiple Column Sorting

ORDER BY city ASC, total_amount DESC;

Pattern 4 — Business Classification

CASE
WHEN total_amount >= 50000 THEN 'High'
WHEN total_amount >= 20000 THEN 'Medium'
ELSE 'Low'
END;

Pattern 5 — Conditional Calculation

SUM(
CASE
WHEN payment_status = 'Paid'
THEN total_amount
ELSE 0
END
);

==================================================
KEY INTERVIEW POINTS
====================

• ORDER BY sorts query results.
• ASC means ascending.
• DESC means descending.
• ASC is the default order.
•
giev 