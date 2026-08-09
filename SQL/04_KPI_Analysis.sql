-- Sales Dashboard Analysis
-- 04 - KPI Analysis

USE sales_dashboard;

-- Total Sales
SELECT SUM(sales) AS total_sales
FROM superstore;

-- Total Profit
SELECT SUM(profit) AS total_profit
FROM superstore;

-- Total Quantity
SELECT SUM(quantity) AS total_quantity
FROM superstore;

-- Average Discount
SELECT AVG(discount) AS average_discount
FROM superstore;

-- Profit Margin
SELECT
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM superstore;

-- Executive KPI Summary
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity,
    AVG(discount) AS average_discount,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin,
    SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0) AS average_order_value
FROM superstore;
