-- Topic 6: CONCAT() and CONCAT_WS()

SELECT
    CONCAT('Gaurav', ' ', 'Kumbhar') AS full_name;

SELECT
    CONCAT('Data', ' ', 'Analyst') AS job_title;

SELECT
    CONCAT_WS(' - ', 'Gaurav', 'Data Analyst', 'Nashik') AS profile;

SELECT
    customer_name,
    CONCAT(customer_name, ' | ', job_role) AS customer_profile
FROM customers;

SELECT
    customer_name,
    CONCAT_WS(', ', customer_name, city, job_role) AS profile_summary
FROM customers;