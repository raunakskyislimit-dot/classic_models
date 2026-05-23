-- Show customer names with:
-- "High" if creditLimit > 100000
-- "Medium" if creditLimit between 50000 and 100000
-- "Low" otherwise

select customerName, case 
when creditLimit > 100000 then 'High'
when creditLimit between 50000 and 100000 then 'Med'
else 'Low'
end
as CreditCat
from customers;



-- Show orders categorized as:
-- "Completed" for Shipped
-- "Pending" for all others

select orderNumber, case
when status = "Shipped" then "Completed"
else "Pending"
end
as status_cat
from orders;


-- Show products categorized by price:
-- Expensive (>100)
-- Moderate (50–100)
-- Cheap (<50)



-- Show employees categorized by office:
-- "Head Office" for officeCode = 1
-- "Branch" otherwise



-- Show customers categorized by country:
-- "Domestic" if USA
-- "International" otherwise



-- Count how many customers belong to each credit category:
-- High
-- Medium
-- Low

select customerName, creditLimit from customers;

select 
sum(case when creditLimit >= 100000 then 1 else 0 end) as High,
sum(case when creditLimit between 50000 and 100000 then 1 else 0 end) as Med,
sum(case when creditLimit < 50000 then 1 else 0 end) as Low

from customers;



-- Find number of products in each price category:
-- Expensive
-- Moderate
-- Cheap

select * from products;

select 
sum(case when buyPrice > 100 then 1 else 0 end) as expensive,
sum(case when buyPrice between 50 and 100 then 1 else 0 end) as moderate,
sum(case when buyPrice < 50 then 1 else 0 end) as cheap
from products;





-- Transpose order statuses into columns:
-- shipped_orders
-- cancelled_orders
-- resolved_orders

select distinct status from orders;


-- Transpose payments into columns for customers:
-- customer_103
-- customer_112
-- customer_114

select * from payments;


-- Count employees office-wise using CASE transpose.
-- Expected columns:
-- office_1
-- office_2
-- office_3


-- Create monthly sales columns:
-- jan_sales
-- feb_sales
-- mar_sales
-- using paymentDate.


	select Sum(amount) from payments
	where month(paymentDate) = 1;

select
sum(case when month(paymentDate) = 1 and year(paymentDate) = 2004 then amount else 0 end) as jan_sales,
sum(case when month(paymentDate) = 2 and year(paymentDate) = 2004 then amount else 0 end) as feb_sales
from payments;


