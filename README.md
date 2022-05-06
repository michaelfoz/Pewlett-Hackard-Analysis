# Pewlett-Hackard-Analysis Overview: 
#### We are introduced to Structred Query Language (SQL) in Module 7, which we use to explore and manipulate large datasets.  In this case, we examine the data of a company, Pewlett-Hackard (est. 1955), that is preparing for a large wave of employees that are in the midst of retiring. The company terms or coins this large wave of retirees as the "silver tsunami." The company aims to fill the upcoming employment vacancies by implementing a mentorship program.
####
### The tools we use in creating our analysis are:
#### (1) a relational database system, PostgreSQL (or "Postgres"), which consists of tables and their relationships;
#### (2) Quick DBD through (http://quickdatabasediagrams.com/), where create an Entity Relationship Diagram (ERD), which is essentially a flow chart or an organizational tool that provides a visual of the different tables we create and the relationships said tables have with one another;
#### (3) pgAdmin, which is essentially the "window" to our database wherein we are able to write and execute queries on datasets.
#### 
### The company provides us with the following CSV files: 
(1) departments.csv, 
(2) dept_emp.csv, 
(3) ept_manager.csv, 
(4) employees.csv, 
(5) salaries.csv, 
(6) titles.csv 
#### We first create a Conceptual Diagram based on the files that were provided.  We use Quick DBD to form tables based on each file (Departments, Employees, Managers, Dept_Emp, Salaries, Titles).
#### Upon opening the files, we find that they can each contain common columns that would appear the same in other files, as well as their own unique column that other files do not contain.  Based on the common columns each file contains and each file's own particular column, we determine which columns act as a primary key and a foreign key in our Logial Diagram.
#### Finally, in our Physical Diagrams, we establsish the relationships that the tables have with one another (whether this would be one-To-one, one-To-many, etc.
#### Our final products include a flow chart and a schema that we save as a text file and use in pgAdmin window's query tool to further manipulate the data.
## Results:
#### We continue to write SQL statements in our schema in order to query our already-existing data and create additional tables in PostgreSQL. From these tables, we are able to export the filtered data into new CSV files.  The new files we created are: 
#### (1) retirement_titles.csv, (2) unique_titles.csv, (3) retiring_titles.csv, (4) mentorship_eligibility.csv.
#### (The queries used in order to create the tables for the files above are found in Employee_Database_challenge.sql of the Queries folder).
#### ● (1) The retirement_titles.csv file displays all retiring employees, containing each employee's employee number (emp_no), first and last names (first_name, last_name), titles (title), and their from_date and their to_date. Using the query: 
#### SELECT * FROM retirement_titles;
#### we are able to see that there are a total of 133,776 employees within the table.

#### ● (2) The unique_titles.csv file derives from retirement_titles.csv and has a focus on the number of employees who are about to retire along with their most recent job title(s). The table consists of the employee's employee number (emp_no), the employee's first and last names (first_name, last_name), and title (title). 

#### ● (3) The retiring_employees.csv file summarizes the employee title as a category and displays or sums up the total of how many employees working as said title--whether the title would be Senior Engineer, Senior Staff, Engineer, Staff, Technique Leadewr, Assistant Engineer or Manger--are retiring. 
#### ● mentorship_eligibility.csv

#### ● (4) The mentorship_eligibility.csv file is the company's main focus, wherein there is a focus on current employees (to_date of 9999-01-01) born between January 1, 1965 (1965-01-01) and December 31, 1965 (1965-12-31).
