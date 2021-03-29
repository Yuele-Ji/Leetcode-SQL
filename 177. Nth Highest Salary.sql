--1. LIMIT..OFFSET..
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M=N-1;
  RETURN (
   SELECT COALESCE((SELECT DISTINCT Salary 
   FROM Employee 
   ORDER BY Salary DESC 
   LIMIT 1 OFFSET M),NULL)
  );
END
-- LIMIT cannot recognize expressions with arithmetic operators. You have to do the math before LIMIT

--2. WINDOW FUNCTION
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      SELECT COALESCE(TMP.Salary,NULL)
      FROM( SELECT DISTINCT Salary, DENSE_RANK()OVER(ORDER BY Salary DESC) AS RK
            FROM Employee) TMP
      WHERE TMP.RK = N     
  );
END
