1. Select all players with their first login date
2. join the table with two condition to select players login after the first date so that we have all columns we need to calculate in the same table
3. do the math

SELECT ROUND(COALESCE((COUNT(DISTINCT B.player_id) / COUNT(DISTINCT A.player_id)),0),2) AS fraction
FROM
(SELECT player_id, MIN(event_date) AS FIRST_LOGIN 
FROM Activity 
GROUP BY player_id) A
LEFT JOIN Activity B
ON A.player_id = B.player_id
AND DATEDIFF(B.event_date, A.FIRST_LOGIN) = 1
