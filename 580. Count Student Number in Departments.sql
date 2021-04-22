SELECT d.dept_name, COALESCE(COUNT(s.student_id),0) AS student_number
FROM department d
LEFT JOIN student s
ON s.dept_id = d. dept_id
GROUP BY d.dept_name
ORDER BY 2 DESC, 1