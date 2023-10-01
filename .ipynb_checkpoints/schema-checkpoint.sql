CREATE TABLE titles (
 	title_id VARCHAR PRIMARY KEY,
 	title VARCHAR NOT NULL
);

CREATE TABLE employees (
	emp_no INTEGER unique NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date VARCHAR NOT NULL,
	FOREIGN KEY(emp_title_id) REFERENCES titles (title_id),
	PRIMARY KEY (emp_no,emp_title_id)
);

CREATE TABLE departments (
 	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_emp (
	dept_emp_id SERIAL PRIMARY KEY,
 	emp_no INTEGER NOT NULL,
 	dept_no VARCHAR NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);
DROP TABLE dept_manager
CREATE TABLE dept_manager (
	manager_id SERIAL PRIMARY KEY,
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE salaries (
 	emp_no INTEGER PRIMARY KEY,
 	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;


