SELECT employee_id, COUNT(employee_id)OVER(PARTITION BY team_id) AS team_size
FROM Employee

--2.left join
SELECT e.employee_id, a.team_size
FROM Employee e
LEFT JOIN
(SELECT team_id, COUNT(employee_id) AS team_size
FROM Employee
GROUP BY team_id) a
ON e.team_id = a.team_id
