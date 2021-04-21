SELECT id, COUNT(id) AS num
FROM(
SELECT requester_id AS id
FROM request_accepted
UNION ALL 
SELECT accepter_id AS id
FROM request_accepted) t
GROUP BY id
ORDER BY 2 DESC
LIMIT 1
