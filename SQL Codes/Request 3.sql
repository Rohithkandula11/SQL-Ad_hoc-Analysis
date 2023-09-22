-- 3. Report of unique product counts for each segment.

SELECT Segment, COUNT(DISTINCT product_code) AS Product_count 
FROM dim_product 
GROUP BY segment 
ORDER BY product_count DESC;
