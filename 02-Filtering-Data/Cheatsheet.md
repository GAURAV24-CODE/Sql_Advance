SQL — DAY 2: FILTERING DATA

1. WHERE
   Filters rows based on a condition.
   Example:
   WHERE salary > 60000;

2. COMPARISON OPERATORS
   =   Equal

> Greater than
> <   Less than
> =  Greater than or equal
> <=  Less than or equal
> <>  Not equal
> !=  Not equal

3. AND / OR / NOT
   AND → All conditions must be TRUE.
   OR  → At least one condition must be TRUE.
   NOT → Reverses the condition.

4. IN / NOT IN
   IN → Matches multiple values.
   Example:
   WHERE department IN ('IT', 'Finance');

NOT IN → Excludes multiple values.

5. BETWEEN
   Filters a range.
   Example:
   WHERE salary BETWEEN 50000 AND 70000;

BETWEEN is inclusive.

6. LIKE / ILIKE
   LIKE → Pattern matching.
   ILIKE → Case-insensitive pattern matching.

% → Zero or more characters.
_ → Exactly one character.

Example:
WHERE employee_name LIKE 'G%';

7. NULL FILTERING
   IS NULL → Finds missing values.
   IS NOT NULL → Finds available values.

Do NOT use:
salary = NULL

Use:
salary IS NULL

8. COALESCE
   Replaces NULL with another value.

Example:
COALESCE(salary, 0)

INTERVIEW QUICK REVISION:

WHERE       → Filter rows
AND         → All conditions
OR          → Any condition
NOT         → Reverse condition
IN          → Multiple values
BETWEEN     → Range
LIKE        → Pattern matching
ILIKE       → Case-insensitive matching
IS NULL     → Missing value
IS NOT NULL → Non-missing value
COALESCE    → Replace NULL
