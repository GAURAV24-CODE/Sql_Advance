-- DAY 9: STRING FUNCTIONS | TCS NQT PRACTICE
-- PostgreSQL | Dataset + 7 Questions + Answers

DROP TABLE IF EXISTS tcs_string_data;
CREATE TABLE tcs_string_data (
    id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(150),
    phone VARCHAR(30),
    city VARCHAR(50),
    job_role VARCHAR(100)
);

INSERT INTO tcs_string_data VALUES
(1,'  Gaurav Kumbhar  ','gaurav@gmail.com','987-654-3210','Nashik','Data Analyst'),
(2,'Priya Sharma','priya@yahoo.com','987 111 2233','Pune','Data Scientist'),
(3,' Rahul Patil ','rahul@outlook.com','982-222-3344','Mumbai','Software Developer'),
(4,'Sneha Joshi','sneha@gmail.com','981 333 4455','Nashik','Power BI Analyst'),
(5,'Amit Verma','amit@yahoo.com','980-444-5566','Delhi','Data Analyst'),
(6,'Neha Kulkarni','neha@outlook.com','979 555 6677','Pune','ML Engineer'),
(7,'Pooja Deshmukh','pooja@gmail.com','978-666-7788','Mumbai','Data Scientist'),
(8,'Nitin Jadhav','nitin@yahoo.com','977 777 8899','Delhi','BI Developer'),
(9,'Hema More','hema@gmail.com','976-888-9900','Nashik','Data Analyst'),
(10,'Vishal Pawar','vishal@outlook.com','975 999 0011','Pune','Software Developer');

-- Q1: Display names in uppercase.
SELECT UPPER(TRIM(full_name)) AS employee_name
FROM tcs_string_data;

-- Q2: Extract email username.
SELECT TRIM(full_name) AS employee_name,
       SPLIT_PART(email,'@',1) AS email_username
FROM tcs_string_data;

-- Q3: Extract email domain.
SELECT TRIM(full_name) AS employee_name,
       SPLIT_PART(email,'@',2) AS email_domain
FROM tcs_string_data;

-- Q4: Remove '-' and spaces from phone numbers.
SELECT TRIM(full_name) AS employee_name,
       REPLACE(REPLACE(phone,'-',''),' ','') AS clean_phone
FROM tcs_string_data;

-- Q5: Extract first and last names.
SELECT SPLIT_PART(TRIM(full_name),' ',1) AS first_name,
       SPLIT_PART(TRIM(full_name),' ',2) AS last_name
FROM tcs_string_data;

-- Q6: Classify job roles.
SELECT TRIM(full_name) AS employee_name,
       CASE
           WHEN job_role IN ('Data Analyst','Data Scientist') THEN 'DATA'
           WHEN job_role = 'ML Engineer' THEN 'AI/ML'
           WHEN job_role IN ('Power BI Analyst','BI Developer') THEN 'BI'
           ELSE 'SOFTWARE'
       END AS career_category
FROM tcs_string_data;

-- Q7: First 3 characters of first name + name length.
SELECT TRIM(full_name) AS employee_name,
       LEFT(SPLIT_PART(TRIM(full_name),' ',1),3) AS first_three_chars,
       LENGTH(TRIM(full_name)) AS name_length
FROM tcs_string_data;
