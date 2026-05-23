SELECT * FROM office_practice.employees;
SELECT * FROM employee_projects;
SELECT * FROM departments;
SELECT * FROM salaries;
SELECT * FROM projects;

-- Show all employees with their department names.
select e.employee_name, d.department_name from employees e left join departments d
using (department_id);

-- Show employee name, email, department name, and department location.
select employee_name, email, department_name, location
from employees e join departments d
using (department_id);

-- Show all employees and their salaries.
select employee_name,basic_salary 
from employees join salaries
using (employee_id); 

-- Show employee name, basic salary, bonus, and total salary.
select employee_name, basic_salary, bonus, basic_salary+bonus as TotalSalary
from employees join salaries
using (employee_id); 

-- Show all projects with their department names.
select project_name, department_name
from projects join departments 
using (department_id);

-- Show employee names with the projects they are assigned to.
select e.employee_name, p.project_name
from employees e
join employee_projects ep
using (employee_id)
join projects p
using (project_id);

-- Show employee name, project name, and role in the project.

select e.employee_name, p.project_name, ep.role
from employees e join employee_projects ep
using (employee_id)
join projects p
using (project_id);

-- Show employee name, department name, project name, and assigned hours.
select e.employee_name, d.department_name, p.project_name, ep.assigned_hours
from employees e 
join employee_projects ep
using (employee_id)
join projects p
using (project_id)
join departments d
on e.department_id = d.department_id;

-- Show all employees, including employees who are not assigned to any department.  
select employee_name, department_name 
from employees e 
left join departments d
using(department_id);

-- Show all employees, including employees who do not have salary records. 
select employee_name, basic_salary 
from employees e 
left join salaries s
using(employee_id); 

-- Show all employees, including employees who are not assigned to any project.  
select employee_name, project_name 
from employees e 
left join employee_projects ep
using(employee_id)
left join projects
using (project_id); 

-- Show all departments, including departments that have no employees. 
select department_name, employee_name from
departments d 
left join 
employees e
using (department_id);

-- Show all projects, including projects where no employee is assigned.  
select project_name, employee_id from
projects p 
left join 
employee_projects ep
using (project_id);

-- Show employee name, department name, salary month, basic salary, and bonus.
select e.employee_name, d.department_name, s.salary_month, s.basic_salary, s.bonus
from employees e
join departments d
using (department_id)
join salaries s 
on e.employee_id = s.employee_id;

-- Show employee name, department name, project name, role, and project status.  
select e.employee_name, d.department_name, p.project_name, ep.role, p.status
from employees e
join departments d
using (department_id)
join employee_projects ep
using (employee_id)
join projects p 
using (project_id);

-- Show all employees working on projects handled by the IT department. 
SELECT 
    e.employee_name,
    d.department_name,
    p.project_name,
    ep.role,
    p.status
FROM employees e
JOIN employee_projects ep
USING (employee_id)
JOIN projects p
USING (project_id)
JOIN departments d
ON p.department_id = d.department_id
WHERE d.department_name = 'IT';

-- Show all employees working on active projects.
select e.employee_name, d.department_name, p.project_name, ep.role, p.status
from employees e
join departments d
using (department_id)
join employee_projects ep
using (employee_id)
join projects p 
using (project_id)
where p.status = "Active";

-- Show employees who are working on projects outside their own department.
SELECT 
    e.employee_name,
    ed.department_name AS employee_department,
    p.project_name,
    pd.department_name AS project_department
FROM employees e
JOIN departments ed
ON e.department_id = ed.department_id
JOIN employee_projects ep
ON e.employee_id = ep.employee_id
JOIN projects p
ON ep.project_id = p.project_id
JOIN departments pd
ON p.department_id = pd.department_id
WHERE e.department_id <> p.department_id;

-- Show department-wise total number of employees. 
select department_name, count(department_name)
from departments d
join employees e
using (department_id)
group by department_name; 

-- Show department-wise total salary paid, including basic salary and bonus.
select department_id, count(department_id), sum(basic_salary + bonus)
from employees e join departments d
using (department_id)
join salaries s
on e.employee_id = s.employee_id
group by department_id;

