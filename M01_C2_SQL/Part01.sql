SHOW DATABASES;

CREATE DATABASE class2_db;

USE class2_db;

CREATE Table employee
(
    id INT,
    name VARCHAR(50),
    address VARCHAR(50),
    city VARCHAR(50)
);

SHOW CREATE TABLE employee;

INSERT INTO employee values(1, 'Anuj kumar', 'Rajendra colony', 'Naugachia');

SELECT * from employee;

-- ALTER DDL COMMAND

-- adding new column
ALTER Table employee
add COLUMN DOB DATE;
show CREATE TABLE employee;

-- changing data type of column using alter command
ALTER Table employee
MODIFY COLUMN name VARCHAR(100);
SHOW CREATE TABLE employee;

-- rename the column using alter command
ALTER Table employee
RENAME COLUMN name to full_name;
SHOW CREATE TABLE employee;

-- deleting city column using alter command
ALTER Table employee
DROP COLUMN city;
SHOW CREATE TABLE employee;

-- Truncate, Drop, Delete
TRUNCATE Table employee;
SHOW CREATE TABLE employee;
SELECT * FROM employee;
-- Delete
-- Delete from table_name
-- where id=1;
-- drop
DROP Table employee;
SELECT * from employee;

-- Using alter for integrity constraints
CREATE Table if NOT exists employee
(
    id INT,
    name VARCHAR(50),
    age INT,
    hiring_data DATE,
    salary INT,
    city VARCHAR(50)
);

INSERT into employee VALUES(1, 'anuj kumar', 24, '2024-02-03', 20000,'naugachia'),
(2,'Ashish kumar', 27, '2020-02-02', 30000, 'naugachia'),
(3,'Akash kumar', 25, '2020-02-03', 40000, 'Kathiar'),
(4,'Alok kumar', 24, '2020-03-02',40000, 'Delhi'),
(5,'Abhishek', 25, '2020-03-04', 50000, 'New delhi'),
(6,'Arvind kumar', 20, '2020-03-04', 60000, 'Noida');

SELECT * from employee;

-- adding contraint to id column
ALTER Table employee
add constraint unique_id UNIQUE(id);
SHOW CREATE TABLE employee;

INSERT INTO employee VALUES(1,'aads', 29, '2020-02-02', 30, 'noida');

-- removing contraint from predefined table
ALTER Table employee
DROP constraint unique_id;
show CREATE TABLE employee;

-- PRIMARY KEY and FOREIGN KEY
-- Primary key:
-- uniqueness
-- immutable: PK value should not change once set
-- simplicity: its ideal to keep PK simple as possible
-- Non-intelligent: they shoun't contain meaningfull information
-- Indexed: PK are automatically indexed for faster data retrival
-- Referential integrity: they serve as the basis for foreign key in other table

CREATE Table customers
(
    cust_id int,
    name VARCHAR(50),
    age INT,
    constraint pk PRIMARY KEY(cust_id)
);
INSERT INTO customers VALUES(1,'Anuj kumar', 24),
(2,'Ashish kumar', 27);
SELECT * FROM customers;

-- Foreign key
-- Referential integrity: FK links records between tables, mainting data consistency
-- Nullable: FK can be NULL, unless specifically restricated
-- Match PK: Each FK value must match a PK value in the parent table, or be null
-- Ensure relations: they define the relationship between tables in database
-- No-uniqueness

CREATE Table orders
(
    order_id int,
    order_date DATE,
    cx_id int,
    constraint pk PRIMARY KEY(order_id),
    constraint fk Foreign Key (cx_id) REFERENCES customers(cust_id)
);
INSERT INTO orders VALUES(1, '2024-01-29', 1),
(2,'2024-02-02',2),
(3,'2020-02-09',2);
SELECT * FROM orders;

INSERT INTO orders VALUES(4, '2020-03-04', 5); -- this will throw error bcoz cx_id '5' is not present in the parent table customers
INSERT INTO orders VALUES(4, '2020-03-04', NULL); -- FK can be NULL
DROP Table customers; -- it con't be dropped because customers table is being refrenced in the orders table 

-- SELECT command
drop TABLE employee;
CREATE Table employee
(
    id int,
    name varchar(50),
    age int,
    hiring_date DATE,
    salary INT,
    city VARCHAR(50)
);

insert into employee values(1,'Shashank', 24, '2021-08-10', 10000, 'Lucknow');

insert into employee values(2,'Rahul', 25, '2021-08-10', 20000, 'Khajuraho');

insert into employee values(3,'Sunny', 22, '2021-08-11', 11000, 'Bangalore');

insert into employee values(5,'Amit', 25, '2021-08-11', 12000, 'Noida');

insert into employee values(1,'Puneet', 26, '2021-08-12', 50000, 'Gurgaon');

SELECT * FROM employee;

select name as emp_name,
salary as emp_salary
from employee;

select COUNT(*) as number_of_employees FROM employee;
select COUNT(1) as number_of_employees FROM employee;

SELECT DISTINCT(hiring_date) as unique_hiring_date from employee;

-- count the number of unique hiring date
SELECT COUNT(DISTINCT(hiring_date)) as DISTINCT_hiring_date_count FROM employee;

SELECT name,
salary as old_salary,
salary*1.2 as new_salary
FROM employee;

-- UPDATE cmd
-- update salary with 20% increament and age by 2 year
UPDATE employee set salary=salary*1.2,age=age+2;
SELECT * FROM employee;

-- WHERE clause
-- employee earning more than 20,000
SELECT * FROM employee
where salary>20000;

update employee set salary=80000
where hiring_date='2021-08-10';

-- delete records of those joined the company on 2021-08-10
DELETE FROM employee WHERE hiring_date='2021-08-10';

-- Auto-increment
CREATE Table dummy_table
(
    id int AUTO_INCREMENT,
    name VARCHAR(50),
    PRIMARY KEY(id)
);
INSERT INTO dummy_table values(1,'anuj');
INSERT INTO dummy_table VALUES(3,'ashish');
INSERT INTO dummy_table(name) VALUES('akash');
SELECT * FROM dummy_table;

-- LIMIT cmd
SELECT * FROM employee
LIMIT 3;

-- ORDER BY clause
SELECT * FROM employee
ORDER BY name;

SELECT * FROM employee
WHERE salary BETWEEN 10000 and 20000;