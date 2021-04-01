--1.
SELECT seller_id 
FROM Sales
GROUP BY seller_id
HAVING SUM(price) = (SELECT SUM(price) AS hp
                       FROM Sales
                       GROUP BY seller_id
                       ORDER BY SUM(price) DESC
                       LIMIT 1)
--2. 
SELECT seller_id
FROM (SELECT seller_id, RANK()OVER(ORDER BY SUM(price) DESC) AS rnk
FROM Sales
GROUP BY seller_id) tmp
WHERE rnk = 1
