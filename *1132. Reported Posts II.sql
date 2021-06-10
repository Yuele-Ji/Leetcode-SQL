SELECT ROUND(AVG(pct), 2) AS average_daily_percent 
FROM (SELECT (COUNT(DISTINCT r.post_id)/ COUNT(DISTINCT a.post_id))*100  AS pct
        FROM Actions a
        LEFT JOIN Removals r
        ON a.post_id = r.post_id
        WHERE a.extra='spam'
        GROUP BY a.action_date)tmp
