-- 4. Segment with the most increase in unique products in 2021 vs 2020.

WITH product_count_2020 AS (
    SELECT p.segment, COUNT(DISTINCT p.product_code) AS product_count_2020 
    FROM dim_product p 
    JOIN fact_sales_monthly f ON p.product_code = f.product_code 
    WHERE fiscal_year = 2020 
    GROUP BY p.segment
),
product_count_2021 AS (
    SELECT p.segment, COUNT(DISTINCT p.product_code) AS product_count_2021 
    FROM dim_product p 
    JOIN fact_sales_monthly f ON p.product_code = f.product_code 
    WHERE fiscal_year = 2021 
    GROUP BY p.segment
)
SELECT 
    A.Segment, 
    Product_count_2020, 
    Product_count_2021,
    (product_count_2021 - product_count_2020) AS Difference
FROM product_count_2020 A 
JOIN product_count_2021 B ON A.segment = B.segment;
