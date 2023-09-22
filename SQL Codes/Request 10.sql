-- 10. Top 3 products in each division with high total_sold_quantity in fiscal year 2021.

WITH T1 AS (
    SELECT
        p.Division,
        s.Product_code,
        p.Product,
        SUM(s.sold_quantity) AS Total_sold_qty
    FROM
        dim_product p
    JOIN
        fact_sales_monthly s ON p.product_code = s.product_code
    WHERE
        s.fiscal_year = 2021
    GROUP BY
        p.division, s.product_code, p.product
), 
T2 AS (
    SELECT
        division,
        product_code,
        product,
        Total_sold_qty,
        RANK() OVER (PARTITION BY division ORDER BY Total_sold_qty DESC) AS Rank_order
    FROM
        T1
)
SELECT
    T1.Division,
    T1.Product_code,
    T1.Product,
    T1.Total_sold_qty,
    T2.Rank_order
FROM
    T1
JOIN
    T2 ON T1.product_code = T2.product_code
WHERE
    T2.Rank_order IN (1, 2, 3);
