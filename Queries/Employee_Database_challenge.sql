-- *** I saved retirement_titles.csv, unique_titles.csv and retiring_titles.csv into my Data Folder upon completing Deliverable 1.***

-- Module 7 Challenge
-- https://courses.bootcampspot.com/courses/1225/assignments/24838?module_item_id=498094

-- Deliverable 1:
-- 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.
-- 3. Create a new table using the INTO clause.
-- 4. Join both tables on the primary key.
-- 5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
-- 6. Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 7. Before you export your table, comfirm that it looks like this image:
-- https://courses.bootcampspot.com/courses/1225/files/1402710/preview

-- Note: There are duplicate entries for some employees because they have switched titles over the years. Use the following instructions to remove these duplicates and keep only the most recent title of each employee.

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS e
	INNER JOIN titles AS ti
		ON (e.emp_no = ti.emp_no)
		WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
		ORDER BY e.emp_no ASC;

SELECT * FROM retirement_titles;



-- 8. Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
-- 9. Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
-- (These columns will be in the new table that will hold the most recent title of each employee.)
-- 10. Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
-- HINT: The DISTINCT ON statement is used specifically with PostgreSQL databases. With the DISTINCT ON statement, you can retrieve a single row defined by the ON () clause. The row that is returned is specified by the ORDER BY clause.
-- Check out this SQL documentationLinks (https://www.postgresql.org/docs/9.5/sql-select.html) for an explanation of how to use the DISTINCT ON statement.
-- 11. Exclude those employees that have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.
-- 12. Create a Unique Titles table using the INTO clause.
-- 13. Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.
-- 14. Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 15. Before you export your table, confirm that it looks like this image:
-- https://courses.bootcampspot.com/courses/1225/files/1402763/preview

SELECT DISTINCT ON (emp_no) emp_no,
    first_name,
    last_name,
    title
INTO unique_titles
FROM retirement_titles 
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;



-- 16. Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
-- 17. First, retrieve the number of titles from the Unique Titles table.
-- 18. Then, create a Retiring Titles table to hold the required information.
-- 19. Group the table by title, then sort the count column in descending order.
-- 20. Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 21. Before you export your table, confirm that it looks like this image:
-- https://courses.bootcampspot.com/courses/1225/files/1403196/preview
-- Save your Employee_Database_challenge.sql file in your Queries folder in the Pewlett-Hackard folder.

SELECT COUNT (ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT (ut.emp_no) DESC;

SELECT * FROM retiring_titles;