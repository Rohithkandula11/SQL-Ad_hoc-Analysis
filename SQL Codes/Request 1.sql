-- 1. List of markets where customer "Atliq Exclusive" operates its business in the APAC region.

SELECT distinct Market 
FROM dim_customer 
WHERE customer = 'Atliq Exclusive' AND region = 'APAC';
