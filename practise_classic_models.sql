SELECT * FROM CUSTOMERS;
select count(customerName) as noOfCustomers, 
state from customers 
group by state having noOfCustomers > 5;

select count(customerName) as noOfCustomers, 
state from customers 
group by state order by state desc;

select
customerName as name, city, state 
from customers 
where city = "nyc" or state = "CA";

select creditLimit, customerName as name from customers order by creditLimit desc;

select * from employees;
select * from offices;
select * from orderdetails;
select * from orders;
select * from products;

select customerName, country as Name from customers where country = "USA";
select * from orders where orderDate > '2004-01-01';
select * from products where buyPrice > 100;
select * from customers order by customerName desc;
select * from products order by buyPrice desc limit 5;	

select * from orders where status = "Shipped" order by shippedDate desc;
select * from customers where customerName like 'a%' order by country;
select * from products order by buyPrice desc limit 5, 10;
select * from employees order by jobTitle asc, lastName asc;
select customerName as name, country, creditLimit from customers where country in ("USA" ,"France") order by creditLimit desc;  

select * from orders order by orderDate desc limit 10;
SELECT *
FROM customers
WHERE contactFirstName LIKE '_____';

SELECT productName AS name, buyPrice AS price FROM products ORDER BY price DESC LIMIT 1, 1;