use classicmodels;
select * from orders;
select * from orderdetails;
select * from payments;
select * from employees;

# Find the total number of orders in the database.
select count(orderNumber) from orders;

# Find the average credit limit of all customers.
select avg(creditLimit) from customers;

# Get the maximum and minimum payment amount from the payment table.
select max(amount) max, min(amount) min from payments;

# Display all customer names in uppercase.
select upper(customerName) from customers;

# Extract the first 5 characters of each product name.
select substr(productName, 1, 5) from products;

# Find the length of each customer name.
select customerName, length(customerName) from customers;

# Show all orders with order date formatted as DD-MM-YYYY.
select *, date_format(orderDate, '%d-%m-%Y') from orders;

# Find all orders placed in the year 2004.
select * from orders where year(orderDate) = 2004;

# Find customers where state is NULL.
select * from customers where state is null;

# Replace NULL state values with 'Not Available'.
select ifnull(state, 'Not Available') from customers;

# Find the total payment amount received.
select sum(amount) from payments;

# Calculate the difference between highest and lowest payment.
select max(amount)-min(amount) from payments;

# Find the rounded average credit limit (2 decimal places).
select round(avg(creditlimit), 2) from customers;

# Concatenate first name and last name of employees.
select firstName, lastName, concat(firstName, ' ', lastName) as fullName from employees;

# Find customers whose names start with 'A'.
select customerName, substr(customerName,1,1) as initials from customers where substr(customerName,1,1) = "A";

# Replace 'Corp' with 'Corporation' in customer names.
select customerName, replace(customerName, 'Corp', 'Corporation') from customers where customerName regexp "Corp";

# Extract domain from employee email (if available / simulated column).
select email, substr(email, instr(email, '@')+1, abs(instr(email, '@')-instr(email, '.')+1)) from employees;
select email, substring_index(email, '@', -1) from employees;

# Find number of days between order date and shipped date.
select *, datediff(shippedDate, orderDate) diff from orders;

# Display orders placed in the last 30 days.
select * from orders where orderDate between date_sub(now(), interval 30 day) and now();

# Show current date and time using SQL function.
select current_date(), current_time();

# Find total payments and label it as 'Total Revenue'.
select sum(amount) TotalRevenue from payments;

# Find percentage contribution of each payment vs total (use subquery).
select customerNumber, amount, ROUND(
        (amount/(
            SELECT SUM(amount)
            FROM payments
        ))*100,
    2) AS percentage from payments;

# Get customers whose credit limit is above average credit limit.
with avg as (
select avg(creditLimit) avg_credit from customers
)
select customerName, creditLimit, (select avg(creditLimit) avg_credit from customers) from customers, avg
where creditLimit > (select avg(creditLimit) avg_credit from customers);

# Find customers whose names contain only alphabets (no numbers/special chars).
select customerName from customers 
where replace(customerName, ' ', '') regexp '^[A-Za-z]+$';

# Extract the last word from the product name.
select productName, substring_index(productName, ' ', -1)  from products;

# Reverse customer names.
select customerName, reverse(customerName) from customers;

# Find orders where shipping took more than 7 days.
select * from orders where datediff(shippedDate, orderDate) > 7;

# Extract month name from order date.
select orderDate, monthname(orderDate) from orders;

# Replace NULL in the phone column with 'No Phone' and sort the results.
select ifnull(phone, "No Phone") from customers;

# Count how many customers have NULL vs NOT NULL state values.
select count(*) from customers where state is null;
select count(*) from customers where state is not null;

select 
sum(case when state is null then 1 else 0 end) as NullStateNo,
sum(case when state is not null then 1 else 0 end) as NullStateNo
from customers;
