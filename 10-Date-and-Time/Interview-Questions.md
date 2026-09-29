
============================================================
19. INTERVIEW QUICK QUESTIONS
============================================================

Q: What is DATE?
A: A PostgreSQL data type for storing a calendar date.

Q: What is TIMESTAMP?
A: A data type for storing date and time.

Q: What does CURRENT_DATE return?
A: The current date.

Q: What does NOW() return?
A: The current transaction timestamp.

Q: What does EXTRACT do?
A: Extracts a specific component from date/time.

Q: What does DATE_TRUNC do?
A: Truncates a date/time to the beginning of a period.

Q: What does AGE() do?
A: Calculates the difference between dates in years/months/days.

Q: What is INTERVAL?
A: A duration of time.

Q: What does TO_CHAR() do?
A: Formats a date/time value as text.

Q: Does TO_CHAR return a date?
A: No, it returns text.

Q: What does DATE - DATE return?
A: The number of days between the dates.

Q: Is BETWEEN inclusive?
A: Yes, both boundaries are included.

Q: What is DOW?
A: Day of week, where Sunday is 0 in PostgreSQL.

Q: What is DOY?
A: Day of year.

Q: What is QUARTER?
A: The quarter number from 1 to 4.

Q: Why use DATE_TRUNC for monthly reports?
A: It gives a consistent month-level grouping value.

Q: EXTRACT vs DATE_TRUNC?
A: EXTRACT gets a component; DATE_TRUNC gets the beginning of a period.
