create table student_details ( s_id int primary key, s_name varchar(50), s_age int, s_class varchar(3));

insert into student_details values (4, "Rahul", 16, "XII"), (5, "Yogesh", 16, "IX");

select s_name as StudentName, s_class as class from student_details where s_class = "X";
select * from customers;
select first_name as name, city from customers where city = "Mumbai";
SELECT first_name as name, city, gender from customers WHERE city = "lucknow" and gender = "Male";

create table user(
u_id int auto_increment primary key, 
u_name varchar(10) not null, 
u_email varchar(15) unique, 
u_pass varchar(15) not null, 
u_age int
);
select * from user;

insert into user(u_name, u_email, u_pass, u_age) 
values
("Rajeev", "rajeev@gmail.com", "wscubetech", 18), 
("Raghav", "raghav@gmail.com", "wscubetech", 19), 
("Rajveer", "rajveer@gmail.com", "wscubetech", 16), 
("Rohan", "rohan@gmail.com", "wscubetech", 19);

alter table user modify u_email varchar(50);
update user set u_email = "raman@gmail.com" where u_id = 1;
delete from user where u_id = 6;
