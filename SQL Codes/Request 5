-- 5. Products with the highest and lowest manufacturing costs.

SELECT p.Product_code, p.Product, m.Manufacturing_cost
FROM fact_manufacturing_cost m
JOIN dim_product p ON m.product_code = p.product_code
WHERE manufacturing_cost IN (
    SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost
    UNION
    SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost
);
