SQL DAY 2 — FILTERING DATA
INTERVIEW QUESTIONS & ANSWERS

1. What is the use of WHERE?
   WHERE filters rows based on specified conditions.

2. What is the difference between WHERE and SELECT?
   SELECT chooses columns, while WHERE filters rows.

3. What are comparison operators in SQL?
   =, >, <, >=, <=, <>, and != are commonly used comparison operators.

4. What is the difference between = and !=?
   = checks equality, while != checks whether values are different.

5. What is AND used for?
   AND returns rows only when all conditions are TRUE.

6. What is OR used for?
   OR returns a row when at least one condition is TRUE.

7. What does NOT do?
   NOT reverses a condition.

8. Why are parentheses important with AND and OR?
   Parentheses control the evaluation order and prevent unexpected results.

9. What is IN?
   IN checks whether a value matches any value in a specified list.

10. What is NOT IN?
    NOT IN returns rows whose value does not match any value in the list.

11. What is BETWEEN?
    BETWEEN filters values within a range and includes both boundary values.

12. What is the difference between LIKE and ILIKE?
    LIKE performs pattern matching, while PostgreSQL ILIKE performs case-insensitive pattern matching.

13. What does % mean in LIKE?
    % represents zero or more characters.

14. What does _ mean in LIKE?
    _ represents exactly one character.

15. How do you find names starting with G?
    WHERE employee_name LIKE 'G%';

16. How do you find NULL values?
    Use IS NULL, not = NULL.

17. How do you find non-NULL values?
    Use IS NOT NULL.

18. Why doesn't salary = NULL work?
    NULL represents an unknown value, so SQL uses IS NULL to check for it.

19. What is COALESCE()?
    COALESCE() replaces NULL with the first available non-NULL value.

20. What is the difference between COUNT(*) and COUNT(column)?
    COUNT(*) counts all rows, while COUNT(column) ignores NULL values.

QUICK REVISION

WHERE       → Filter rows
AND         → All conditions must be TRUE
OR          → At least one condition TRUE
NOT         → Reverse condition
IN          → Match multiple values
NOT IN      → Exclude multiple values
BETWEEN     → Inclusive range
LIKE        → Pattern matching
ILIKE       → Case-insensitive matching
IS NULL     → Find missing values
IS NOT NULL → Find non-NULL values
COALESCE    → Replace NULL
