-- Sales Dashboard Analysis
-- 11 - Master Executive Query
-- Use this query as the main KPI query for the project.

USE sales_dashboard;

SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity,
    ROUND(AVG(discount) * 100, 2) AS avg_discount_percentage,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage,
    ROUND(
        SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0),
        2
    ) AS average_order_value
FROM superstore;
