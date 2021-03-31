--1. SELECT (....) AS alias
SELECT 
(SELECT num
FROM my_numbers
GROUP BY num
HAVING COUNT(*) = 1
ORDER BY num DESC
LIMIT 1) AS num

--2. MAX()
SELECT MAX(num) AS num
FROM
(SELECT num
FROM my_numbers
GROUP BY num
HAVING COUNT(*) = 1) AS tmp
