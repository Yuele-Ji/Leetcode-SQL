SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE DATEDIFF('2019-07-27', activity_date) <30
GROUP BY activity_date 
-- HAVING COUNT(activity_type) >= 1 is unnecessary since the activity_type column is an ENUM of 4 types, it has to have at least one activity to be recoreded.
