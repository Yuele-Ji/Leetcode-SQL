--1. coalesce()
SELECT d.dept_name, COALESCE(COUNT(s.student_id),0) AS student_number
FROM department d
LEFT JOIN student s
ON s.dept_id = d. dept_id
GROUP BY d.dept_name
ORDER BY 2 DESC, 1

--2.sum treat null as 0
SELECT dept_name, SUM(CASE WHEN student_id THEN 1 ELSE 0 END) AS student_number
FROM department d
LEFT JOIN student s
ON s.dept_id = d. dept_id
GROUP BY dept_name
ORDER BY 2 DESC, 1
