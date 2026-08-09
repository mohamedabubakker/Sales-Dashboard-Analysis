-- Sales Dashboard Analysis
-- 10 - Advanced SQL: CTEs and Window Functions

USE sales_dashboard;

-- Year-over-Year Sales Growth
WITH yearly_sales AS
(
    SELECT
        YEAR(order_date) AS sales_year,
        SUM(sales) AS total_sales
    FROM superstore
    GROUP BY YEAR(order_date)
)
SELECT
    sales_year,
    total_sales,
    LAG(total_sales) OVER (
        ORDER BY sales_year
    ) AS previous_year_sales,
    ROUND(
        (
            total_sales -
            LAG(total_sales) OVER (
                ORDER BY sales_year
            )
        )
        / NULLIF(
            LAG(total_sales) OVER (
                ORDER BY sales_year
            ),
            0
        ) * 100,
        2
    ) AS yoy_growth_percentage
FROM yearly_sales
ORDER BY sales_year;


-- Rank Products by Sales
WITH product_sales AS
(
    SELECT
        product_name,
        SUM(sales) AS total_sales
    FROM superstore
    GROUP BY product_name
)
SELECT
    product_name,
    total_sales,
    RANK() OVER (
        ORDER BY total_sales DESC
    ) AS sales_rank
FROM product_sales
ORDER BY sales_rank;


-- Rank Products Within Each Category
WITH product_performance AS
(
    SELECT
        category,
        product_name,
        SUM(sales) AS total_sales
    FROM superstore
    GROUP BY category, product_name
)
SELECT
    category,
    product_name,
    total_sales,
    RANK() OVER (
        PARTITION BY category
        ORDER BY total_sales DESC
    ) AS category_rank
FROM product_performance
ORDER BY category, category_rank;


-- Top 3 Products in Each Category
WITH product_sales AS
(
    SELECT
        category,
        product_name,
        SUM(sales) AS total_sales
    FROM superstore
    GROUP BY category, product_name
),
ranked_products AS
(
    SELECT
        category,
        product_name,
        total_sales,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY total_sales DESC
        ) AS product_rank
    FROM product_sales
)
SELECT
    category,
    product_name,
    total_sales,
    product_rank
FROM ranked_products
WHERE product_rank <= 3
ORDER BY category, product_rank;
