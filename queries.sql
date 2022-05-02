SELECT * FROM departments;

-- Make sure all tables have information uploaded from individual CSV files
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM dept_emp;
SELECT * FROM titles;

-- Drop tables due to error when attempting to import CSV files
-- Error occured because from_date and hire_date were INT and not DATE;
DROP TABLE dept_emp CASCADE;
DROP TABLE titles CASCADE;

-- Re-created dept_emp and titles tables with from_date and to_date as DATE
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  PRIMARY KEY (emp_no, from_date)
);

-- Able to upload CSV files upon creating new tables

-- Verify CSV data was imported into dept_emp and titles
SELECT * FROM dept_emp;
SELECT * FROM titles;

-- Determine retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Narrow the search for retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Count the queries (Number of retiring employees)
-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create new tables
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Verify new table was created and there is data within table
SELECT * FROM retirement_info;

-- Export retirement_info as CSV within the Data folder of the Pewlett-Hackard-Analysis folder
-- Steps to export (https://courses.bootcampspot.com/courses/1225/pages/7-dot-3-1-query-dates?module_item_id=498065):
-- 1. Keep the Import/Export button toggled to "Export."
-- 2. Click on the ... in the Filename field to automatically select the same directory from which you imported the other CSVs. Select a directory, but be sure to rename it to retirement_info.csv.
-- 3. Be sure the format is still CSV.
-- 4. Toggle the Header section to "Yes" to include column names in the new CSV files.
-- 5. Select the comma as the delimiter to maintain the same format with all CSV files.
-- 6. Click OK to start the export. After the file has been created, pgAdmin will confirm our file is ready to be viewed.

-- Joining tables (https://courses.bootcampspot.com/courses/1225/pages/7-dot-3-2-join-the-tables?module_item_id=498068)
-- for future reference: LEFT JOIN (AKA LEFT OUTER JOIN) returns all of the records from the "left" table plus only the mathching records from the "right" table
-- IMPORTANT
-- Use the full outer join with caution!
-- NOTE
-- For more information: https://www.techonthenet.com/postgresql/joins.php

-- Recreate the retirement_info Table with the emp_no Column
-- First, drop the current retirement_info table
DROP TABLE retirement_info; 

-- Next, create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;



-- Use Inner Join for Departments and dept-manager Tables
-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Use Left Join to Capture retirement-info Table
-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
	retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Use Aliases for Code Readability
-- Joining tables can get messy. There are several different table and column name combinations to keep track of, and they can get lengthy as the query is created.
-- SQL has a method to shorten the code and provide greater readability by using an alias instead of a full tablename.
-- IMPORTANT
-- An alias in SQL allows developers to give nicknames to tables. This helps improve code readability by shortening longer names into one-, two-, or three-letter temporary names. This is commonly used in joins because multiple tables and columns are often listed.



-- Each table name can be shortened to a nickname (e.g., retirement_info becomes "ri").

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01')


-- Rename departments to "d" and dept_manager to "dm"
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;



-- Use Count, Group By and Order By
-- https://courses.bootcampspot.com/courses/1225/pages/7-dot-3-4-use-count-group-by-and-order-by?module_item_id=498075

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Create table retiring employees
SELECT COUNT(ce.emp_no), de.dept_no
INTO dept_retiree
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.dept_no
GROUP BY de.dept_no 