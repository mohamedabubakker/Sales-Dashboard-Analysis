-- Sales Dashboard Analysis
-- 09 - Discount and Profit Analysis

USE sales_dashboard;

-- Discount vs Profit
SELECT
    discount,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(*) AS transaction_count
FROM superstore
GROUP BY discount
ORDER BY discount;

-- Discount Band Analysis
SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.10 THEN 'Low Discount'
        WHEN discount <= 0.30 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_band,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(discount) AS average_discount
FROM superstore
GROUP BY
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.10 THEN 'Low Discount'
        WHEN discount <= 0.30 THEN 'Medium Discount'
        ELSE 'High Discount'
    END
ORDER BY total_profit DESC;

-- Products with high discount and negative profit
SELECT
    product_name,
    category,
    sub_category,
    AVG(discount) AS average_discount,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name, category, sub_category
HAVING AVG(discount) >= 0.30
   AND SUM(profit) < 0
ORDER BY total_profit ASC;

-- High-discount transactions
SELECT
    order_id,
    product_name,
    discount,
    sales,
    profit
FROM superstore
WHERE discount >= 0.30
ORDER BY discount DESC;

-- High discount and loss transactions
SELECT
    COUNT(*) AS loss_transactions
FROM superstore
WHERE discount >= 0.30
  AND profit < 0;

-- Negative-profit transactions
SELECT
    order_id,
    customer_name,
    product_name,
    sales,
    discount,
    profit
FROM superstore
WHERE profit < 0
ORDER BY profit ASC;
