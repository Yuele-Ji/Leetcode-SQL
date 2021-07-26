SELECT product_id, year AS first_year, quantity, price
FROM 
(SELECT product_id, year, quantity, price, RANK()OVER(PARTITION BY product_id ORDER BY year) AS RNK
FROM Sales) lookup
WHERE RNK = 1

--2.
SELECT product_id, year AS first_year, quantity, price
FROM Sales]
WHERE (product_id, year) IN (SELECT product_id, MIN(year) FROM Sales GROUP BY product_id)

-- If you do:
--ELECT product_id, MIN(year) AS first_year, quantity, price
--FROM Sales a
--GROUP BY product_id
--Then unaggregated columns, e.g., quantity and price will not match with the MIN(year) of each product_id. 
