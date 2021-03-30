SELECT seat_id
FROM(SELECT *,
       LAG(free, 1)OVER() AS LAST,
       LEAD(free,1)OVER() AS NEXT
       FROM cinema) AS SEAT
WHERE free = 1 AND (LAST = 1 OR NEXT =1)
ORDER BY seat_id
