SELECT e.Name AS Employee
FROM Employee e
JOIN Employee m
ON e.ManagerId = m.Id
WHERE e.Salary > m.Salary

--WHAT IS THE DIFFERENCE BETWEEN WHERE AND AND?
