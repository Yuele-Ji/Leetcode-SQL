SELECT u.user_id AS buyer_id, join_date, 
COALESCE(COUNT(order_id), 0) AS orders_in_2019 
FROM Users u
LEFT JOIN Orders o
ON u.user_id = o.buyer_id AND YEAR(order_date) = '2019'
GROUP BY 1,2
ORDER BY 1
