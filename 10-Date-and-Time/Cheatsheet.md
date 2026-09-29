============================================================
DAY 10 — DATE & TIME SQL CHEATSHEET
============================================================

1. DATE BASICS
============================================================

DATE
→ Stores date only in YYYY-MM-DD format.

TIMESTAMP
→ Stores date and time.

TIMESTAMP WITH TIME ZONE
→ Stores date and time with time-zone information.

DATE Literal
→ Creates an explicit DATE value.

Example:
DATE '2026-09-29'

TIMESTAMP Literal
→ Creates an explicit TIMESTAMP value.

Example:
TIMESTAMP '2026-09-29 10:30:00'

DATE vs TIMESTAMP
→ DATE = date only | TIMESTAMP = date + time.


2. CURRENT DATE & TIME
============================================================

CURRENT_DATE
→ Returns the current date.

CURRENT_TIME
→ Returns the current time.

CURRENT_TIMESTAMP
→ Returns the current date and time.

NOW()
→ Returns the current transaction timestamp.

LOCALTIME
→ Returns the current local time without time zone.

LOCALTIMESTAMP
→ Returns the current local date and time without time zone.

clock_timestamp()
→ Returns the actual current time.


3. EXTRACT
============================================================

EXTRACT
→ Extracts a specific part from a date/time value.

YEAR
→ Extracts the year.

MONTH
→ Extracts the month.

DAY
→ Extracts the day of the month.

HOUR
→ Extracts the hour.

MINUTE
→ Extracts the minute.

SECOND
→ Extracts the seconds.

DOW
→ Extracts the day of week.

DOY
→ Extracts the day of year.

QUARTER
→ Extracts the quarter number.

WEEK
→ Extracts the week number.


4. DATE ARITHMETIC
============================================================

DATE + INTEGER
→ Adds days to a date.

DATE - INTEGER
→ Subtracts days from a date.

DATE - DATE
→ Returns the number of days between dates.

DATE + INTERVAL
→ Adds a time duration to a date/time.

DATE - INTERVAL
→ Subtracts a time duration.


5. INTERVAL
============================================================

INTERVAL
→ Represents a duration of time.

DAY INTERVAL
→ Represents days.

MONTH INTERVAL
→ Represents months.

YEAR INTERVAL
→ Represents years.

HOUR INTERVAL
→ Represents hours.

MINUTE INTERVAL
→ Represents minutes.

SECOND INTERVAL
→ Represents seconds.

Combined INTERVAL
→ Represents multiple time units together.


6. AGE
============================================================

AGE()
→ Calculates the difference between two dates.

AGE(end_date, start_date)
→ Returns the difference in years, months and days.

Employee Tenure
→ Calculates how long an employee has worked.

Customer Age
→ Calculates age from birth date.

Completed Years
→ Extracts completed years from AGE().


7. DATE_TRUNC
============================================================

DATE_TRUNC()
→ Truncates date/time to the beginning of a period.

YEAR
→ Returns the beginning of the year.

QUARTER
→ Returns the beginning of the quarter.

MONTH
→ Returns the beginning of the month.

WEEK
→ Returns the beginning of the week.

DAY
→ Returns the beginning of the day.

HOUR
→ Returns the beginning of the hour.

MINUTE
→ Returns the beginning of the minute.

SECOND
→ Returns the beginning of the second.


8. TO_CHAR
============================================================

TO_CHAR()
→ Converts date/time into formatted text.

YYYY
→ Four-digit year.

YY
→ Two-digit year.

MM
→ Two-digit month.

Mon
→ Short month name.

Month
→ Full month name.

DD
→ Day of month.

Day
→ Full weekday name.

Dy
→ Short weekday name.

HH24
→ 24-hour format.

HH12
→ 12-hour format.

MI
→ Minutes.

SS
→ Seconds.

AM / PM
→ Displays AM or PM.

Q
→ Quarter number.

IW
→ ISO week number.

FM
→ Removes unnecessary padding.

Important:
→ TO_CHAR() returns TEXT.


9. DATE FILTERING & RANGES
============================================================

Date Comparison
→ Compares dates using operators.

=
→ Matches an exact date.

>
→ Finds dates after a date.

<
→ Finds dates before a date.

>=
→ Finds dates on or after a date.

<=
→ Finds dates on or before a date.

BETWEEN
→ Filters an inclusive date range.

Date Range
→ Filters records between two dates.

Recent Dates
→ Filters records from a recent time period.

Current Month
→ Filters records belonging to the current month.

Current Year
→ Filters records belonging to the current year.

Timestamp Range
→ Filters records using precise start and end timestamps.


10. DATE FUNCTIONS WITH CASE
============================================================

CASE + DATE
→ Applies conditional logic to date values.

Recent / Old
→ Classifies records based on date recency.

Past / Future
→ Classifies dates based on whether they have passed.

Today
→ Identifies records belonging to today.

Delivery Status
→ Classifies deliveries using date comparison.

Employee Tenure
→ Classifies employees using joining dates.

Customer Recency
→ Classifies customers using their last order date.

Quarter Classification
→ Classifies dates into quarters.

Weekend / Weekday
→ Classifies dates based on the day of week.

Current Month Classification
→ Identifies records belonging to the current month.


============================================================
DATE & TIME FUNCTION SUMMARY
============================================================

DATE
→ Store date.

TIMESTAMP
→ Store date + time.

CURRENT_DATE
→ Get current date.

CURRENT_TIMESTAMP
→ Get current date + time.

EXTRACT
→ Get a date/time component.

DATE ARITHMETIC
→ Calculate using dates.

INTERVAL
→ Represent a duration.

AGE
→ Calculate date difference.

DATE_TRUNC
→ Get beginning of a period.

TO_CHAR
→ Format date/time as text.

DATE FILTERING
→ Filter records by dates.

CASE + DATE
→ Classify records using date conditions.

============================================================
DAY 10 — COMPLETE
============================================================