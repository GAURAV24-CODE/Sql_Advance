-- DAY 9: STRING FUNCTIONS | HARD SQL PRACTICE
-- PostgreSQL | Dataset + 6 Hard Questions + Answers

DROP TABLE IF EXISTS hard_customer_data;
CREATE TABLE hard_customer_data (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(150),
    phone VARCHAR(30),
    city VARCHAR(50),
    job_role VARCHAR(100),
    employee_code VARCHAR(50)
);

INSERT INTO hard_customer_data VALUES
(1,'  Gaurav Kumbhar  ','GAURAV.K@GMAIL.COM','987-654-3210','Nashik','Data Analyst','EMP-NAS-001'),
(2,'Priya Sharma','priya.s@YAHOO.COM','987 111 2233','Pune','Data Scientist','EMP-PUN-002'),
(3,'  Rahul Patil','rahul.p@OUTLOOK.COM','982-222-3344','Mumbai','Software Developer','EMP-MUM-003'),
(4,'Sneha Joshi  ','sneha.j@GMAIL.COM','981 333 4455','Nashik','Power BI Analyst','EMP-NAS-004'),
(5,'Amit Verma','amit.v@YAHOO.COM','980-444-5566','Delhi','Data Analyst','EMP-DEL-005'),
(6,'Neha Kulkarni','neha.k@OUTLOOK.COM','979 555 6677','Pune','ML Engineer','EMP-PUN-006'),
(7,'Pooja Deshmukh','pooja.d@GMAIL.COM','978-666-7788','Mumbai','Data Scientist','EMP-MUM-007'),
(8,'Nitin Jadhav','nitin.j@YAHOO.COM','977 777 8899','Delhi','BI Developer','EMP-DEL-008'),
(9,'Hema More','hema.m@GMAIL.COM','976-888-9900','Nashik','Data Analyst','EMP-NAS-009'),
(10,'Vishal Pawar','vishal.p@OUTLOOK.COM','975 999 0011','Pune','Software Developer','EMP-PUN-010');

-- Q1: Standardize names and emails.
SELECT TRIM(full_name) AS clean_name,
       LOWER(email) AS clean_email
FROM hard_customer_data;

-- Q2: Create CITY-employee_number.
SELECT UPPER(LEFT(city,3)) || '-' ||
       SPLIT_PART(employee_code,'-',3) AS professional_id
FROM hard_customer_data;

-- Q3: Create username@DOMAIN with uppercase domain.
SELECT SPLIT_PART(LOWER(email),'@',1) || '@' ||
       UPPER(SPLIT_PART(LOWER(email),'@',2)) AS standardized_email
FROM hard_customer_data;

-- Q4: Clean phone and classify as VALID/INVALID.
SELECT TRIM(full_name) AS employee_name,
       REPLACE(REPLACE(phone,'-',''),' ','') AS clean_phone,
       CASE
           WHEN LENGTH(REPLACE(REPLACE(phone,'-',''),' ','')) = 10
           THEN 'VALID'
           ELSE 'INVALID'
       END AS phone_status
FROM hard_customer_data;

-- Q5: Compare employee city code with actual city prefix.
SELECT TRIM(full_name) AS employee_name,
       UPPER(LEFT(city,3)) AS expected_city_code,
       UPPER(SPLIT_PART(employee_code,'-',2)) AS actual_city_code,
       CASE
           WHEN UPPER(LEFT(city,3)) =
                UPPER(SPLIT_PART(employee_code,'-',2))
           THEN 'MATCH'
           ELSE 'MISMATCH'
       END AS code_status
FROM hard_customer_data;

-- Q6: Build NAME | ROLE | CITY | EMAIL-DOMAIN profile.
SELECT CONCAT_WS(
           ' | ',
           UPPER(TRIM(full_name)),
           job_role,
           city,
           LOWER(SPLIT_PART(email,'@',2))
       ) AS employee_profile
FROM hard_customer_data;
