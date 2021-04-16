SELECT u.name, COALESCE(SUM(r.distance),0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r
ON u.id = r.user_id
GROUP BY u.id /* avoid to use name since some users may have same name */
ORDER BY 2 DESC, 1
