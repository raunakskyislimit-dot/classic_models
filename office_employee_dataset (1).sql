CREATE DATABASE IF NOT EXISTS office_practice;
USE office_practice;

DROP TABLE IF EXISTS employee_projects;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50),
    budget INT
);

INSERT INTO departments VALUES
(1, 'HR', 'Jaipur', 500000),
(2, 'Marketing', 'Delhi', 800000),
(3, 'IT', 'Bangalore', 1200000),
(4, 'Finance', 'Mumbai', 900000),
(5, 'Sales', 'Pune', 700000);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    email VARCHAR(100),
    department_id INT,
    joining_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees VALUES
(101, 'Amit Sharma', 'amit@office.com', 3, '2022-01-10'),
(102, 'Priya Mehta', 'priya@office.com', 2, '2021-03-15'),
(103, 'Rahul Verma', 'rahul@office.com', 1, '2023-06-01'),
(104, 'Sneha Kapoor', 'sneha@office.com', 4, '2020-11-20'),
(105, 'Vikas Jain', 'vikas@office.com', 5, '2022-07-12'),
(106, 'Neha Singh', 'neha@office.com', 3, '2021-09-05'),
(107, 'Karan Malhotra', 'karan@office.com', 2, '2023-02-18'),
(108, 'Anjali Gupta', 'anjali@office.com', 1, '2020-05-25'),
(109, 'Rohit Yadav', 'rohit@office.com', 5, '2021-12-01'),
(110, 'Meera Nair', 'meera@office.com', 4, '2022-10-10'),
(111, 'Suresh Khan', 'suresh@office.com', 3, '2023-08-01'),
(112, 'Pooja Bansal', 'pooja@office.com', NULL, '2024-01-15');

CREATE TABLE salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    basic_salary INT,
    bonus INT,
    salary_month VARCHAR(20),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO salaries VALUES
(1, 101, 65000, 5000, 'January'),
(2, 102, 55000, 4000, 'January'),
(3, 103, 42000, 3000, 'January'),
(4, 104, 70000, 6000, 'January'),
(5, 105, 48000, 3500, 'January'),
(6, 106, 75000, 7000, 'January'),
(7, 107, 52000, 4500, 'January'),
(8, 108, 40000, 2500, 'January'),
(9, 109, 50000, 3000, 'January'),
(10, 110, 68000, 5500, 'January'),
(11, 111, 62000, 4000, 'January');

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT,
    start_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO projects VALUES
(201, 'Website Redesign', 3, '2023-01-10', 'Completed'),
(202, 'Social Media Campaign', 2, '2023-02-15', 'Active'),
(203, 'Employee Hiring Drive', 1, '2023-03-01', 'Active'),
(204, 'Annual Budget Planning', 4, '2023-04-05', 'Completed'),
(205, 'Sales CRM Setup', 5, '2023-05-20', 'Active'),
(206, 'Cybersecurity Audit', 3, '2023-06-12', 'Active'),
(207, 'Brand Awareness Campaign', 2, '2023-07-01', 'Completed'),
(208, 'Payroll Automation', 4, '2023-08-18', 'Active');

CREATE TABLE employee_projects (
    emp_project_id INT PRIMARY KEY,
    employee_id INT,
    project_id INT,
    role VARCHAR(50),
    assigned_hours INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO employee_projects VALUES
(1, 101, 201, 'Developer', 120),
(2, 106, 201, 'Backend Developer', 100),
(3, 102, 202, 'Campaign Manager', 80),
(4, 107, 202, 'Content Strategist', 60),
(5, 103, 203, 'HR Coordinator', 50),
(6, 108, 203, 'Recruiter', 70),
(7, 104, 204, 'Finance Analyst', 90),
(8, 110, 204, 'Budget Planner', 85),
(9, 105, 205, 'Sales Executive', 75),
(10, 109, 205, 'CRM Specialist', 95),
(11, 111, 206, 'Security Analyst', 110),
(12, 101, 206, 'System Tester', 60),
(13, 102, 207, 'Marketing Lead', 65),
(14, 110, 208, 'Finance Lead', 100);

-- Practice Join Queries

-- 1. Show employee names with their department names.
SELECT e.employee_name, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

-- 2. Show all employees, even those without departments.
SELECT e.employee_name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

-- 3. Show employee name, salary, bonus, and total salary.
SELECT e.employee_name, s.basic_salary, s.bonus,
       (s.basic_salary + s.bonus) AS total_salary
FROM employees e
JOIN salaries s
ON e.employee_id = s.employee_id;

-- 4. Show employees with their project names and roles.
SELECT e.employee_name, p.project_name, ep.role
FROM employees e
JOIN employee_projects ep
ON e.employee_id = ep.employee_id
JOIN projects p
ON ep.project_id = p.project_id;

-- 5. Show department-wise number of employees.
SELECT d.department_name, COUNT(e.employee_id) AS total_employees
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 6. Show project name with department name.
SELECT p.project_name, d.department_name, p.status
FROM projects p
JOIN departments d
ON p.department_id = d.department_id;

-- 7. Show employees who are not assigned to any project.
SELECT e.employee_name
FROM employees e
LEFT JOIN employee_projects ep
ON e.employee_id = ep.employee_id
WHERE ep.project_id IS NULL;

-- 8. Show department-wise total salary.
SELECT d.department_name, SUM(s.basic_salary + s.bonus) AS total_salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
JOIN salaries s
ON e.employee_id = s.employee_id
GROUP BY d.department_name;
