-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no,e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.*, e.emp_no, e.last_name, e.first_name
FROM dept_manager dm
LEFT JOIN departments d
ON dm.dept_no = d.dept_no
LEFT JOIN employees e
ON dm.emp_no = e.emp_no

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.*
FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
LEFT JOIN departments d
ON de.dept_no = d.dept_no
ORDER by "emp_no"

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE last_name LIKE 'B%' AND first_name = 'Hercules'
ORDER BY "emp_no"

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
LEFT JOIN departments d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
ORDER by "emp_no"

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name
LEFT JOIN departments d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales' AND dept_name = 'Development'
ORDER by "emp_no"


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT count(last_name) AS frequency_counts, last_name
FROM employees 
GROUP BY last_name 
ORDER BY frequency_counts desc
