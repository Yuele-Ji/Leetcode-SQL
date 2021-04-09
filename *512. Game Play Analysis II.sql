--1.
SELECT player_id, device_id
FROM Activity
WHERE (player_id, event_date) IN (SELECT player_id, MIN(event_date) FROM Activity GROUP BY player_id)
-- only by both columns can you identify a single record

--2. WINDOW FUNCTION
SELECT player_id, device_id FROM
(SELECT player_id, device_id, event_date, 
        ROW_NUMBER()OVER(PARTITION BY player_id ORDER BY event_date) AS r FROM Activity) AS lookup
WHERE r=1
