-- ============================================================
-- Superstore Sales Analysis
-- Part 1: Data Exploration & Data Quality
-- ============================================================

CREATE DATABASE superstore_db;
USE superstore_db;

-- Q1. How many unique orders are present in the Superstore dataset?
SELECT COUNT(DISTINCT Order_ID) FROM superstore;


-- Q2. What are the total sales generated from all orders?
SELECT ROUND(SUM(sales), 2) AS total_sales FROM superstore;


-- Q3. What are the distinct product categories, sub-categories, customer segments, and shipping modes?

-- Distinct Categories
SELECT DISTINCT Category FROM superstore;

-- Distinct Sub-Categories
SELECT DISTINCT Sub_Category FROM superstore;

-- Distinct Customer Segments
SELECT DISTINCT Segment FROM superstore;

-- Distinct Shipping Modes
SELECT DISTINCT Ship_Mode FROM superstore;


-- Q4. What is the date range covered by the dataset?
SELECT MIN(order_date) AS earliest_order_date, MAX(order_date) AS latest_order_date FROM superstore;


-- Q5. How many unique customers and unique products are present in the dataset?
SELECT COUNT(DISTINCT Customer_ID) AS unique_customers, COUNT(DISTINCT Product_ID) AS unique_products FROM superstore;


-- Q6. Check for NULL values in important columns
SELECT
    SUM(CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END) AS null_order_id,
    SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS null_order_date,
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
    SUM(CASE WHEN Customer_Name IS NULL THEN 1 ELSE 0 END) AS null_customer_name,
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS null_category,
    SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS null_product_id,
    SUM(CASE WHEN Product_Name IS NULL THEN 1 ELSE 0 END) AS null_product_name,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS null_sales
FROM superstore;


-- Q7. Are there any duplicate Row_ID values in the dataset?
SELECT Row_ID, COUNT(*) AS occurrence_count
FROM superstore
GROUP BY Row_ID
HAVING COUNT(*) > 1;


-- Q8. Which Order_ID appears most frequently in the dataset?
SELECT Order_ID, COUNT(*) AS occurrence_count
FROM superstore
GROUP BY Order_ID
ORDER BY occurrence_count DESC
LIMIT 1;


-- Q9. Which customers have placed the highest number of unique orders?
SELECT Customer_ID, Customer_Name, COUNT(DISTINCT Order_ID) AS unique_orders
FROM superstore
GROUP BY Customer_ID, Customer_Name
ORDER BY unique_orders DESC
LIMIT 10;


-- Q10. What percentage of the dataset's rows belong to each customer segment?
SELECT
    Segment,
    COUNT(*) AS total_rows,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM superstore), 2) AS percentage_of_rows
FROM superstore
GROUP BY Segment
ORDER BY percentage_of_rows DESC;
