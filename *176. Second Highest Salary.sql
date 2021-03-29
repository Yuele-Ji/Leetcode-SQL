--1.
SELECT COALESCE(
(SELECT DISTINCT Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 1 OFFSET 1), NULL) AS SecondHighestSalary

-- COALESCE(VALUE, NULL)
-- DISTINCT to make sure the second high salary
-- LIMIT 1 OFFSET 1 to skip the frst one and get second one

--2.
SELECT MAX(Salary) AS SecondHighestSalary FROM Employee 
WHERE Salary < (SELECT MAX(Salary) FROM Employee);
