-- SQL Day 4: COUNT(DISTINCT)
-- COUNT(DISTINCT column) counts unique non-NULL values.


-- 1. Count unique customers
SELECT
    COUNT(DISTINCT customer_name) AS unique_customers
FROM transactions;


-- 2. Count unique cities
SELECT
    COUNT(DISTINCT city) AS unique_cities
FROM transactions;


-- 3. Count unique products
SELECT
    COUNT(DISTINCT product) AS unique_products
FROM transactions;


-- 4. Count unique categories
SELECT
    COUNT(DISTINCT category) AS unique_categories
FROM transactions;


-- 5. Count unique payment methods
SELECT
    COUNT(DISTINCT payment_method) AS unique_payment_methods
FROM transactions;


-- 6. Count unique customers who completed transactions
SELECT
    COUNT(DISTINCT customer_name) AS unique_completed_customers
FROM transactions
WHERE transaction_status = 'Completed';


-- 7. Count unique customers with pending transactions
SELECT
    COUNT(DISTINCT customer_name) AS unique_pending_customers
FROM transactions
WHERE transaction_status = 'Pending';


-- 8. Count unique customers from Pune
SELECT
    COUNT(DISTINCT customer_name) AS unique_pune_customers
FROM transactions
WHERE city = 'Pune';


-- 9. Count unique products in Electronics
SELECT
    COUNT(DISTINCT product) AS unique_electronics_products
FROM transactions
WHERE category = 'Electronics';


-- 10. Count unique products purchased through UPI
SELECT
    COUNT(DISTINCT product) AS unique_upi_products
FROM transactions
WHERE payment_method = 'UPI';


-- 11. Count unique customers by city
SELECT
    city,
    COUNT(DISTINCT customer_name) AS unique_customers
FROM transactions
GROUP BY city;


-- 12. Count unique products by category
SELECT
    category,
    COUNT(DISTINCT product) AS unique_products
FROM transactions
GROUP BY category;


-- 13. Count unique customers by transaction status
SELECT
    transaction_status,
    COUNT(DISTINCT customer_name) AS unique_customers
FROM transactions
GROUP BY transaction_status;


-- 14. Count unique products and unique customers together
SELECT
    COUNT(DISTINCT product) AS unique_products,
    COUNT(DISTINCT customer_name) AS unique_customers
FROM transactions;


-- 15. Count unique customer-product combinations
SELECT
    COUNT(DISTINCT (customer_name, product)) AS unique_customer_product_pairs
FROM transactions;
