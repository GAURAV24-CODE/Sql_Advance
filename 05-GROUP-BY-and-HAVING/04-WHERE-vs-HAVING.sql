-- WHERE vs HAVING

-- Example 1: Filter rows using WHERE
SELECT *
FROM sales
WHERE sales_status = 'Completed';

-- Example 2: Filter rows before grouping
SELECT
    category,
    SUM(amount) AS total_sales
FROM sales
WHERE sales_status = 'Completed'
GROUP BY category;

-- Example 3: Filter groups using HAVING
SELECT
    category,
    SUM(amount) AS total_sales
FROM sales
GROUP BY category
HAVING SUM(amount) > 100000;

-- Example 4: WHERE with COUNT and GROUP BY
SELECT
    city,
    COUNT(*) AS completed_transactions
FROM sales
WHERE sales_status = 'Completed'
GROUP BY city;

-- Example 5: HAVING with COUNT
SELECT
    city,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY city
HAVING COUNT(*) >= 4;

-- Example 6: WHERE + GROUP BY + HAVING
SELECT
    city,
    SUM(amount) AS completed_sales
FROM sales
WHERE sales_status = 'Completed'
GROUP BY city
HAVING SUM(amount) > 50000;

-- Example 7: Multiple GROUP BY with WHERE and HAVING
SELECT
    city,
    category,
    SUM(amount) AS total_sales
FROM sales
WHERE sales_status = 'Completed'
GROUP BY city, category
HAVING SUM(amount) > 50000;


-- TCS NQT / LeetCode-style Practice

-- Q1: Find categories with more than 2 completed transactions
-- Solution
SELECT
    category,
    COUNT(*) AS completed_transactions
FROM sales
WHERE sales_status = 'Completed'
GROUP BY category
HAVING COUNT(*) > 2;

-- Q2: Find cities where total completed sales exceed 80000
-- Solution
SELECT
    city,
    SUM(amount) AS completed_sales
FROM sales
WHERE sales_status = 'Completed'
GROUP BY city
HAVING SUM(amount) > 80000;

-- Q3: Find categories where average completed sale is greater than 30000
-- Solution
SELECT
    category,
    AVG(amount) AS average_completed_sale
FROM sales
WHERE sales_status = 'Completed'
GROUP BY category
HAVING AVG(amount) > 30000;


-- Hard SQL Questions

-- Q4: Find city-category combinations having at least 2 completed
-- transactions and total completed sales above 50000
-- Solution
SELECT
    city,
    category,
    COUNT(*) AS completed_transactions,
    SUM(amount) AS completed_sales
FROM sales
WHERE sales_status = 'Completed'
GROUP BY city, category
HAVING COUNT(*) >= 2
   AND SUM(amount) > 50000;

-- Q5: Find cities having at least 2 unique customers and
-- average completed sale greater than 30000
-- Solution
SELECT
    city,
    COUNT(DISTINCT customer_name) AS unique_customers,
    AVG(amount) AS average_completed_sale
FROM sales
WHERE sales_status = 'Completed'
GROUP BY city
HAVING COUNT(DISTINCT customer_name) >= 2
   AND AVG(amount) > 30000;