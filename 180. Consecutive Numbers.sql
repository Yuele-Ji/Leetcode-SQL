SELECT DISTINCT Num AS ConsecutiveNums
FROM(
SELECT Num, LEAD(Num,1)OVER(ORDER BY Id) AS next, LAG(Num,1)OVER(ORDER BY Id) AS last
FROM Logs) t
WHERE Num = next AND Num = last
