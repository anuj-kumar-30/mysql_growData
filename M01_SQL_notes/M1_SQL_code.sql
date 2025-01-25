-- cmd to list all the databases
SHOW DATABASES;

-- cmd to create a database
CREATE DATABASE if not EXISTS noob_db;

-- cmd to get inside a database
use noob_db;

-- cmd to create a table (DDL)
CREATE TABLE if not EXISTS employee
(
    id INT,
    emp_name VARCHAR(20)
);

-- cmd list all tables
SHOW TABLES;

-- cmd to see the table definition
SHOW CREATE TABLE employee;

-- employee table with few more columns
CREATE TABLE if not exists employee_v1
(
    id INT,
    name VARCHAR(50),
    salary DOUBLE,
    hiring_date DATE
);

-- SYNTAX-01: TO insert data into a table
INSERT INTO employee_v1 VALUES(1, 'Anuj kumar', 1000, '2025-02-07');

-- SYNTAX-02: To insert data into a table with spacefic column
INSERT INTO employee_v1(salary, name, id) VALUES(2000, 'akash', 2);

-- SYNTAX-03: To insert multiple data into a table
INSERT INTO employee_v1 VALUES(3, 'ashish kumar', 3000, '2025-02-12'),
(4, 'nripesh kumar yadav', 4000, '2001-02-13'),
(5, 'sunita kumari', 5000, '2000-02-15');

-- cmd to view all the contents of table
SELECT * FROM employee_v1;

-- adding integrity contraints to our table
CREATE Table if not exists employee_with_contraints
(
    id INT,
    name VARCHAR(50) NOT NULL,
    salary DOUBLE,
    joining_date DATE DEFAULT '2021-01-01',
    constraint unique_emp_id UNIQUE(id),
    constraint salary_check check(salary > 1000)
);

SHOW TABLEs;


--- Example 1 for IC failure
--- Exception - Column 'name' cannot be null
insert into employee_with_constraints values(1,null,3000,'2021-11-20');

--- Correct record
insert into employee_with_constraints values(1,'Shashank',3000,'2021-11-20');

--- Example 2 for IC failure
--- Exception - Duplicate entry '1' for key 'employee_with_constraints.id'
insert into employee_with_constraints values(1,'Rahul',5000,'2021-10-23');

--- Another correct record because Unique can accept NULL as well
insert into employee_with_constraints 
values(null,'Rahul',5000,'2021-10-23');

--- Example 3 for IC failure
--- Exception - Duplicate entry NULL for key 'employee_with_constraints.id'
insert into employee_with_constraints 
values(null,'Rajat',2000,'2020-09-20');


--- Example 4 for IC failure
--- Exception - Check constraint 'employee_with_constraints_chk_1' is violated
insert into employee_with_constraints 
values(5,'Amit',500,'2023-10-24');

--- Test IC for default date
insert into employee_with_constraints(id,name,salary)
values(7,'Neeraj',3000);

select * from employee_with_constraints;

--- Example table for integrity constraints
CREATE TABLE if not EXISTS employee_with_constraints_tmp
(
	id INT,
    name VARCHAR(50) NOT NULL,
    salary DOUBLE, 
    hiring_date DATE DEFAULT '2021-01-01',
    Constraint unique_emp_id UNIQUE (id),
    Constraint salary_check CHECK (salary > 1000)
);

--- Check the name of constraint when it fails
--- Exception - Check constraint 'salary_check' is violated
insert into employee_with_constraints_tmp 
values(5,'Amit',500,'2023-10-24');