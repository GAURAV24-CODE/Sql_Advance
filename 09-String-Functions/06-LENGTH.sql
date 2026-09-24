-- Topic 2: LENGTH()

SELECT
    customer_name,
    LENGTH(customer_name) AS name_length
FROM customers;

SELECT
    customer_name
FROM customers
WHERE LENGTH(customer_name) > 12;

SELECT
    customer_name
FROM customers
ORDER BY LENGTH(customer_name) DESC;

SELECT
    email,
    LENGTH(email) AS email_length
FROM customers;

SELECT LENGTH(NULL) AS null_length;