--1. NO TIE
SELECT c.Name
FROM Candidate c
JOIN Vote v
ON c.id = v.CandidateId
GROUP BY c.id
ORDER BY COUNT(v.id) DESC
LIMIT 1

--2. MULTIPLE WINNER
SELECT c.Name
FROM Candidate c
JOIN
(SELECT CandidateId, RANK()OVER(ORDER BY COUNT(CandidateId) DESC) AS RNK
    FROM Vote
    GROUP BY CandidateId) v
ON c.id = v.CandidateId
WHERE RNK = 1
