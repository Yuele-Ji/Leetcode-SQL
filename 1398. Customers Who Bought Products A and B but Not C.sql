--1
SELECT c.customer_id, c.customer_name
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY 1,2
HAVING SUM(o.product_name = 'A') >= 1 AND SUM(o.product_name = 'B') >= 1 AND SUM(o.product_name = 'C') = 0

--2
SELECT customer_id, customer_name
FROM Customers
WHERE customer_id IN (SELECT customer_id FROM Orders WHERE product_name = 'A')
AND customer_id IN (SELECT customer_id FROM Orders WHERE product_name = 'B')
AND customer_id NOT IN (SELECT customer_id FROM Orders WHERE product_name = 'C')
