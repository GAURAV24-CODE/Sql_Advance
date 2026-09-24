-- Topic 5: LEFT() and RIGHT()

SELECT
    LEFT('Gaurav Kumbhar', 6) AS first_part;

SELECT
    RIGHT('gaurav@gmail.com', 9) AS email_suffix;

SELECT
    customer_name,
    LEFT(customer_name, 5) AS name_prefix
FROM customers;

SELECT
    email,
    RIGHT(email, 10) AS domain_suffix
FROM customers;

SELECT
    phone,
    RIGHT(REPLACE(phone, '-', ''), 4) AS last_four_digits
FROM customers;