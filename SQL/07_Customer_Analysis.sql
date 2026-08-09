-- Sales Dashboard Analysis
-- 07 - Customer and Segment Analysis

USE sales_dashboard;

-- Segment Analysis
SELECT
    segment,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;

-- Segment Profit Margin
SELECT
    segment,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore
GROUP BY segment
ORDER BY profit_margin_percentage DESC;

-- Customer-Level Performance
SELECT
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC;

-- Top 10 Customers
SELECT
    customer_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Customer Profitability
SELECT
    customer_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin
FROM superstore
GROUP BY customer_name
ORDER BY total_profit DESC;

-- Orders by Region
SELECT
    region,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore
GROUP BY region
ORDER BY total_orders DESC;

-- Average Order Value by Region
SELECT
    region,
    SUM(sales) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(
        SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0),
        2
    ) AS average_order_value
FROM superstore
GROUP BY region
ORDER BY average_order_value DESC;
