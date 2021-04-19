SELECT Department, Employee, Salary
FROM
(SELECT d.Name AS Department, e.Name AS Employee, e.Salary, RANK()OVER(PARTITION BY d.Name ORDER BY e.Salary DESC) AS RNK
FROM Employee e
JOIN Department d
ON e.DepartmentId = d.Id) T_RNK
WHERE RNK = 1

SELECT d.Name AS Department, e.Name AS Employee, e.Salary
FROM Employee e
JOIN Department d
ON e.DepartmentId = d.Id
WHERE (e.DepartmentId, e.Salary) IN (SELECT DepartmentId, MAX(Salary) FROM Employee GROUP BY DepartmentId)
