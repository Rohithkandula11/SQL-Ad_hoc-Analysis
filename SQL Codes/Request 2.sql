-- 2. Percentage increase in unique products in 2021 vs. 2020.

WITH products_20 AS (
    SELECT COUNT(DISTINCT product_code) AS Unique_products_2020 
    FROM fact_gross_price 
    WHERE fiscal_year = 2020
),
product_21 AS (
    SELECT COUNT(DISTINCT product_code) AS unique_products_2021 
    FROM fact_gross_price 
    WHERE fiscal_year = 2021
)
SELECT 
    Unique_products_2020,
    Unique_products_2021,
    ROUND(((unique_products_2021 - unique_products_2020) / unique_products_2020) * 100, 2) AS Percentage_chg
FROM products_20 
JOIN product_21;
