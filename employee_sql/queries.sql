-- Data Analysis
-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM employees
JOIN salaries 
	ON employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, 
	last_name, 
	hire_date
FROM employees
WHERE EXTRACT (YEAR FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.emp_no, 
	dept_manager.dept_no,
	departments.dept_name, 
	employees.first_name, 
	employees.first_name
FROM dept_manager
JOIN departments 
	ON dept_manager.dept_no = departments.dept_no
JOIN employees 
	ON dept_manager.emp_no = employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

CREATE VIEW "departments_and_employees" AS

SELECT dept_employees.dept_no, 
	departments.dept_name, 
	dept_employees.emp_no, 
	employees.first_name,
	employees.last_name
FROM dept_employees 
JOIN departments 
	ON dept_employees.dept_no = departments.dept_no
JOIN employees 
	ON dept_employees.emp_no = employees.emp_no;

SELECT*
FROM departments_and_employees	

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, 
	last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT dept_name, 
	emp_no, 
	first_name, 
	last_name
FROM departments_and_employees
WHERE  dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT dept_name,
	emp_no,
	first_name,
	last_name
FROM departments_and_employees
WHERE  dept_name = 'Sales'
	OR dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, 
	COUNT(emp_no) AS "count_shared_last_name"
FROM employees
GROUP BY last_name
ORDER BY "count_shared_last_name" DESC;