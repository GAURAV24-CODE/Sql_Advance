-- GROUP BY with CASE

-- Example 1: Count sales by amount category
SELECT
    CASE
        WHEN amount >= 50000 THEN 'High Sale'
        WHEN amount >= 20000 THEN 'Medium Sale'
        ELSE 'Low Sale'
    END AS sale_category,
    COUNT(*) AS total_sales
FROM sales
GROUP BY
    CASE
        WHEN amount >= 50000 THEN 'High Sale'
        WHEN amount >= 20000 THEN 'Medium Sale'
        ELSE 'Low Sale'
    END;

-- Example 2: Total sales by amount category
SELECT
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 25000 THEN 'Medium'
        ELSE 'Low'
    END AS amount_category,
    SUM(amount) AS total_sales
FROM sales
GROUP BY
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 25000 THEN 'Medium'
        ELSE 'Low'
    END;

-- Example 3: Average sale by amount category
SELECT
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS sale_category,
    AVG(amount) AS average_sale
FROM sales
GROUP BY
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END;

-- Example 4: Count sales by quantity category
SELECT
    CASE
        WHEN quantity >= 3 THEN 'Bulk'
        WHEN quantity = 2 THEN 'Medium'
        ELSE 'Single'
    END AS quantity_category,
    COUNT(*) AS total_orders
FROM sales
GROUP BY
    CASE
        WHEN quantity >= 3 THEN 'Bulk'
        WHEN quantity = 2 THEN 'Medium'
        ELSE 'Single'
    END;

-- Example 5: Group by city and sale category
SELECT
    city,
    CASE
        WHEN amount >= 50000 THEN 'High'
        ELSE 'Low'
    END AS sale_category,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY
    city,
    CASE
        WHEN amount >= 50000 THEN 'High'
        ELSE 'Low'
    END;

-- Example 6: Completed sales by custom amount group
SELECT
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS sale_category,
    SUM(amount) AS completed_sales
FROM sales
WHERE sales_status = 'Completed'
GROUP BY
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END;

-- Example 7: CASE + GROUP BY + HAVING
SELECT
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS sale_category,
    SUM(amount) AS total_sales
FROM sales
GROUP BY
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END
HAVING SUM(amount) > 100000;


-- TCS NQT / LeetCode-style Practice

-- Q1: Find total sales for High, Medium and Low sale categories
-- Solution
SELECT
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS sale_category,
    SUM(amount) AS total_sales
FROM sales
GROUP BY
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END;

-- Q2: Find the number of completed transactions in each amount category
-- Solution
SELECT
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS sale_category,
    COUNT(*) AS completed_transactions
FROM sales
WHERE sales_status = 'Completed'
GROUP BY
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END;

-- Q3: Find city and sale category combinations with more than 1 transaction
-- Solution
SELECT
    city,
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS sale_category,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY
    city,
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END
HAVING COUNT(*) > 1;


-- Hard SQL Questions

-- Q4: Find amount categories where completed sales exceed 80000
-- and completed transactions are at least 2
-- Solution
SELECT
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS sale_category,
    COUNT(*) AS completed_transactions,
    SUM(amount) AS completed_sales
FROM sales
WHERE sales_status = 'Completed'
GROUP BY
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END
HAVING COUNT(*) >= 2
   AND SUM(amount) > 80000;

-- Q5: Find each city with its custom sale category having
-- average sale above 30000
-- Solution
SELECT
    city,
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS sale_category,
    AVG(amount) AS average_sale
FROM sales
GROUP BY
    city,
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END
HAVING AVG(amount) > 30000;