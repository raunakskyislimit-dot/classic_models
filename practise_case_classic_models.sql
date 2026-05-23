-- Show customer names with:
-- "High" if creditLimit > 100000
-- "Medium" if creditLimit between 50000 and 100000
-- "Low" otherwise

select case 
when creditLimit > 100000 then 'High'
when creditLimit between 50000 and 100000 then 'Medium'
else 'Low' end
as creditLimitCat,
count(creditLimit)
from customers
group by creditLimitCat;


-- Show orders categorized as:
-- "Completed" for Shipped
-- "Pending" for all others

select orderNumber, case 
when status  = "Shipped" then 'Completed'
else 'Pending'
end 
as type
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

select 
sum(case when creditLimit > 100000 then 1 end) as High,
sum(case when creditLimit between 50000 and 100000 then 1 end) as Med,
sum(case when creditLimit < 50000 then 1 end) as Low

from customers;



-- Find number of products in each price category:
-- Expensive
-- Moderate
-- Cheap



-- Transpose order statuses into columns:
-- shipped_orders
-- cancelled_orders
-- resolved_orders

select distinct status from orders;

select 
sum(case when status = "Shipped" then 1 else 0 end) as shipped_orders,
sum(case when status = "Cancelled" then 1 else 0 end) as cancelled_orders,
sum(case when status = "Resolved" then 1 else 0 end) as resolved_orders,
sum(case when status = "On Hold" then 1 else 0 end) as hold_orders
from orders;


-- Transpose payments into columns for customers:
-- customer_103
-- customer_112
-- customer_114


-- Count employees office-wise using CASE transpose.
-- Expected columns:
-- office_1
-- office_2
-- office_3
select 
sum(case when officeCode = 1 then 1 else 0 end) as office_1,
sum(case when officeCode = 2 then 1 else 0 end) as office_2,
sum(case when officeCode = 3 then 1 else 0 end) as office_3,
sum(case when officeCode = 4 then 1 else 0 end) as office_4,
sum(case when officeCode = 5 then 1 else 0 end) as office_5,
sum(case when officeCode = 6 then 1 else 0 end) as office_6,
sum(case when officeCode = 7 then 1 else 0 end) as office_7
from employees;



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
-- Find product lines whose total stock value is highest.
-- (Hint: quantityInStock * buyPrice).


-- Show percentage contribution of each customer to total payments.


-- Find customers having both:
-- more than 5 orders
-- total payment > 50000
