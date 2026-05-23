select * from departments;
select * from employees;
select * from employee_projects;
select * from projects;
select * from salaries;

-- Show all employees with their department names.
select e.employee_name, d.department_name
from employees e
left join departments d
on e.department_id = d.department_id
where e.department_id is null; 


-- Show employee name, email, department name, and department location.
select e.employee_name, e.email, d.department_name, d.location
from employees e
left join departments d
on e.department_id = d.department_id;

-- Show all employees and their salaries.
select e.employee_name, s.basic_salary
from employees e
join salaries s
using (employee_id);

-- Show employee name, basic salary, bonus, and total salary.
select e.employee_name, s.basic_salary, s.bonus, (s.basic_salary+s.bonus) as totalSalary
from employees e
join salaries s
using (employee_id);


-- Show all projects with their department names.
select p.project_name, d.department_name
from projects p
join departments d
using (department_id);


-- Show employee names with the projects they are assigned to.
select e.employee_name, p.project_name
from employees e
left join employee_projects ep
using (employee_id)
left join projects p
using (project_id);


-- Show employee name, project name, and role in the project.
select e.employee_name, p.project_name, ep.role
from employees e
left join employee_projects ep
using (employee_id)
left join projects p
using (project_id);


-- Show employee name, department name, project name, and assigned hours.
select e.employee_name, d.department_name, p.project_name, ep.assigned_hours
from employees e
join 
departments d
using (department_id)
join
employee_projects ep
on e.employee_id = ep.employee_id
join
projects p
on ep.project_id = p.project_id;



-- Show all employees, including employees who are not assigned to any department. 

-- Show only employees who are not assigned to any department.  


-- Show all employees, including employees who do not have salary records. 


-- Show all employees, including employees who are not assigned to any project.  
 
insert into departments (department_id, department_name, location, budget) values (7, "Medical", "Jaipur", 700000);
delete from departments where department_id = 7;

-- Show all departments, including departments that have no employees. 


-- Show all projects, including projects where no employee is assigned.  


-- Show employee name, department name, salary month, basic salary, and bonus.


-- Show employee name, department name, project name, role, and project status.  


-- Show all employees working on projects handled by the IT department. 


-- Show all employees working on active projects.


-- Show employees who are working on projects outside their own department.


-- Show department-wise total number of employees. 
select d.department_name, count(d.department_name)
from departments d
join employees e
using (department_id)
group by d.department_name;


-- Show department-wise total salary paid, including basic salary and bonus.


