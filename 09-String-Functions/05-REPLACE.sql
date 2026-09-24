-- Topic 7: REPLACE()

SELECT
    REPLACE('Gaurav-Kumbhar', '-', ' ') AS updated_name;

SELECT
    REPLACE('987-654-3210', '-', '') AS clean_phone;

SELECT
    phone,
    REPLACE(
        REPLACE(phone, '-', ''),
        ' ',
        ''
    ) AS clean_phone
FROM customers;

SELECT
    city,
    REPLACE(city, 'Mumbai', 'Bombay') AS updated_city
FROM customers;

SELECT
    email,
    REPLACE(
        email,
        '@yahoo.com',
        '@gmail.com'
    ) AS updated_email
FROM customers;