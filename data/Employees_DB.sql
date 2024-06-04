-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- SQL_Challenge
DROP TABLE departments,
			dept_emp,
			dept_manager,
			employees,
			salaries,
			titles;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(10),
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    hire_date DATE
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
    emp_no INT NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

--List the employee number, last name, first name, sex, and salary of each employee.

SELECT 
    e.emp_no, 
    e.last_name, 
    e.first_name, 
    e.gender, 
    s.salary
FROM 
    employees e
JOIN 
    salaries s
ON 
    e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT 
	e.first_name,
	e.last_name,
	e.hire_date
FROM employees e 
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;


--List the manager of each department along with their department number, department name, employee number, last name, and first name

SELECT 
    d.dept_no,
	d.dept_name,
	e.emp_no, 
    e.last_name, 
    e.first_name
FROM 
	dept_manager dm
JOIN
	employees e ON dm.emp_no = e.emp_no
JOIN 
	departments d ON dm.dept_no = d.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT 
    d.dept_no,
	d.dept_name,
	e.emp_no, 
    e.last_name, 
    e.first_name
FROM 
	dept_emp de
JOIN
	employees e ON de.emp_no = e.emp_no
JOIN 
	departments d ON de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT 
	e.first_name,
	e.last_name,
	e.gender
FROM 
	employees e 
WHERE 
	e.first_name = 'Hercules' 
	AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
	d.dept_name,
	e.emp_no, 
    e.last_name, 
    e.first_name
FROM 
	dept_emp de
JOIN
	employees e ON de.emp_no = e.emp_no
JOIN 
	departments d ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	d.dept_name,
	e.emp_no, 
    e.last_name, 
    e.first_name
FROM 
	dept_emp de
JOIN
	employees e ON de.emp_no = e.emp_no
JOIN 
	departments d ON de.dept_no = d.dept_no
WHERE 
	dept_name = 'Development'
	OR dept_name = 'Sales';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT 
    e.last_name, 
    COUNT(*) AS frequency
FROM 
    employees e
GROUP BY 
    e.last_name
ORDER BY 
    frequency DESC;
	

