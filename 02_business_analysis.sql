-- ============================================================
-- Superstore Sales Analysis
-- Part 2: Sales & Business Analysis
-- ============================================================

-- Q11. Which product category generates the highest total sales?
SELECT category, ROUND(SUM(sales), 2) AS total_sale
FROM superstore
GROUP BY category
ORDER BY SUM(sales) DESC
LIMIT 1;


-- Q12. Which sub-category generates the highest total sales?
SELECT sub_category, ROUND(SUM(sales), 2) AS highest_total_sales
FROM superstore
GROUP BY sub_category
ORDER BY SUM(sales) DESC
LIMIT 1;


-- Q13. Which 10 products generate the highest total sales?
SELECT product_id, product_name, ROUND(SUM(sales), 2) AS highest_total_sale
FROM superstore
GROUP BY product_id, product_name
ORDER BY SUM(sales) DESC
LIMIT 10;


-- Q14. Which 10 products generate the lowest total sales?
SELECT product_id, product_name, ROUND(SUM(sales), 2) AS lowest_total_sale
FROM superstore
GROUP BY product_id, product_name
ORDER BY SUM(sales)
LIMIT 10;


-- Q15. Which 10 customers generate the highest total sales?
SELECT customer_id, customer_name, ROUND(SUM(sales), 2) AS highest_sale
FROM superstore
GROUP BY customer_id, customer_name
ORDER BY SUM(sales) DESC
LIMIT 10;


-- Q16. Which region generates the highest total sales?
SELECT region, ROUND(SUM(sales), 2) AS highest_total_sale
FROM superstore
GROUP BY region
ORDER BY SUM(sales) DESC
LIMIT 1;


-- Q17. Which 10 states generate the highest total sales?
SELECT state, ROUND(SUM(sales), 2) AS total_sale
FROM superstore
GROUP BY state
ORDER BY SUM(sales) DESC
LIMIT 10;


-- Q18. Which customer segment generates the highest total sales?
SELECT segment, ROUND(SUM(sales), 2) AS highest_sale
FROM superstore
GROUP BY segment
ORDER BY SUM(sales) DESC
LIMIT 1;


-- Q19. Which shipping mode generates the highest total sales?
SELECT ship_mode, ROUND(SUM(sales), 2) AS highest_sale
FROM superstore
GROUP BY ship_mode
ORDER BY SUM(sales) DESC
LIMIT 1;


-- Q20. What is the average sales value per order?
SELECT ROUND(SUM(Sales) / COUNT(DISTINCT Order_ID), 2) AS average_sales_per_order
FROM superstore;
