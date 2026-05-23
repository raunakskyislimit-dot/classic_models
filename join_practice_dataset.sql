-- Basic SQL JOIN Practice Dataset
-- Database: join_practice
-- Compatible with MySQL

DROP DATABASE IF EXISTS join_practice;
CREATE DATABASE join_practice;
USE join_practice;

-- =========================
-- Table 1: departments
-- =========================
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'Sales'),
(6, 'Operations');

-- =========================
-- Table 2: employees
-- =========================
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    manager_id INT,
    city VARCHAR(50),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees (employee_id, employee_name, department_id, manager_id, city) VALUES
(101, 'Amit', 2, NULL, 'Jaipur'),
(102, 'Priya', 2, 101, 'Jodhpur'),
(103, 'Rahul', 3, 101, 'Delhi'),
(104, 'Sneha', 1, 101, NULL),
(105, 'Vikram', NULL, 101, 'Mumbai'),
(106, 'Neha', 4, NULL, 'Jaipur'),
(107, 'Karan', 5, 106, NULL),
(108, 'Riya', NULL, NULL, 'Pune');

-- =========================
-- Table 3: projects
-- =========================
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    department_id INT,
    budget INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO projects (project_id, project_name, department_id, budget) VALUES
(201, 'Website Redesign', 2, 50000),
(202, 'SEO Campaign', 3, 30000),
(203, 'Payroll System', 4, NULL),
(204, 'Recruitment Drive', 1, 20000),
(205, 'Sales CRM', 5, 45000),
(206, 'Automation Setup', NULL, 60000),
(207, 'Inventory App', 6, NULL);

-- =========================
-- Table 4: employee_projects
-- =========================
CREATE TABLE employee_projects (
    employee_id INT,
    project_id INT,
    assigned_hours INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO employee_projects (employee_id, project_id, assigned_hours) VALUES
(101, 201, 20),
(102, 201, 15),
(103, 202, 25),
(104, 204, NULL),
(106, 203, 30),
(107, 205, 18),
(101, 203, 10);

-- =========================
-- Practice Queries
-- =========================

-- 1. INNER JOIN: Employees with their departments
SELECT 
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

-- 2. LEFT JOIN: All employees with department names
SELECT 
    e.employee_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

-- 3. RIGHT JOIN: All departments with employees
SELECT 
    e.employee_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

-- 4. FULL JOIN simulation in MySQL using LEFT JOIN + UNION + RIGHT JOIN
SELECT 
    e.employee_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id

UNION

SELECT 
    e.employee_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

-- 5. CROSS JOIN: All employee-department combinations
SELECT 
    e.employee_name,
    d.department_name
FROM employees e
CROSS JOIN departments d;

-- 6. SELF JOIN: Employee-manager relationship
SELECT 
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

-- 7. Employee project details
SELECT 
    e.employee_name,
    p.project_name,
    ep.assigned_hours
FROM employees e
JOIN employee_projects ep
ON e.employee_id = ep.employee_id
JOIN projects p
ON ep.project_id = p.project_id;

-- 8. All employees with project details, including employees with no project
SELECT 
    e.employee_name,
    p.project_name,
    ep.assigned_hours
FROM employees e
LEFT JOIN employee_projects ep
ON e.employee_id = ep.employee_id
LEFT JOIN projects p
ON ep.project_id = p.project_id;

-- 9. All projects with assigned employees, including projects with no employee
SELECT 
    p.project_name,
    e.employee_name,
    ep.assigned_hours
FROM projects p
LEFT JOIN employee_projects ep
ON p.project_id = ep.project_id
LEFT JOIN employees e
ON ep.employee_id = e.employee_id;
