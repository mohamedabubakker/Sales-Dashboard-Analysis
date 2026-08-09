-- Sales Dashboard Analysis
-- 08 - Product Analysis

USE sales_dashboard;

-- Top 10 Products by Sales
SELECT
    product_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- Top 10 Products by Profit
SELECT
    product_name,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- Bottom 10 Products by Profit
SELECT
    product_name,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;

-- Category + Sub-Category Analysis
SELECT
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY category, sub_category
ORDER BY category, total_profit DESC;

-- Products with high sales but negative profit
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
HAVING SUM(profit) < 0
   AND SUM(sales) > 1000
ORDER BY total_sales DESC;

-- Products above average product sales
SELECT
    product_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY product_name
HAVING SUM(sales) >
(
    SELECT AVG(product_sales)
    FROM
    (
        SELECT SUM(sales) AS product_sales
        FROM superstore
        GROUP BY product_name
    ) AS sales_summary
)
ORDER BY total_sales DESC;
