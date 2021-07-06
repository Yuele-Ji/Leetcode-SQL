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
SELECT MAX(Salary) AS SecondHighestSalary 
FROM Employee 
WHERE Salary < (SELECT MAX(Salary) FROM Employee);

--3.
WITH GetNTHSalary AS (SELECT Salary, DENSE_RANK()OVER(ORDER BY Salary DESC) AS rnk
                      FROM Employee)
SELECT MAX(Salary) AS GetNTHSalary
FROM GETNTHSALARY
WHERE rnk = 2
-- we coud use both distinct / max() here since we just trying to avoid duplicates. but remember to use coalesce with distinct.
