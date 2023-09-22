-- 6. Top 5 customers with the highest average pre_invoice_discount_pct for fiscal year 2021 in the Indian market.

SELECT  c.Customer, ROUND(AVG(pre.pre_invoice_discount_pct)*100,2)  AS Avg_discount_percentage
FROM dim_customer c
JOIN fact_pre_invoice_deductions pre 
ON c.customer_code = pre.customer_code
WHERE fiscal_year = 2021 AND market = 'India'
GROUP BY c.customer_code, c.customer -- Include non-aggregated columns in the GROUP BY clause
ORDER BY Avg_discount_percentage DESC
LIMIT 5;
