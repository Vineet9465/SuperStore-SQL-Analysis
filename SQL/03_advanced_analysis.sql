-- ============================================================
-- Superstore Sales Analysis
-- Part 3: Advanced SQL & Deeper Analysis
-- ============================================================

-- Q21. Find the top 3 products by sales within each category.
SELECT category, product_name, total_sales, ranking
FROM (
    SELECT category, product_name, total_sales,
           DENSE_RANK() OVER (PARTITION BY category ORDER BY total_sales DESC) AS ranking
    FROM (
        SELECT category, product_name, ROUND(SUM(sales), 2) AS total_sales
        FROM superstore
        GROUP BY category, product_name
    ) p
) t
WHERE ranking <= 3
ORDER BY category, ranking;


-- Q22. Rank customers by total sales within each region.
SELECT region, customer_name, total_sales, ranking
FROM (
    SELECT region, customer_name, total_sales,
           DENSE_RANK() OVER (PARTITION BY region ORDER BY total_sales DESC) AS ranking
    FROM (
        SELECT region, customer_name, ROUND(SUM(sales), 2) AS total_sales
        FROM superstore
        GROUP BY region, customer_name
    ) p
) t
ORDER BY region, ranking;


-- Q23. Calculate the running total of sales by order date.
SELECT order_date, daily_sales,
       ROUND(SUM(daily_sales) OVER (ORDER BY order_date), 2) AS running_total
FROM (
    SELECT order_date, SUM(sales) AS daily_sales
    FROM superstore
    GROUP BY order_date
) t
ORDER BY order_date;


-- Q24. Find each category's percentage contribution to total sales.
SELECT category, category_sales, total_sales,
       ROUND((category_sales / total_sales) * 100, 2) AS sales_percentage
FROM (
    SELECT category,
           SUM(sales) AS category_sales,
           SUM(SUM(sales)) OVER () AS total_sales
    FROM superstore
    GROUP BY category
) t
ORDER BY sales_percentage DESC;


-- Q25. Find the highest-selling product in every sub-category.
SELECT sub_category, product_name, total_sales
FROM (
    SELECT sub_category, product_name, total_sales,
           DENSE_RANK() OVER (PARTITION BY sub_category ORDER BY total_sales DESC) AS ranking
    FROM (
        SELECT sub_category, product_name, ROUND(SUM(sales), 2) AS total_sales
        FROM superstore
        GROUP BY sub_category, product_name
    ) t
) p
WHERE ranking = 1;


-- Q26. Find customers whose total sales are above the overall average customer sales.
SELECT customer_name, region, total_sales, overall_avg_sales
FROM (
    SELECT customer_name, region, total_sales,
           ROUND(AVG(total_sales) OVER (), 2) AS overall_avg_sales
    FROM (
        SELECT customer_name, region, SUM(sales) AS total_sales
        FROM superstore
        GROUP BY customer_name, region
    ) p
) t
WHERE total_sales > overall_avg_sales;


-- Q27. Find states whose total sales are above the average sales across all states.
SELECT state, total_sales, average_total_sales
FROM (
    SELECT state, total_sales,
           ROUND(AVG(total_sales) OVER (), 2) AS average_total_sales
    FROM (
        SELECT state, SUM(sales) AS total_sales
        FROM superstore
        GROUP BY state
    ) p
) t
WHERE total_sales > average_total_sales;
