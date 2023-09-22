-- 7. Gross sales amount for customer “Atliq Exclusive” for each month.

SELECT CONCAT(MONTHName(date),' (', YEAR(date),')') AS 'Month', s.fiscal_year,
       ROUND(SUM(s.sold_quantity * g.gross_price), 2) AS Gross_Sales_Amt 
FROM fact_sales_monthly s
JOIN fact_gross_price g ON s.product_code = g.product_code
JOIN dim_customer c ON c.customer_code = s.customer_code
WHERE c.customer = 'Atliq Exclusive'
GROUP BY Month, s.fiscal_year
ORDER BY s.fiscal_year;
