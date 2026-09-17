-- Multiple GROUP BY

-- Example 1: Total sales by city and category
SELECT
    city,
    category,
    SUM(amount) AS total_sales
FROM sales
GROUP BY city, category;

-- Example 2: Transactions by city and category
SELECT
    city,
    category,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY city, category;

-- Example 3: Average sale by city and category
SELECT
    city,
    category,
    AVG(amount) AS average_sale
FROM sales
GROUP BY city, category;

-- Example 4: Total quantity by city and category
SELECT
    city,
    category,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY city, category;

-- Example 5: Sales by category and payment method
SELECT
    category,
    payment_method,
    SUM(amount) AS total_sales
FROM sales
GROUP BY category, payment_method;

-- Example 6: Transactions by payment method and status
SELECT
    payment_method,
    sales_status,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY payment_method, sales_status;

-- Example 7: Average sale by payment method and status
SELECT
    payment_method,
    sales_status,
    AVG(amount) AS average_sale
FROM sales
GROUP BY payment_method, sales_status;

-- Example 8: Total sales by city and status
SELECT
    city,
    sales_status,
    SUM(amount) AS total_sales
FROM sales
GROUP BY city, sales_status;

-- Example 9: Completed sales by city and category
SELECT
    city,
    category,
    SUM(amount) AS completed_sales
FROM sales
WHERE sales_status = 'Completed'
GROUP BY city, category;

-- Example 10: City-category groups with more than 1 transaction
SELECT
    city,
    category,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY city, category
HAVING COUNT(*) > 1;


-- TCS NQT / LeetCode-style Practice

-- Q1: Find categories with total sales greater than 100000
-- Solution
SELECT
    category,
    SUM(amount) AS total_sales
FROM sales
GROUP BY category
HAVING SUM(amount) > 100000;

-- Q2: Find cities having more than 3 sales transactions
-- Solution
SELECT
    city,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY city
HAVING COUNT(*) > 3;

-- Q3: Find city-category combinations with average sale greater than 30000
-- Solution
SELECT
    city,
    category,
    AVG(amount) AS average_sale
FROM sales
GROUP BY city, category
HAVING AVG(amount) > 30000;


-- Hard SQL Questions

-- Q4: Find the city with the highest total completed sales
-- Solution
SELECT
    city,
    SUM(amount) AS completed_sales
FROM sales
WHERE sales_status = 'Completed'
GROUP BY city
ORDER BY completed_sales DESC
LIMIT 1;
-- Q5: Find the category with the highest average completed sale
-- Solution
SELECT
    category,
    AVG(amount) AS average_completed_sale
FROM sales
WHERE sales_status = 'Completed'
GROUP BY category
ORDER BY average_completed_sale DESC
LIMIT 1;