SELECT MIN(ROUND(SQRT(POWER((p1.x-p2.x),2) + POWER((p1.y-p2.y),2)),2)) AS shortest
FROM point_2d p1
JOIN point_2d p2
ON CONCAT(p1.x,p1.y) > CONCAT(p2.x,p2.y)
