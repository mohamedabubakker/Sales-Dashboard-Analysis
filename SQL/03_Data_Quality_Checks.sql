-- Sales Dashboard Analysis
-- 03 - Data Quality Checks

USE sales_dashboard;

-- Total records
SELECT COUNT(*) AS total_records
FROM superstore;

-- Duplicate rows by order/product/date
SELECT
    order_id,
    product_name,
    order_date,
    COUNT(*) AS duplicate_count
FROM superstore
GROUP BY order_id, product_name, order_date
HAVING COUNT(*) > 1;

-- Duplicate Row IDs
SELECT
    row_id,
    COUNT(*) AS count_rows
FROM superstore
GROUP BY row_id
HAVING COUNT(*) > 1;

-- Missing values
SELECT
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS missing_order_id,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS missing_order_date,
    SUM(CASE WHEN customer_name IS NULL THEN 1 ELSE 0 END) AS missing_customer,
    SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) AS missing_region,
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS missing_category,
    SUM(CASE WHEN sales IS NULL THEN 1 ELSE 0 END) AS missing_sales,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS missing_quantity,
    SUM(CASE WHEN discount IS NULL THEN 1 ELSE 0 END) AS missing_discount,
    SUM(CASE WHEN profit IS NULL THEN 1 ELSE 0 END) AS missing_profit
FROM superstore;
