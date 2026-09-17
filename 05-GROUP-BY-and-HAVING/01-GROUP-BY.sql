-- Day 5 - Topic 1: GROUP BY

-- 1. Total sales amount by category
SELECT
    category,
    SUM(amount) AS total_sales
FROM sales
GROUP BY category;

-- 2. Number of sales transactions by category
SELECT
    category,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY category;

-- 3. Average sales amount by category
SELECT
    category,
    AVG(amount) AS average_sales
FROM sales
GROUP BY category;

-- 4. Minimum sale amount by category
SELECT
    category,
    MIN(amount) AS minimum_sale
FROM sales
GROUP BY category;

-- 5. Maximum sale amount by category
SELECT
    category,
    MAX(amount) AS maximum_sale
FROM sales
GROUP BY category;

-- 6. Total quantity sold by category
SELECT
    category,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY category;

-- 7. Total sales amount by city
SELECT
    city,
    SUM(amount) AS total_sales
FROM sales
GROUP BY city;

-- 8. Number of sales transactions by city
SELECT
    city,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY city;

-- 9. Average quantity sold by city
SELECT
    city,
    AVG(quantity) AS average_quantity
FROM sales
GROUP BY city;

-- 10. Total sales amount by payment method
SELECT
    payment_method,
    SUM(amount) AS total_sales
FROM sales
GROUP BY payment_method;

-- 11. Number of transactions by payment method
SELECT
    payment_method,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY payment_method;

-- 12. Total completed sales by city
SELECT
    city,
    SUM(amount) AS completed_sales
FROM sales
WHERE sales_status = 'Completed'
GROUP BY city;

-- 13. Number of completed transactions by category
SELECT
    category,
    COUNT(*) AS completed_transactions
FROM sales
WHERE sales_status = 'Completed'
GROUP BY category;

-- 14. Average completed sale amount by category
SELECT
    category,
    AVG(amount) AS average_completed_sale
FROM sales
WHERE sales_status = 'Completed'
GROUP BY category;

-- 15. Total quantity sold by product
SELECT
    product,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY product;


-- TCS NQT / LeetCode Practice

-- Q1. Find categories with total sales greater than 100000
SELECT
    category,
    SUM(amount) AS total_sales
FROM sales
GROUP BY category
HAVING SUM(amount) > 100000;

-- Q2. Find cities having more than 3 sales transactions
SELECT
    city,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY city
HAVING COUNT(*) > 3;

-- Q3. Find categories where the average sale amount is greater than 30000
SELECT
    category,
    AVG(amount) AS average_sales
FROM sales
GROUP BY category
HAVING AVG(amount) > 30000;


-- Q4. Find the city with the highest total completed sales
SELECT
    city,
    SUM(amount) AS completed_sales
FROM sales
WHERE sales_status = 'Completed'
GROUP BY city
ORDER BY completed_sales DESC
LIMIT 1;

-- Q5. Find the category with the highest average completed sale amount
SELECT
    category,
    AVG(amount) AS average_completed_sale
FROM sales
WHERE sales_status = 'Completed'
GROUP BY category
ORDER BY average_completed_sale DESC
LIMIT 1;