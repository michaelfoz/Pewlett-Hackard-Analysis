# Pewlett-Hackard-Analysis Overview: 
#### We are introduced to Structred Query Language (SQL) in Module 7, which we use to explore and manipulate large datasets.  In this case, we examine the data of a company, Pewlett-Hackard (est. 1955), that is preparing for a large wave of employees that are in the midst of retiring. The company terms or coins this large wave of retirees as the "silver tsunami." The company aims to fill the upcoming employment vacancies by implementing a mentorship program.
####
### The tools we use in creating our analysis are:
#### (1) a relational database system, PostgreSQL (or "Postgres"), which consists of tables and their relationships;
#### (2) Quick DBD through (http://quickdatabasediagrams.com/), where create an Entity Relationship Diagram (ERD), which is essentially a flow chart or an organizational tool that provides a visual of the different tables we create and the relationships said tables have with one another;
#### (3) pgAdmin, which is essentially the "window" to our database wherein we are able to write and execute queries on datasets.
#### 
### The company provides us with the following CSV files: 
departments.csv, 
dept_emp.csv, 
ept_manager.csv, 
employees.csv, 
salaries.csv, 
titles.csv 
#### We first create a Conceptual Diagram based on the files that were provided.  We use Quick DBD to form tables based on each file (Departments, Employees, Managers, Dept_Emp, Salaries, Titles).
#### Upon opening the files, we find that they can each contain common columns that would appear the same in other files, as well as their own unique column that other files do not contain.  Based on the common columns each file contains and each file's own particular column, we determine which columns act as a primary key and a foreign key in our Logial Diagram.
#### Finally, in our Physical Diagrams, we establsish the relationships that the tables have with one another (whether this would be one-To-one, one-To-many, etc.
#### Our final products include a flow chart and a schema that we save as a text file and use in pgAdmin window's query tool to further manipulate the data.


## Results:
#### (To do)
## Summary:
#### (To do)
