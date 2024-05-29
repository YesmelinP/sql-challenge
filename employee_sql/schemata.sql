-- drop tables are list in this logical order to make sure the query runs more than once if for whatever reason we'd like to drop tables.
-- DROP TABLE IF EXISTS salaries;
-- DROP TABLE IF EXISTS dept_employees;
-- DROP TABLE IF EXISTS dept_manager;
-- DROP TABLE IF EXISTS departments;
-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS titles;

-- data engineering part of the challenge
-- creating tables 

CREATE TABLE departments (
    dept_no character varying(4) PRIMARY KEY NOT NULL,
    dept_name character varying(60) NOT NULL
);

CREATE TABLE titles (
    title_id character varying(5) PRIMARY KEY NOT NULL,
    title character varying(60) NOT NULL
);

CREATE TABLE employees (
    emp_no integer PRIMARY KEY NOT NULL,
    emp_title_id character varying(5)NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    sex character(1)NOT NULL,
    hire_date date NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

-- for this one i created the composite key since columns are not unique
CREATE TABLE dept_employees (
    emp_no integer NOT NULL,
    dept_no character varying(4) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- for this one i created the composite key since columns are not unique
CREATE TABLE dept_manager (
	dept_no character varying(4) NOT NULL,
    emp_no integer PRIMARY KEY NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries (
    emp_no integer PRIMARY KEY NOT NULL ,
    salary integer NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- displaying columns to confirm we have the correct data per table
SELECT *
FROM departments;

SELECT *
FROM titles;

SELECT *
FROM employees;

SELECT *
FROM dept_employees;

SELECT *
FROM dept_manager;

SELECT *
FROM salaries;