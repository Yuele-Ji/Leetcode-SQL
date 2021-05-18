SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product)

--product_key in CUSTOMER is a foreign key to PRODUCT, all 'product_key' shown in Customer table must exist in Product table
--product_key is the primary key column for PRODUCT so each id is unique, we don't need to use distinct
