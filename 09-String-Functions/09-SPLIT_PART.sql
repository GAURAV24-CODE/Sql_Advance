-- Topic 9: SPLIT_PART()

SELECT
    SPLIT_PART('gaurav@gmail.com', '@', 1) AS username;

SELECT
    SPLIT_PART('gaurav@gmail.com', '@', 2) AS domain;

SELECT
    email,
    SPLIT_PART(email, '@', 1) AS username
FROM customers;

SELECT
    email,
    SPLIT_PART(email, '@', 2) AS domain
FROM customers;

SELECT
    city,
    SPLIT_PART(
        CONCAT(city, '-Maharashtra'),
        '-',
        1
    ) AS extracted_city
FROM customers;