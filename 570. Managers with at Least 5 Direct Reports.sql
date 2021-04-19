--1.
SELECT m.Name
FROM Employee e
JOIN Employee m
ON e.ManagerId = m.Id
GROUP BY m.Id
HAVING COUNT(DISTINCT e.Id) >=5

--2.
SELECT Name FROM Employee
WHERE Id IN (SELECT ManagerId 
             FROM Employee 
             GROUP BY ManagerId 
             HAVING COUNT(Id)>=5)
