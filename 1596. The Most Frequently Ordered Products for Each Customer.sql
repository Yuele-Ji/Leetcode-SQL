WITH LOOKUP AS (SELECT o.customer_id, p.product_id, p.product_name, RANK()OVER(PARTITION BY o.customer_id ORDER BY COUNT(p.product_id) DESC) AS RNK
FROM Orders o
JOIN Products p
ON o.product_id = p.product_id
GROUP BY o.customer_id, p.product_id, p.product_name)
SELECT customer_id, product_id, product_name
FROM LOOKUP
WHERE RNK = 1

--错误1:count的内容 错误2:不需要join三个表
