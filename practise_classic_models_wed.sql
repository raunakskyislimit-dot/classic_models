select * from customers where customerName like "a%" or 
customerName like "i%" or 
customerName like "e%" or
customerName like "o%" or 
customerName like "u%";
select * from orders where orderDate > "2004-01-01";
select * from customers 
where (
customerName like "%a" or 
customerName like "%i" or 
customerName like "%e" or
customerName like "%o" or 
customerName like "%u") and (
customerName like "a%" or 
customerName like "i%" or 
customerName like "e%" or
customerName like "o%" or 
customerName like "u%"
);

select * from products where buyPrice < 100; 

select customerName as name from customers order by customerName;

SELECT * FROM products order by buyPrice desc limit 5;

SELECT orderNumber, shippedDate, status, IFNULL(comments, "No Comments") FROM orders where status = "Shipped" order by shippedDate desc;

SELECT * FROM customers WHERE city LIKE "NEW%" AND city NOT LIKE "%k";

SELECT customerName, IFNULL(addressLine2, "No Address") as address FROM customers WHERE LENGTH(customerName) > 10 AND LENGTH(customerName) < 12; 

SELECT * FROM products where buyPrice like '%.99';

SELECT customerName 
FROM customers 
WHERE customerName NOT LIKE "%a%" AND
customerName NOT LIKE "%e%" AND
customerName NOT LIKE "%i%" AND
customerName NOT LIKE "%o%" AND
customerName NOT LIKE "%u%";

SELECT customerName
FROM customers
WHERE customerName LIKE "%a%a%a%" AND
customerName NOT LIKE "%a%a%a%a%";

SELECT customerName
FROM customers
WHERE LENGTH(customerName) - LENGTH(REPLACE(customerName, 'a', '')) < 1;

SELECT customerName
FROM customers
WHERE customerName LIKE "%aa%";	

SELECT customerName, phone
from customers 
WHERE phone NOT LIKE "%0%";

SELECT * 
FROM products
ORDER BY buyPrice DESC
LIMIT 10;

SELECT customerName 
FROM customers 
WHERE (customerName LIKE "a%" OR
customerName  LIKE "e%" OR
customerName  LIKE "i%" OR
customerName  LIKE "o%" OR
customerName  LIKE "u%") AND
(customerName LIKE "%a" OR
customerName  LIKE "%e" OR
customerName  LIKE "%i" OR
customerName  LIKE "%o" OR
customerName  LIKE "%u");

SELECT *
FROM customers
where customerName LIKE "____________";

SELECT *
FROM customers
WHERE state IS NOT NULL OR 
postalCode IS NOT NULL;

SELECT *
FROM orders
WHERE shippedDate IS NULL;

SELECT * 
FROM customers
WHERE state IS NULL AND country = "France";

SELECT customerName, creditLimit as CreditLimit
FROM customers;

SELECT *
FROM employees
WHERE reportsTo IS NULL;

SELECT *
FROM customers 
WHERE customerName LIKE "%Inc";