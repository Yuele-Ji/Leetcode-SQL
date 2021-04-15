--1.
SELECT ROUND(COALESCE(((SELECT COUNT(delivery_id) AS immediate FROM Delivery WHERE order_date = customer_pref_delivery_date)
 / (SELECT COUNT(delivery_id) FROM Delivery) * 100), 0) ,2) AS immediate_percentage
 
--2.
SELECT ROUND(COALESCE(((SUM(order_date = customer_pref_delivery_date) / COUNT(*) )* 100), 0) ,2) AS immediate_percentage
FROM Delivery
