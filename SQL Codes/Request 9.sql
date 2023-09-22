-- 9. Channel with the highest gross sales contribution in fiscal year 2021.

WITH Gross_sales AS
(
    SELECT
        channel,
        ROUND(SUM(sold_quantity * gross_price) / 1000000, 2) AS Gross_Sales_mln
    FROM
        dim_customer c
    JOIN
        fact_sales_monthly s ON c.customer_code = s.customer_code
    JOIN
        fact_gross_price g ON s.product_code = g.product_code
    WHERE
        s.fiscal_year = 2021
    GROUP BY
        channel
)
SELECT
    channel,
    CONCAT(Gross_Sales_mln, ' M') AS Gross_Sales_mln,
    CONCAT(ROUND(Gross_Sales_mln * 100 / Total, 2), '%') AS Percentage
FROM
    (
        (SELECT SUM(Gross_Sales_mln) AS Total FROM Gross_sales) A,
        (SELECT * FROM Gross_sales) B
    )
ORDER BY
    Percentage DESC;
