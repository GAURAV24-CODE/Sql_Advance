-- Topic 1: UPPER() and LOWER()

SELECT
    customer_name,
    UPPER(customer_name) AS upper_name
FROM customers;

SELECT
    customer_name,
    LOWER(customer_name) AS lower_name
FROM customers;

SELECT
    email,
    UPPER(email) AS standardized_email
FROM customers;

SELECT
    city,
    LOWER(city) AS standardized_city
FROM customers;

SELECT
    customer_name
FROM customers
WHERE LOWER(city) = 'nashik';