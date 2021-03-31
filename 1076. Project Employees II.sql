--1.
SELECT project_id
FROM Project
GROUP BY project_id
HAVING COUNT(employee_id) = (SELECT COUNT(employee_id) AS num
                             FROM Project
                             GROUP BY project_id
                            ORDER BY num DESC
                            LIMIT 1)
                            
--2. 
SELECT project_id
FROM(
SELECT project_id, RANK()OVER(ORDER BY COUNT(employee_id) DESC) AS rnk
FROM Project
GROUP BY project_id) AS tmp
WHERE rnk = 1
