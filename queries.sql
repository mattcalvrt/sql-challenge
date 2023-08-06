--1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Employees".sex, "Salaries".salary
FROM "Salaries"
LEFT OUTER JOIN "Employees" ON
"Employees".emp_no="Salaries".emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE 
	hire_date BETWEEN '1986-01-01' AND '1986-12-31'

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
--Review data

SELECT d.dept_no, d.dept_name, dm.emp_no, ee.last_name, ee.first_name
FROM "DepartmentManager" AS dm
INNER JOIN "Departments" AS d ON
	d.dept_no=dm.dept_no
INNER JOIN "Employees" AS ee ON
	ee.emp_no=dm.emp_no;
	
--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT ee.emp_no, ee.last_name, ee.first_name, de.dept_no, d.dept_name
FROM "Employees" AS ee
INNER JOIN "DepartmentEmployee" AS de ON
	de.emp_no=ee.emp_no
INNER JOIN "Departments" AS d ON
	d.dept_no=de.dept_no;
	
--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND
	last_name LIKE 'B%';
	
--6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT de.emp_no, ee.last_name, ee.first_name, d.dept_name
FROM "Employees" AS ee
INNER JOIN "DepartmentEmployee" as de ON
	de.emp_no=ee.emp_no
INNER JOIN "Departments" as d ON
	d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT de.emp_no, ee.last_name, ee.first_name, d.dept_name 
FROM "Employees" AS ee
INNER JOIN "DepartmentEmployee" as de ON
	de.emp_no=ee.emp_no
INNER JOIN "Departments" as d ON
	d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales' OR 
	d.dept_name = 'Development';
	
--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT last_name, COUNT(first_name) AS "Number of Employees"
FROM "Employees"
GROUP BY last_name
ORDER BY "Number of Employees" DESC