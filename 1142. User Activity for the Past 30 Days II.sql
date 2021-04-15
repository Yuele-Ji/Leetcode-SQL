SELECT ROUND(COALESCE(COUNT(DISTINCT user_id, session_id) / COUNT(DISTINCT user_id), 0), 2) AS average_sessions_per_user
FROM Activity
WHERE DATEDIFF('2019-07-27', activity_date) < 30
