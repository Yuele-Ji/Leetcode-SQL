-- last year in the question means one year away from today, which is '2018-06-23' and '2019-06-23'


SELECT b.book_id, b.name
FROM Books b
LEFT JOIN Orders o
ON b.book_id = o.book_id AND o.dispatch_date between '2018-06-23' and '2019-06-23'
WHERE DATEDIFF('2019-06-23', available_from) > 30
GROUP BY 1,2
HAVING COALESCE(SUM(o.quantity),0) < 10
