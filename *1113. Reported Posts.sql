-- IS NOT NULL is unnecessary
SELECT extra AS report_reason, COUNT(DISTINCT post_id) AS report_count
FROM Actions
WHERE DATEDIFF('2019-07-05', action_date) = 1 AND action = 'report'
GROUP BY report_reason
