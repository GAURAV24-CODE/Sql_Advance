-- HAVING
-- Example 1: Categories with total sales above 100000
SELECT
    category,
    SUM(amount) AS total_sales
FROM sales
GROUP BY category
HAVING SUM(amount) > 100000;

-- Example 2: Cities with more than 3 transactions
SELECT
    city,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY city
HAVING COUNT(*) > 3;

-- Example 3: Categories with average sale above 30000
SELECT
    category,
    AVG(amount) AS average_sale
FROM sales
GROUP BY category
HAVING AVG(amount) > 30000;

-- Example 4: Categories with minimum sale above 5000
SELECT
    category,
    MIN(amount) AS minimum_sale
FROM sales
GROUP BY category
HAVING MIN(amount) > 5000;

-- Example 5: Cities with maximum sale above 50000
SELECT
    city,
    MAX(amount) AS highest_sale
FROM sales
GROUP BY city
HAVING MAX(amount) > 50000;

-- Example 6: Categories with sales above 50000 and at least 3 transactions
SELECT
    category,
    SUM(amount) AS total_sales,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY category
HAVING SUM(amount) > 50000
   AND COUNT(*) >= 3;

-- Example 7: City-category groups with sales above 50000
SELECT
    city,
    category,
    SUM(amount) AS total_sales
FROM sales
GROUP BY city, category
HAVING SUM(amount) > 50000;

-- Example 8: Completed sales above 50000 by city
SELECT
    city,
    SUM(amount) AS completed_sales
FROM sales
WHERE sales_status = 'Completed'
GROUP BY city
HAVING SUM(amount) > 50000;

-- Example 9: Cities with more than 2 unique customers
SELECT
    city,
    COUNT(DISTINCT customer_name) AS unique_customers
FROM sales
GROUP BY city
HAVING COUNT(DISTINCT customer_name) > 2;

-- Example 10: Completed sales above 100000 by city
SELECT
    city,
    SUM(amount) AS completed_sales
FROM sales
WHERE sales_status = 'Completed'
GROUP BY city
HAVING SUM(amount) > 100000
ORDER BY completed_sales DESC;


-- TCS NQT / LeetCode-style Practice

-- Q1: Find categories with total sales greater than 80000
-- Solution
SELECT
    category,
    SUM(amount) AS total_sales
FROM sales
GROUP BY category
HAVING SUM(amount) > 80000;

-- Q2: Find cities having at least 4 transactions
-- Solution
SELECT
    city,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY city
HAVING COUNT(*) >= 4;

-- Q3: Find city-category groups with total sales greater than 60000
-- Solution
SELECT
    city,
    category,
    SUM(amount) AS total_sales
FROM sales
GROUP BY city, category
HAVING SUM(amount) > 60000;


-- Hard SQL Questions

-- Q4: Find cities where completed sales exceed 90000
-- Solution
SELECT
    city,
    SUM(amount) AS completed_sales
FROM sales
WHERE sales_status = 'Completed'
GROUP BY city
HAVING SUM(amount) > 90000
ORDER BY completed_sales DESC;

-- Q5: Find categories having at least 3 completed transactions
-- and an average completed sale greater than 30000
-- Solution
SELECT
    category,
    COUNT(*) AS completed_transactions,
    AVG(amount) AS average_completed_sale
FROM sales
WHERE sales_status = 'Completed'
GROUP BY category
HAVING COUNT(*) >= 3
   AND AVG(amount) > 30000;