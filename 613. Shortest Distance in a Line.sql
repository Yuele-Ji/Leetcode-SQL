SELECT MIN(x1.x - x2.x) AS shortest
FROM point x1
JOIN point x2
ON x1.x > x2.x
