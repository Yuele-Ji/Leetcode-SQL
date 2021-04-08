--1. WHERE...NOT IN
DELETE FROM Person 
WHERE Id NOT IN (SELECT tmp.Id FROM (SELECT MIN(Id) AS Id FROM Person GROUP BY Email) AS tmp)

-- group by email then select the min id
-- then delete rows that not belongs to that subquery

--2.SELF JOIN
DELETE P1
FROM PERSON P1, PERSON P2
WHERE P1.Email=P2.Email AND P1.Id>P2.Id

/* Delete like Select evaluates for every record.
When we say Delete P1 we are deleting each record satifying our where condition not the entire table if you got confused with the nomeclature.
A property of a duplicate record is having same value but different id's/
We take two copies of the table and conpare each record in one table with the other and check if they have same email but different ids.
We then delete if the repeated records with greater ID values.*/

