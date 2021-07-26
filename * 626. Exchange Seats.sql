SELECT CASE WHEN MOD(id,2) = 0 THEN id - 1
            WHEN MOD(id,2) != 0  AND id < (SELECT MAX(id) FROM seat) THEN id + 1
            ELSE id                       
       END AS id, student
FROM seat
ORDER BY id

-- id < (SELECT MAX(id) FROM seat) take care of the edge case
-- if the fisrt condition is meet then ..., if first condition is not meet and second is meet then ...
