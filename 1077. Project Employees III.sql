--1.
SELECT project_id, employee_id
FROM 
(SELECT p.project_id, e.employee_id, RANK()OVER(PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS RNK
FROM Project p
LEFT JOIN Employee e
ON p.employee_id = e.employee_id) lookup
WHERE RNK =1

--2.
SELECT p.project_id,e.employee_id
FROM Project p
JOIN Employee e
ON p.employee_id = e.employee_id
WHERE (p.project_id,e.experience_years) IN (
SELECT p.project_id, MAX(e.experience_years)
FROM Project p
JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY p.project_id)
