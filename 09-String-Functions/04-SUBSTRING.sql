-- Topic 4: SUBSTRING()

SELECT
    SUBSTRING('Gaurav Kumbhar' FROM 1 FOR 6) AS first_name;

SELECT
    SUBSTRING('Data Analyst' FROM 6) AS role_name;

SELECT
    customer_name,
    SUBSTRING(customer_name FROM 1 FOR 6) AS name_prefix
FROM customers;

SELECT
    email,
    SUBSTRING(email FROM 1 FOR 6) AS email_prefix
FROM customers;

SELECT
    job_role,
    SUBSTRING(job_role FROM 1 FOR 4) AS role_code
FROM customers;