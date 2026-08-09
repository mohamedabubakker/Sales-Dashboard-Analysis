-- Sales Dashboard Analysis
-- 05 - Sales Analysis

USE sales_dashboard;

-- Sales by Region
SELECT
    region,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- Sales and Profit by Region
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- Sales by Category
SELECT
    category,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- Sales by Sub-Category
SELECT
    sub_category,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY sub_category
ORDER BY total_sales DESC;

-- Monthly Sales
SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS month_number,
    MONTHNAME(order_date) AS month_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY YEAR(order_date), MONTH(order_date), MONTHNAME(order_date)
ORDER BY sales_year, month_number;

-- Yearly Sales and Profit
SELECT
    YEAR(order_date) AS sales_year,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY YEAR(order_date)
ORDER BY sales_year;

-- Sales by State
SELECT
    state,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_sales DESC;
