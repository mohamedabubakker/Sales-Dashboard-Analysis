-- Sales Dashboard Analysis
-- 06 - Profit Analysis

USE sales_dashboard;

-- Profit by Region
SELECT
    region,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;

-- Profit by Category
SELECT
    category,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;

-- Category Performance
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity,
    AVG(discount) AS avg_discount,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;

-- Profit by Sub-Category
SELECT
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY sub_category
ORDER BY total_profit ASC;

-- Loss-Making Sub-Categories
SELECT
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;

-- Loss-Making Products
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;

-- Bottom 10 Products by Profit
SELECT
    product_name,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;

-- Worst Performing States
SELECT
    state,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_profit ASC
LIMIT 10;
