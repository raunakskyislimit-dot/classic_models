SELECT * FROM classicmodels.orders;
SELECT * 
FROM products
ORDER BY buyPrice desc
LIMIT 5;

SELECT *
FROM orders
WHERE status = "Shipped"
ORDER BY shippedDate DESC;

SELECT * FROM customers WHERE customerName LIKE "A%" ORDER BY country;

SELECT * 
FROM products
ORDER BY buyPrice DESC
LIMIT 5, 1000;

SELECT *
FROM employees
ORDER BY jobTitle, lastName;

SELECT *
FROM customers
WHERE country IN ("USA", "France")
ORDER BY creditLimit DESC;

SELECT *
FROM orders
WHERE status <> "Shipped";

SELECT * 
FROM employees
WHERE jobTitle LIKE "%Manager%";

SELECT customerNumber as no, customerName as name, IFNULL(state,"Unknown") as address
FROM customers;

SELECT * 
FROM customers
WHERE customerName NOT LIKE "____________";


SELECT 
    *
FROM
    customers;