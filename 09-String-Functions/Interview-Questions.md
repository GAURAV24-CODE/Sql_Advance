DAY 9 — SQL STRING FUNCTIONS INTERVIEW QUESTIONS

1. What does UPPER() do?

UPPER() converts text to uppercase.


2. What does LOWER() do?

LOWER() converts text to lowercase.


3. What does LENGTH() return?

It returns the number of characters in a string.


4. What does LENGTH(NULL) return?

NULL.


5. What is TRIM() used for?

TRIM() removes leading and trailing whitespace.


6. Difference between TRIM() and REPLACE()?

TRIM() removes characters from the beginning
and end of a string.

REPLACE() substitutes matching text anywhere
inside the string.


7. What does SUBSTRING() do?

It extracts a specific portion of a string.


8. Are PostgreSQL string positions 0-based?

No.

PostgreSQL uses 1-based positions.


9. What does LEFT() do?

It returns the first N characters.


10. What does RIGHT() do?

It returns the last N characters.


11. What does CONCAT() do?

It combines multiple values into one string.


12. What does CONCAT_WS() do?

It combines multiple values using a separator.


13. What does REPLACE() do?

It replaces occurrences of specified text
with another value.


14. How do you remove hyphens from a phone number?

REPLACE(phone, '-', '')


15. What does POSITION() return?

The starting position of a substring.


16. What does STRPOS() return?

The starting position of a substring.


17. What happens when POSITION() cannot find text?

It returns 0.


18. What happens when STRPOS() cannot find text?

It returns 0.


19. What does SPLIT_PART() do?

It splits a string using a delimiter and
returns the requested part.


20. How do you extract the username from an email?

SPLIT_PART(email, '@', 1)


21. How do you extract the domain from an email?

SPLIT_PART(email, '@', 2)


22. Is REPLACE() case-sensitive?

Yes, in PostgreSQL.


23. Does SPLIT_PART() use 0-based indexing?

No.

Part numbering starts from 1.


24. How do you standardize a city value?

LOWER(TRIM(city))


25. How do you identify Gmail users?

LOWER(SPLIT_PART(email, '@', 2)) = 'gmail.com'


26. How do you find names containing 'a'?

POSITION('a' IN LOWER(customer_name)) > 0


27. How can string functions be used with CASE?

They can classify and validate data based
on text content.


28. How do you clean phone numbers containing
both spaces and hyphens?

REPLACE(
    REPLACE(phone, '-', ''),
    ' ',
    ''
)


29. How do you count customers by email provider?

SELECT
    LOWER(SPLIT_PART(email, '@', 2)) AS provider,
    COUNT(*) AS customer_count
FROM customers
GROUP BY LOWER(SPLIT_PART(email, '@', 2));


30. How do you classify job roles using CASE?

SELECT
    customer_name,
    CASE
        WHEN LOWER(job_role) LIKE '%data%'
            THEN 'Data'
        WHEN LOWER(job_role) LIKE '%power bi%'
            THEN 'BI'
        WHEN LOWER(job_role) LIKE '%ml%'
            THEN 'ML'
        ELSE 'Other'
    END AS role_category
FROM customers;


31. Difference between POSITION() and STRPOS()?

Both find the starting position of a substring.

POSITION():

POSITION('a' IN 'Gaurav')

STRPOS():

STRPOS('Gaurav', 'a')


32. What does POSITION('z' IN 'Gaurav') return?

0 because z does not exist.


33. What is a real-world use of SPLIT_PART()?

Extracting email usernames and domains.


34. What is a real-world use of REPLACE()?

Cleaning phone numbers and standardizing
text values.


35. Why combine LOWER() with string functions?

To make text comparisons case-insensitive
and standardize values.


36. How can LENGTH() help in data validation?

It can identify unusually short or long values.


37. Can string functions be used inside WHERE?

Yes.

Example:

WHERE LENGTH(customer_name) > 10


38. Can string functions be used inside ORDER BY?

Yes.

Example:

ORDER BY LENGTH(customer_name) DESC


39. Can string functions be used inside GROUP BY?

Yes.

Example:

GROUP BY LOWER(city)


40. Can string functions be used inside CASE?

Yes.

This is commonly used for data classification.


41. How do you find the email provider?

LOWER(SPLIT_PART(email, '@', 2))


42. How do you get the first five characters?

LEFT(customer_name, 5)


43. How do you get the last four phone digits?

RIGHT(
    REPLACE(
        REPLACE(phone, '-', ''),
        ' ',
        ''
    ),
    4
)


44. What is the difference between LEFT()
and SUBSTRING()?

LEFT() is convenient for taking characters
from the beginning.

SUBSTRING() allows a specific starting position
and length.


45. What is the difference between CONCAT()
and CONCAT_WS()?

CONCAT() combines values directly.

CONCAT_WS() combines values using a separator.


46. What happens when SPLIT_PART() receives
a part number that does not exist?

It returns an empty string.


47. Why is string cleaning important in analytics?

Inconsistent text can create incorrect
grouping, filtering, matching, and reporting.


48. Give an example of a complete cleaning pattern.

LOWER(TRIM(email))


49. Give an example of a complete email
standardization pattern.

LOWER(
    TRIM(
        SPLIT_PART(email, '@', 2)
    )
)


50. What is the most important interview idea
from Day 9?

String functions are frequently combined
with WHERE, CASE, GROUP BY, ORDER BY,
and aggregation to clean, validate,
classify, and analyze real-world data.