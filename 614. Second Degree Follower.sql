SELECT er.follower, COUNT(DISTINCT ee.follower) AS num
FROM follow er
JOIN follow ee
ON er.follower = ee.followee
GROUP BY er.follower
ORDER BY er.follower
