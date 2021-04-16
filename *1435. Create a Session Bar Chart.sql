SELECT '[0-5>' AS BIN, SUM((duration / 60) < 5) AS TOTAL FROM Sessions
UNION
SELECT '[5-10>' AS BIN, SUM((duration / 60) >= 5 AND (duration / 60) < 10) AS TOTAL FROM Sessions
UNION
SELECT '[10-15>' AS BIN, SUM((duration / 60) >= 10 AND (duration / 60) < 15) AS TOTAL FROM Sessions
UNION
SELECT '15 or more' AS BIN, SUM((duration / 60) >= 15)AS TOTAL FROM Sessions

-- we can't use CASE WHEN here since there is no value matching the '[10-15>' so a bin would missing
