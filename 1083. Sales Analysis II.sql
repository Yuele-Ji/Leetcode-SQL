--1. WITH t AS (SELECT s.buyer_id, p.product_name
           FROM Sales s
           JOIN Product p
           ON s.product_id = p.product_id)
SELECT DISTINCT buyer_id
FROM t
WHERE product_name = 'S8' AND buyer_id NOT IN (SELECT buyer_id FROM t WHERE product_name = 'iPhone')

--2. SELECT DISTINCT buyer_id
FROM Sales
WHERE buyer_id IN (SELECT s.buyer_id
                   FROM Sales s
                   JOIN Product p
                   ON s.product_id = p.product_id
                   WHERE product_name = 'S8')
AND buyer_id NOT IN (SELECT s.buyer_id
                  FROM Sales s
                  JOIN Product p
                  ON s.product_id = p.product_id
                  WHERE product_name = 'iPhone')
