SELECT student_id, course_id, grade
FROM (
SELECT student_id, course_id, grade, ROW_NUMBER()OVER(PARTITION BY student_id ORDER BY grade DESC, course_id) AS RNK
FROM Enrollments) A
WHERE RNK = 1
