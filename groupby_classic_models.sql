use classicmodels;

select * from customers;
select * from orderdetails;
select * from orders;	
select * from payments;
select * from offices;
select * from employees;
select * from productlines;
select * from products;

select country, count(*) from customers 
group by country;

select customerNumber, count(*) total_customers from orders
group by customerNumber;

select country, round(avg(creditlimit), 2) avg from customers
group by country;

select customerNumber, max(amount) maxAmount, min(amount) minAmount, avg(amount) avg, sum(amount) total from payments
group by customerNumber;

select productCode, sum(quantityOrdered) qty from orderDetails
group by productCode;

select officeCode, count(*) total_employees from employees
group by officeCode;

select customerNumber, sum(amount) total from payments
group by customerNumber;

select productCode, avg(quantityOrdered) avg from orderDetails
group by productCode;

select productline, count(productLine) total from products
group by productline;

select productline, max(buyPrice) highest from products
group by productline;

select status, count(status) total from orders
group by status;

SELECT
    SUM(CASE WHEN status = 'Shipped' THEN 1 ELSE 0 END) AS shipped_orders,
    
    SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    
    SUM(CASE WHEN status = 'On Hold' THEN 1 ELSE 0 END) AS onhold_orders

FROM orders;

SELECT 
    CASE
        WHEN status = 'Shipped' THEN 'Completed'
        ELSE 'Pending'
    END AS order_category,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_category;

select country, state, city from customers 
group by country, state, city 
order by country;

select distinct country from customers;

select country, count(*) from customers 
group by country;

--
-- Practise
--

-- Find total customers in each country.
select country, count(*) from customers group by country;

-- Find total orders for each customer.
select customerNumber, count(*) from orders group by customerNumber;

-- Find the average credit limit by country.
select country, avg(creditLimit) avg_credlimit from customers group by country;

-- Find the maximum payment amount made by each customer.
select customerNumber, max(amount) from payments group by customerNumber;

-- Find total quantity ordered for each product.
select productCode, sum(quantityOrdered) from orderDetails group by productCode;

-- Find the number of employees in each office.
select officeCode, count(*) from employees group by officeCode;

-- Find total payment received from each customer.
select customerNumber, sum(amount) from payments group by customerNumber;

-- Find the average quantity ordered for each product.
select productCode, avg(quantityOrdered) from orderDetails group by productCode;

-- Find the number of products in each product line.
select productLine, count(*) from products group by productLine; 

-- Find the highest product price in each product line.
select productLine, max(buyPrice) from products group by productLine;

-- Show countries having more than 5 customers.
select country, count(*) from customers group by country having count(*) > 5;

-- Show customers whose total payments exceed 100000.
select customerNumber, sum(amount) from payments group by customerNumber having sum(amount) > 100000;

-- Show product lines having more than 10 products.
select productLine, count(*) from products group by productLine having count(*) > 10;

-- Show products whose average ordered quantity is greater than 30.
select productCode, avg(quantityOrdered) avgQty from orderDetails group by productCode having avgQty > 30;

-- Show offices having at least 3 employees.
select officeCode, count(*) count from employees group by officeCode having count >=3;


-- Show customer names with:
-- "High" if creditLimit > 100000
-- "Medium" if creditLimit between 50000 and 100000
-- "Low" otherwise

select customerName, creditLimit,
case 
when creditLimit > 100000 then 'High'
when creditLimit between 50000 and 100000 then 'Medium'
else 'Low'
end as creditCat
from customers;


-- Show orders categorized as:
-- "Completed" for Shipped
-- "Pending" for all others

select *, case 
when status = "Shipped" then 'Completed'
else 'Pending' 
end as OrderCat
from orders;

-- Show products categorized by price:
-- Expensive (>100)
-- Moderate (50–100)
-- Cheap (<50)

select productName, case 
when buyPrice > 100 then 'Expensive'
when buyPrice between 50 and 100 then 'Moderate'
else 'Cheap'
end as priceCat
from products;

-- Show employees categorized by office:
-- "Head Office" for officeCode = 1
-- "Branch" otherwise

