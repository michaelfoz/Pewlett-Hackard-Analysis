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