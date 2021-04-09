SELECT seat_id
FROM(SELECT *,
       LAG(free, 1)OVER(ORDER BY seat_id) AS LAST,
       LEAD(free,1)OVER(ORDER BY seat_id) AS NEXT
       FROM cinema) AS SEAT
WHERE free = 1 AND (LAST = 1 OR NEXT =1)
ORDER BY seat_id

--2. SELF JOIN ON ABS(A.ID - B.ID) =1
