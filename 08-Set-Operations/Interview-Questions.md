DAY 8 — SQL SET OPERATIONS
INTERVIEW QUESTIONS & ANSWERS

1. What is a set operation in SQL?
Set operations combine results of two or more SELECT queries.

2. What is UNION?
UNION combines result sets and removes duplicate rows.

3. What is UNION ALL?
UNION ALL combines result sets and keeps duplicate rows.

4. UNION vs UNION ALL?
UNION removes duplicates; UNION ALL keeps duplicates.

5. Which is generally faster: UNION or UNION ALL?
UNION ALL is generally faster because it does not remove duplicates.

6. What is INTERSECT?
INTERSECT returns rows that are common in both result sets.

7. What is EXCEPT?
EXCEPT returns rows from the first query that are not in the second.

8. Is EXCEPT order-sensitive?
Yes. A EXCEPT B is different from B EXCEPT A.

9. How many columns must SELECT statements have for UNION?
Both SELECT statements must return the same number of columns.

10. Can UNION combine different data types?
Corresponding columns must have compatible data types.

11. Where is ORDER BY used with UNION?
ORDER BY is normally placed at the end of the complete UNION query.

12. Can WHERE be used with UNION?
Yes. WHERE can filter each SELECT before the set operation.

13. Can JOIN be used with set operations?
Yes. JOIN can be used inside each SELECT query.

14. What happens to duplicates with INTERSECT?
Duplicate rows are removed from the INTERSECT result.

15. What happens to duplicates with EXCEPT?
The result contains distinct rows from the first query that are absent in the second.

16. How do you find customers present in both years?
Use INTERSECT between the customer lists.

17. How do you find new customers in 2026?
Use customers_2026 EXCEPT customers_2025.

18. How do you find customers lost after 2025?
Use customers_2025 EXCEPT customers_2026.

19. How do you combine online and store orders while keeping all rows?
Use UNION ALL.

20. How do you combine customers from two years without duplicates?
Use UNION.

21. Can UNION and UNION ALL combine SELECT * queries?
Yes, if both SELECT statements have compatible columns in the same order.

22. Does UNION automatically sort the result?
No. Use ORDER BY when a specific order is required.

23. Can LIMIT be used with UNION?
Yes. LIMIT can be applied to the final combined result.

24. What is the main difference between JOIN and UNION?
JOIN combines columns horizontally; UNION combines rows vertically.

25. What is a common business use of INTERSECT?
Finding retained customers who appear in multiple periods.

26. What is a common business use of EXCEPT?
Finding new or lost customers between two periods.

27. What is a common use of UNION ALL in analytics?
Combining monthly, yearly, online, or offline datasets while preserving all records.

28. What is the main rule for UNION?
Same number of columns and compatible corresponding data types.

29. Which query finds customers in 2026 but not 2025?
SELECT customer_name FROM customers_2026 EXCEPT SELECT customer_name FROM customers_2025;

30. Which query finds customers in both 2025 and 2026?
SELECT customer_name FROM customers_2025 INTERSECT SELECT customer_name FROM customers_2026;