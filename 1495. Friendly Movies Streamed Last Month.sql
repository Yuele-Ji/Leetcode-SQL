SELECT DISTINCT c.title
FROM Content c
JOIN TVProgram t
ON c.content_id = t.content_id
WHERE c.content_type = 'Movies'
AND t.program_date LIKE '2020-06-%'
AND c.Kids_content = 'Y'
