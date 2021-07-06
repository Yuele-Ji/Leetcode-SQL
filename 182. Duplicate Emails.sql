--1.
SELECT Email
FROM Person
GROUP BY Email
HAVING COUNT(Email)>1

--2. FASTER
SELECT DISTINCT B.Email
FROM Person A
JOIN Person B
ON A.Email = B.Email
WHERE A.Id < B.Id
