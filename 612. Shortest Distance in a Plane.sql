SELECT MIN(ROUND(SQRT(POWER((p1.x-p2.x),2) + POWER((p1.y-p2.y),2)),2)) AS shortest
FROM point_2d p1
JOIN point_2d p2
ON CONCAT(p1.x,p1.y) != CONCAT(p2.x,p2.y)
-- ON a.x != b.x OR a.y != b.y

--why or not and?
-- we are trying to avoid calculating the distance of a point with itself here.
-- if we use and here, we need to satisfy both conditions, but we could have x/y to be the same. we only need one condition to make sure they are not itself.
-- for example, we could miss (1,2) (1,3) if we need x1 != x2 AND y1!=y2.
