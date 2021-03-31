-- join the table with itself to get all possible paris
SELECT MIN(ABS(p1.x - p2. x)) AS shortest
FROM point p1
JOIN point p2
ON  p1.x != p2.x

--2. count pair once
SELECT MIN(p1.x - p2. x) AS shortest
FROM point p1
JOIN point p2
ON  p1.x > p2.x
