-- Deliverable 1 Queries

-- Retirement Titles table for employees born between 1952 and 1955
SELECT emp_no, first_name, last_name, birth_date
INTO employees_retirement
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM employees_retirement

SELECT e.emp_no, 
e.first_name, 
e.last_name, 
ti.title, 
ti.from_date, 
ti.to_date
INTO retirement_titles
FROM employees_retirement as e 
INNER JOIN titles as ti
ON ti.emp_no = e.emp_no;

SELECT * FROM retirement_titles

--Unique Titles table 
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles

--Retiring Titles table for count of employees retiring in each title
SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count desc;

SELECT * FROM retiring_titles