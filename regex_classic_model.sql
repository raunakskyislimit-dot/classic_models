SELECT * FROM classicmodels.customers;

# Find customers whose name starts with 'A'.
select customerName from customers where customerName regexp "^A";

# Find customers whose name ends with 'n'.
select customerName from customers where customerName regexp "n$";

# Find customers whose name contains at least one vowel.
select customerName from customers where customerName regexp "[AEIOUaeiou]";

# Find customers whose name contains only alphabets (no digits or symbols).
select customerName from customers where customerName regexp "^[A-Za-z ]+$";

# Find customers whose name has exactly 5 characters.
select customerName from customers where replace(customerName, ' ', '') regexp "^[A-Za-z]{15}$";

# Find customers whose name starts with a vowel and ends with a consonant.
select customerName from customers where customerName regexp "^[AEIOUaeiou].*[^AEIOUaeiou]$";

# Find customers whose name contains at least one digit.
select customerName from customers where customerName regexp "[0-9]";

# Find customers whose name contains only lowercase letters.
select customerName from customers where customerName regexp "^[a-z]+$";

# Find customers whose name contains no vowels at all.
select customerName from customers where customerName regexp "^[^AEIOUaeiou]+$";

# Find customers whose name has repeating consecutive characters (like oo, ss).
select customerName from customers where customerName regexp "(.)\\1";

# Find customers whose name contains exactly 2 vowels.
select customerName from customers where customerName regexp "^([^AEIOUaeiou]*[AEIOUaeiou]){2}[^AEIOUaeiou]*$";

# Find customers whose name starts with any letter between A–M.
select customerName from customers where customerName regexp "^[A-Ma-m]";

# Find customers whose name contains at least one uppercase and one lowercase letter.
select customerName from customers where REGEXP_LIKE(customerName, '[A-Z]', 'c')AND REGEXP_LIKE(customerName, '[a-z]', 'c');

# Find customers whose name contains only alphanumeric characters (no special chars).
select customerName from customers where customerName regexp "^[A-Za-z0-9 ]+$";

# Find customers whose name has length between 8 and 12 characters.
select customerName from customers where length(customerName) between 8 and 12;

# Find names with exactly 3 vowels and no repeated characters
select customerName from customers where customerName regexp '^([^AEIOUaeiou]*[AEIOUaeiou]){3}[^AEIOUaeiou]*]$' and customerName not regexp '(.)\\1';

select substring(email, instr(email, "@")+1) from employees;

select substring(email, 2), email from employees;

select substring_index(email, "@", -1) from employees;



