-- 8. Quarter of 2020 with the maximum total_sold_quantity.

SELECT 
    CASE
        WHEN date BETWEEN '2019-09-01' AND '2019-11-01' THEN CONCAT('[', 1, '] ', MONTHNAME(date))  
        WHEN date BETWEEN '2019-12-01' AND '2020-02-01' THEN CONCAT('[', 2, '] ', MONTHNAME(date))
        WHEN date BETWEEN '2020-03-01' AND '2020-05-01' THEN CONCAT('[', 3, '] ', MONTHNAME(date))
        WHEN date BETWEEN '2020-06-01' AND '2020-08-01' THEN CONCAT('[', 4, '] ', MONTHNAME(date))
    END AS Quarters,
    SUM(sold_quantity) AS total_sold_quantity
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY Quarters;
