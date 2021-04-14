--1. 
WITH t AS (SELECT s.buyer_id, p.product_name
           FROM Sales s
           JOIN Product p
           ON s.product_id = p.product_id)
SELECT DISTINCT buyer_id
FROM t
WHERE product_name = 'S8' AND buyer_id NOT IN (SELECT buyer_id FROM t WHERE product_name = 'iPhone')

--2. 
SELECT s.buyer_id
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id
GROUP BY s.buyer_id
HAVING SUM(CASE WHEN p.product_name = 'S8' THEN 1 ELSE 0 END) > 0
AND SUM(CASE WHEN p.product_name = 'iPhone' THEN 1 ELSE 0 END) = 0
