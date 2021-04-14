-- only in this interval
SELECT product_id, product_name
FROM(
SELECT p.product_id, p.product_name, MIN(s.sale_date) AS start_date, MAX(s.sale_date) AS end_date
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING start_date >= '2019-01-01' AND end_date <= '2019-03-31') tmp.

--2.
SELECT p.product_id, p.product_name
FROM Product p
JOIN Sales s
ON s.product_id = p.product_id
GROUP BY p.product_id
HAVING SUM(CASE WHEN s.sale_date BETWEEN '2019-01-01' AND '2019-03-31' THEN 1 ELSE 0 END) > 0
AND SUM(CASE WHEN s.sale_date < '2019-01-01' OR s.sale_date > '2019-03-31' THEN 1 ELSE 0 END) = 0

--3
SELECT p.product_id, p.product_name
FROM Product p
JOIN Sales s
ON s.product_id = p.product_id
GROUP BY p.product_id
HAVING MIN(s.sale_date) >= '2019-01-01' AND MAX(s.sale_date) <= '2019-03-31'
