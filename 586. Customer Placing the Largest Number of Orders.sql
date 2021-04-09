--1. ONLY ONE CUSTOMER HAS HIGHEST ORDER
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1

--2. MULTIPLE CUSTOMERS
SELECT customer_number
FROM Orders
GROUP BY customer_number
HAVING COUNT(*) = (SELECT COUNT(*) FROM Orders 
                   GROUP BY customer_number 
                   ORDER BY 1 DESC
                   LIMIT 1)
                   
--3.
SELECT customer_number FROM (
SELECT customer_number, RANK()OVER(ORDER BY COUNT(order_number) DESC) AS RNK
FROM Orders
GROUP BY customer_number) T
WHERE RNK = 1
