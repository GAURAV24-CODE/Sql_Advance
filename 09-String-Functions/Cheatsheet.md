DAY 9 — SQL STRING FUNCTIONS CHEATSHEET

UPPER(text)
→ Converts text to uppercase.

LOWER(text)
→ Converts text to lowercase.


LENGTH(text)
→ Returns the number of characters.

LENGTH(NULL)
→ Returns NULL.


TRIM(text)
→ Removes leading and trailing spaces.

LTRIM(text)
→ Removes spaces from the left.

RTRIM(text)
→ Removes spaces from the right.


SUBSTRING(text FROM start FOR count)
→ Extracts part of a string.

PostgreSQL positions are 1-based.


LEFT(text, n)
→ Returns first n characters.

RIGHT(text, n)
→ Returns last n characters.


CONCAT(value1, value2, ...)
→ Combines multiple values.

CONCAT_WS(separator, value1, value2, ...)
→ Combines values using a separator.


REPLACE(text, old_text, new_text)
→ Replaces matching text.

REPLACE(text, old_text, '')
→ Removes matching text.


POSITION(substring IN text)
→ Returns starting position.

STRPOS(text, substring)
→ Returns starting position.

If substring is not found:
→ Returns 0.


SPLIT_PART(text, delimiter, part_number)
→ Splits text using a delimiter.

Part numbering starts from 1.


IMPORTANT PATTERNS

Extract email username:

SPLIT_PART(email, '@', 1)


Extract email domain:

SPLIT_PART(email, '@', 2)


Clean phone number:

REPLACE(
    REPLACE(phone, '-', ''),
    ' ',
    ''
)


Find text:

POSITION(
    'data' IN LOWER(job_role)
) > 0


Standardize text:

LOWER(TRIM(column_name))


Classify text:

CASE
    WHEN condition THEN result
    ELSE result
END


INTERVIEW REMINDERS

1. String functions normally return a new value.

2. They do not permanently change stored data
   unless used with UPDATE.

3. PostgreSQL string positions are 1-based.

4. POSITION() returns 0 when text is not found.

5. STRPOS() returns 0 when text is not found.

6. SPLIT_PART() uses 1-based part numbers.

7. REPLACE() is case-sensitive.

8. TRIM() removes leading/trailing whitespace.

9. TRIM() does not remove spaces between words.

10. SPLIT_PART() is very useful for email
    username/domain extraction.