-- DAY 3 — SORTING AND CONDITIONAL LOGIC
-- File: 05-CASE-WHEN.sql
-- Topic: CASE WHEN
-- Database: PostgreSQL

-- 1. High vs Low sales
SELECT
    customer_name,
    total_amount,
    CASE
        WHEN total_amount >= 50000 THEN 'High'
        ELSE 'Low'
    END AS sales_category
FROM sales_orders;

-- 2. High, Medium and Low sales
SELECT
    customer_name,
    total_amount,
    CASE
        WHEN total_amount >= 50000 THEN 'High'
        WHEN total_amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS sales_category
FROM sales_orders;

-- 3. Payment classification
SELECT
    customer_name,
    payment_status,
    CASE
        WHEN payment_status = 'Paid' THEN 'Completed'
        ELSE 'Pending Payment'
    END AS payment_category
FROM sales_orders;

-- 4. Rating classification
SELECT
    customer_name,
    customer_rating,
    CASE
        WHEN customer_rating >= 4.5 THEN 'Excellent'
        WHEN customer_rating >= 4.0 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS rating_category
FROM sales_orders;

-- 5. Quantity classification
SELECT
    customer_name,
    product,
    quantity,
    CASE
        WHEN quantity >= 5 THEN 'Bulk Order'
        WHEN quantity >= 3 THEN 'Medium Order'
        ELSE 'Small Order'
    END AS order_size
FROM sales_orders;

-- 6. Product category mapping
SELECT
    customer_name,
    product,
    category,
    CASE
        WHEN category = 'Electronics' THEN 'Tech'
        WHEN category = 'Furniture' THEN 'Home'
        ELSE 'Accessories'
    END AS business_category
FROM sales_orders;

-- 7. Region classification
SELECT
    customer_name,
    city,
    CASE
        WHEN city IN ('Mumbai', 'Pune') THEN 'Maharashtra'
        WHEN city = 'Delhi' THEN 'Delhi NCR'
        ELSE 'Other'
    END AS region
FROM sales_orders;

-- 8. Customer feedback classification
SELECT
    customer_name,
    customer_rating,
    CASE
        WHEN customer_rating >= 4.5 THEN 'Excellent'
        WHEN customer_rating >= 4.0 THEN 'Good'
        WHEN customer_rating >= 3.5 THEN 'Average'
        ELSE 'Poor'
    END AS customer_feedback
FROM sales_orders;

-- 9. Price classification
SELECT
    product,
    unit_price,
    CASE
        WHEN unit_price >= 50000 THEN 'Expensive'
        ELSE 'Affordable'
    END AS price_category
FROM sales_orders;

-- 10. Payment completed flag
SELECT
    order_id,
    customer_name,
    payment_status,
    CASE
        WHEN payment_status = 'Paid' THEN 'Yes'
        ELSE 'No'
    END AS payment_completed
FROM sales_orders;

-- 11. Sales priority
SELECT
    order_id,
    customer_name,
    total_amount,
    CASE
        WHEN total_amount >= 100000 THEN 'Critical'
        WHEN total_amount >= 50000 THEN 'High'
        WHEN total_amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS sales_priority
FROM sales_orders;

-- 12. Multiple conditions
SELECT
    customer_name,
    total_amount,
    payment_status,
    CASE
        WHEN total_amount >= 50000
             AND payment_status = 'Paid'
            THEN 'High Value - Completed'
        WHEN total_amount >= 50000
             AND payment_status = 'Pending'
            THEN 'High Value - Pending'
        ELSE 'Normal Order'
    END AS order_status
FROM sales_orders;

-- 13. Discount eligibility
SELECT
    customer_name,
    total_amount,
    CASE
        WHEN total_amount >= 50000 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS discount_eligibility
FROM sales_orders;

-- 14. Customer segment
SELECT
    customer_name,
    total_amount,
    CASE
        WHEN total_amount >= 100000 THEN 'Premium'
        WHEN total_amount >= 50000 THEN 'Gold'
        WHEN total_amount >= 20000 THEN 'Silver'
        ELSE 'Regular'
    END AS customer_segment
FROM sales_orders;

-- 15. Custom business sorting using CASE
SELECT
    customer_name,
    total_amount,
    CASE
        WHEN total_amount >= 50000 THEN 'High'
        WHEN total_amount >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS sales_level
FROM sales_orders
ORDER BY
    CASE
        WHEN total_amount >= 50000 THEN 1
        WHEN total_amount >= 20000 THEN 2
        ELSE 3
    END;