select firstName, case
when officeCode = 1 then 'Head Office'
else 'Branch'
end as officeType 
from employees;

-- Show customers categorized by country:
-- "Domestic" if USA
-- "International" otherwise
select customerName, case 
when country = 'USA' then 'Domestic'
else 'Interntional' end 
as countryCat
from customers;


-- Count how many customers belong to each credit category:
-- High
-- Medium
-- Low
select 
sum(case when creditLimit > 100000 then 1 else 0 end) as HighCount,
sum(case when creditLimit >= 50000 and creditLimit <= 100000 then 1 else 0 end) as MediumCount,
sum(case when creditLimit < 50000 then 1 else 0 end) as LowCount
from customers;

-- Find number of products in each price category:
-- Expensive
-- Moderate
-- Cheap


-- Show total sales grouped by customer category:
-- High Credit
-- Low Credit

SELECT
CASE
    WHEN c.creditLimit > 100000 THEN 'High Credit'
    ELSE 'Low Credit'
END AS customerCategory,

SUM(p.amount) AS totalSales

FROM customers c
JOIN payments p
ON c.customerNumber = p.customerNumber

GROUP BY customerCategory;

-- Find total ordered quantity for each order status.

-- Transpose order statuses into columns:
-- shipped_orders
-- cancelled_orders
-- resolved_orders

SELECT
SUM(CASE WHEN status = 'Shipped' THEN 1 ELSE 0 END) AS shipped_orders,

SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,

SUM(CASE WHEN status = 'Resolved' THEN 1 ELSE 0 END) AS resolved_orders

FROM orders;

-- Transpose payments into columns for customers:
-- customer_103
-- customer_112
-- customer_114

SELECT
SUM(CASE WHEN customerNumber = 103 THEN amount ELSE 0 END) AS customer_103,

SUM(CASE WHEN customerNumber = 112 THEN amount ELSE 0 END) AS customer_112,

SUM(CASE WHEN customerNumber = 114 THEN amount ELSE 0 END) AS customer_114

FROM payments;

-- Count employees office-wise using CASE transpose.
-- Expected columns:
-- office_1
-- office_2
-- office_3
SELECT
SUM(CASE WHEN officeCode = 1 THEN 1 ELSE 0 END) AS office_1,

SUM(CASE WHEN officeCode = 2 THEN 1 ELSE 0 END) AS office_2,

SUM(CASE WHEN officeCode = 3 THEN 1 ELSE 0 END) AS office_3

FROM employees;

-- Create monthly sales columns:
-- jan_sales
-- feb_sales
-- mar_sales
-- using paymentDate.

-- Create a pivot table showing total products for:
-- Classic Cars
-- Motorcycles
-- Planes
-- using CASE + SUM().

-- Find countries where average credit limit is greater than overall average credit limit.
-- Find top 3 customers by total payment amount.
SELECT 
    c.customerNumber,
    c.customerName,
    SUM(p.amount) AS total_payment_amount
FROM customers c
JOIN payments p
ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber, c.customerName
ORDER BY total_payment_amount DESC
LIMIT 3;

-- Find product lines whose total stock value is highest.
-- (Hint: quantityInStock * buyPrice).

SELECT
productLine,
SUM(quantityInStock * buyPrice) AS stockValue
FROM products
GROUP BY productLine
ORDER BY stockValue DESC
limit 1;

-- Show percentage contribution of each customer to total payments.
SELECT
customerNumber,
SUM(amount) AS customerTotal,

ROUND(
    SUM(amount) * 100 /
    (SELECT SUM(amount) FROM payments),
2) AS percentageContribution

FROM payments
GROUP BY customerNumber;

-- Find customers having both:
-- more than 5 orders
-- total payment > 50000

SELECT
c.customerName,
COUNT(DISTINCT o.orderNumber) AS totalOrders,
SUM(p.amount) AS totalPayment

FROM customers c

JOIN orders o
using (customerNumber)

JOIN payments p
using (customerNumber)

GROUP BY c.customerName
HAVING COUNT(DISTINCT o.orderNumber) > 5
AND SUM(p.amount) > 50000;




