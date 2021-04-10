SELECT name
FROM salesperson
WHERE sales_id NOT IN(SELECT o.sales_id
                      FROM orders o
                      JOIN company c
                      ON c.com_id = o.com_id
                      WHERE c.name = 'RED')
                      
-- You need to query who sold to company 'RED' first, then output the sales person who is not in the first query result.
