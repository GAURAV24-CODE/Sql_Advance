-- Topic 8: POSITION() and STRPOS()

SELECT
    POSITION('a' IN 'Gaurav') AS position_of_a;

SELECT
    STRPOS('Gaurav', 'a') AS position_of_a;

SELECT
    email,
    POSITION('@' IN email) AS at_position
FROM customers;

SELECT
    email,
    STRPOS(email, '@') AS at_position
FROM customers;

SELECT
    customer_name
FROM customers
WHERE POSITION('a' IN LOWER(customer_name)) > 0;