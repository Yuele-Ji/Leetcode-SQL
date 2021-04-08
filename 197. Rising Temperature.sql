--1.
SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.Temperature > w2.Temperature

--2.
SELECT t.id AS Id FROM (
SELECT id, recordDate d1, Temperature t1, LAG(recordDate,1)OVER(ORDER BY recordDate) d0, LAG(Temperature,1)OVER(ORDER BY recordDate) t0
FROM Weather
ORDER BY recordDate) t
WHERE t.t1 > t.t0 AND DATEDIFF(t.d1,t.d0) = 1
